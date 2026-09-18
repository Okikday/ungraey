# Ungraey — Implementation Plan
### "Don't trash it, cash it." — Decentralized AI Waste-to-Commodity Marketplace

---

## Executive Summary & Hackathon Pitch

**Ungraey** solves a fundamental flaw in the circular economy: **recycling is passive, broken, and inconvenient.** Everyday individuals toss valuable raw materials (moving boxes, scrap wood from DIY, textiles, clean glass jars, leftover building supplies) into landfills because putting things in the trash has zero friction. Simultaneously, local artisans, ceramicists, small businesses, thrift flippers, and makers routinely spend significant money buying these exact materials new.

**The Solution**: A high-velocity, cross-platform mobile marketplace backed by **Serverpod** and **Flutter** that treats everyday waste as a localized commodity with tangible monetary and ecological value.

```
┌─────────────────┐       ┌─────────────────┐       ┌─────────────────┐
│   THE BOUNTY    │       │    THE SNAP     │       │    THE MATCH    │
│ Demand posted   │  ◄─►  │ AI vision tags  │  ──►  │ Instant radius  │
│ by local makers │       │ material pile   │       │ match & payout  │
└─────────────────┘       └─────────────────┘       └─────────────────┘
                                                             │
                                                             ▼
                                                    ┌─────────────────┐
                                                    │   THE HANDOFF   │
                                                    │ QR verification │
                                                    │ & Impact metric │
                                                    └─────────────────┘
```

### Key "Tech Magic" Highlights for Judges:
1. **Instant On-Device / Fast Vision Material Classification**: Real-time multi-label tagging (corrugated cardboard, treated lumber, textiles, glass jars) with confidence scores and estimated weight.
2. **5-Mile Proximity Bidding & Real-Time Sync**: Instant matching engine connecting seller piles with active buyer bounties in real time via Serverpod streams.
3. **Closed-Loop QR Handoff & Value Settlement**: Single-use cryptographic QR exchange for fraud-proof handoffs, crediting cash, points, or barter items.
4. **Earth Forward Impact Visualizer**: Translating physical transactions into verified ecological metrics (kg of waste diverted, kg CO2e avoided, tree equivalents) with fluid, spring-animated dashboard dials.
5. **Aura Design System**: Apple-grade aesthetic featuring calibrated luminescence, 10-stop dissolve masks (`BackdropShadow`), tactile spring physics (`KCurves`), and modular Riverpod Pod architecture.

---

## User Review Required

> [!IMPORTANT]
> **Strict Adherence to Workspace & Frontend Rules (`rules.md`)**:
> - **Max 200 lines per UI file**: Every screen and widget file will stay strictly under 200 lines. Monolithic widgets are prohibited; modular components are extracted into `ui/widgets/`.
> - **Zero inlined helper build methods**: No `Widget _buildSomething(...)` methods; every component is an independent `StatelessWidget` / `ConsumerWidget`.
> - **Riverpod Pod Architecture**: Uses `NotifierProvider`, static `me` accessors, `Equatable` states, and `ext_on_*_pod.dart` extension part files.
> - **Separation of Actions**: All modals, camera launches, QR scans, and navigation logic reside exclusively in `ui/actions/<feature>_actions.dart`.
> - **Serverpod Best Practices**: Never edit generated code; use migrations for schema updates; leverage built-in authentication and cloud/database storage.

> [!IMPORTANT]
> **GitGuardian & Secret Leak Prevention**:
> - Ensure all `.env`, `*.env`, `config/passwords.yaml`, `credentials.json`, and API keys are strictly listed in `.gitignore`.
> - Never hardcode fake or test secret strings that trigger regex patterns (e.g. `sk-...`, `ghp_...`, `AKIA...`).
> - Use Serverpod's native `passwords.yaml` (gitignored) and Flutter's `--dart-define` for configuration.

---

## Proposed System Architecture

### 1. Security & GitGuardian Safeguards

- **Root & Package `.gitignore` Updates**:
  Ensure `.gitignore` explicitly contains:
  ```gitignore
  # Secrets and Credentials
  *.env
  .env
  .env.*
  config/passwords.yaml
  config/firebase_service_account_key.json
  *.pem
  *.key
  credentials.json
  ```
- **Secret Injection**:
  - Flutter client: `const String.fromEnvironment('SERVER_URL', defaultValue: 'http://localhost:8080/')`
  - Serverpod: `pod.getPassword('...')` or `Platform.environment['...']`.

---

### 2. Backend Architecture (`ungraey_server`)

Built with Serverpod 4.0, structured for PostgreSQL persistence and real-time streaming:

#### Data Models (`lib/src/models/` via `.spy.yaml`)
1. **`material_category.spy.yaml`** (Enum):
   - `corrugatedCardboard`, `treatedLumber`, `hardwoodScrap`, `scrapDenimTextiles`, `cleanGlassJars`, `electronicsScrap`, `metalScrap`, `plasticContainers`, `other`
2. **`reward_type.spy.yaml`** (Enum):
   - `cash`, `points`, `trade`
3. **`bounty.spy.yaml`** (Table: `bounties`):
   - `creatorId`: `int`
   - `creatorName`: `String`
   - `title`: `String`
   - `description`: `String`
   - `category`: `MaterialCategory`
   - `quantityNeeded`: `int`
   - `quantityFulfilled`: `int`
   - `rewardAmountCents`: `int`
   - `rewardType`: `RewardType`
   - `tradeItemDescription`: `String?`
   - `latitude`: `double`
   - `longitude`: `double`
   - `addressSnippet`: `String`
   - `radiusMiles`: `double`
   - `status`: `String` (`active`, `fulfilled`, `cancelled`)
   - `createdAt`: `DateTime`
4. **`snap.spy.yaml`** (Table: `snaps`):
   - `userId`: `int`
   - `imageUrl`: `String`
   - `detectedCategories`: `List<MaterialCategory>`
   - `detectedLabels`: `List<String>`
   - `estimatedWeightKg`: `double`
   - `latitude`: `double`
   - `longitude`: `double`
   - `status`: `String` (`available`, `matched`, `handedOff`)
   - `createdAt`: `DateTime`
5. **`handoff_transaction.spy.yaml`** (Table: `handoff_transactions`):
   - `snapId`: `int`
   - `bountyId`: `int`
   - `sellerId`: `int`
   - `buyerId`: `int`
   - `qrToken`: `String`
   - `rewardAmountCents`: `int`
   - `rewardType`: `RewardType`
   - `kgDiverted`: `double`
   - `co2eSavedKg`: `double`
   - `status`: `String` (`pending`, `completed`, `expired`)
   - `completedAt`: `DateTime?`
   - `createdAt`: `DateTime`
6. **`eco_impact.spy.yaml`** (Table: `eco_impacts`):
   - `userId`: `int`
   - `totalKgDiverted`: `double`
   - `totalCo2eSavedKg`: `double`
   - `treesSavedEquivalent`: `double`
   - `waterSavedLiters`: `double`
   - `pointsBalance`: `int`
   - `completedHandoffsCount`: `int`
   - `updatedAt`: `DateTime`

#### Serverpod Endpoints (`lib/src/endpoints/`)
1. **`BountyEndpoint`**:
   - `createBounty(Session session, Bounty bounty)`
   - `listBounties(Session session, {double? lat, double? lon, double? radiusMiles, MaterialCategory? category})`
   - `getBounty(Session session, int id)`
   - `cancelBounty(Session session, int id)`
2. **`SnapEndpoint`**:
   - `submitSnap(Session session, Snap snap)`
   - `findMatchesForSnap(Session session, int snapId)`: Calculates Haversine distance and category overlap within 5 miles.
   - `streamNearbyAlerts(Session session)`: Real-time PubSub stream broadcasting new nearby material snaps to active buyers.
3. **`HandoffEndpoint`**:
   - `initiateHandoff(Session session, int snapId, int bountyId)`: Generates time-limited signed QR token.
   - `confirmHandoff(Session session, String qrToken)`: Atomic transaction verifying the exchange, crediting rewards, updating EcoImpact stats, and marking both Snap and Bounty as completed.
4. **`ImpactEndpoint`**:
   - `getUserImpact(Session session, int userId)`
   - `getCommunityImpact(Session session)`: Aggregated global metrics for live community impact ticker.

---

### 3. Frontend Architecture (`ungraey_flutter`)

Following the **Flutter Deterministic Blueprint** (`rules.md`):

```
lib/
├── app/
│   ├── app.dart                   # Root MaterialApp.router with Aura theme
│   ├── app_provider.dart          # AppNotifier managing theme, session, connectivity
│   ├── app_state.dart             # AppState (themeMode, isAuthenticated, isOnline)
│   ├── constants/app_constants.dart
│   └── routes/app_router.dart     # GoRouter configuration
├── core/
│   ├── base/
│   │   ├── extensions/src/extension_on_provider.dart # Pod extension helpers (.watch, .read, .not)
│   │   └── mixins/text_editing_controller_factory_mixin.dart
│   ├── enums/                     # MaterialCategory, RewardType, HandoffStatus
│   └── utils/
│       ├── misc/result.dart       # Result<T> functional error handler
│       ├── ui/nav_utils.dart
│       └── ui/ui_utils.dart       # Toasts, haptics, spring sheets
├── data/
│   ├── shared_preferences/shared_prefs.dart
│   └── storage/secure_storage.dart
├── network/
│   ├── api.dart                   # Singleton Api wrapping ungraey_client
│   └── client.dart                # Serverpod Client setup
├── shared/
│   ├── components/                # Design System implementations
│   │   ├── backdrop_shadow.dart   # 10-stop Apple-grade gradient dissolve mask
│   │   ├── scale_click_wrapper.dart # Decoupled press compression with ValueNotifier
│   │   ├── canvas_grid_painter.dart # Vector dot-matrix background
│   │   ├── search_highlighted_text.dart # Live search keyword highlighting
│   │   ├── k_curves.dart          # Calibrated spring curves
│   │   ├── unified_action_pill.dart # Search + Filter fused pill
│   │   ├── gradient_footer.dart   # Symmetrical outward gradient footer
│   │   └── eco_badge.dart         # Pill badge for carbon / impact stats
│   └── theme/
│       ├── app_theme_extension.dart # Dynamic linear gradient card extensions
│       ├── pure_theme_extension.dart # Semantic tokens (primary, surface, card, etc.)
│       ├── pure_dark_theme_extension.dart # Volcanic charcoal + luminous jade
│       ├── pure_light_theme_extension.dart # Clean alabaster + forest emerald
│       └── app_theme.dart         # ThemeData builder with Aura tokens
└── features/
    ├── main/                      # STRICTLY shell & navigation dock
    │   ├── ui/screens/main_shell_view.dart
    │   ├── ui/widgets/main_floating_dock.dart
    │   ├── providers/main_pod.dart
    │   └── providers/main_state.dart
    ├── snap/                      # The Snap: AI Camera & Material Classification
    │   ├── logic/material_classifier.dart # Fast local ML / heuristic tagger
    │   ├── ui/screens/snap_camera_view.dart
    │   ├── ui/screens/snap_match_view.dart
    │   ├── ui/widgets/camera_viewfinder_hud.dart
    │   ├── ui/widgets/detected_material_chips.dart
    │   ├── ui/widgets/instant_match_card.dart
    │   ├── ui/widgets/shutter_button.dart
    │   ├── ui/actions/snap_actions.dart
    │   ├── providers/snap_pod.dart
    │   ├── providers/snap_state.dart
    │   └── providers/ext_on_snap_pod.dart
    ├── bounties/                  # The Bounty: Demand Feed & Creation
    │   ├── ui/screens/bounties_feed_view.dart
    │   ├── ui/screens/create_bounty_view.dart
    │   ├── ui/screens/bounty_detail_view.dart
    │   ├── ui/widgets/bounty_card.dart
    │   ├── ui/widgets/category_filter_pill.dart
    │   ├── ui/widgets/radius_slider_pill.dart
    │   ├── ui/widgets/reward_badge.dart
    │   ├── ui/actions/bounties_actions.dart
    │   ├── providers/bounties_pod.dart
    │   ├── providers/bounties_state.dart
    │   └── providers/ext_on_bounties_pod.dart
    ├── handoff/                   # The Handoff: QR Code Exchange & Value Settlement
    │   ├── ui/screens/show_qr_view.dart
    │   ├── ui/screens/scan_qr_view.dart
    │   ├── ui/screens/handoff_celebration_view.dart
    │   ├── ui/widgets/qr_pulsing_card.dart
    │   ├── ui/widgets/scanner_bracket_overlay.dart
    │   ├── ui/widgets/handoff_summary_tile.dart
    │   ├── ui/actions/handoff_actions.dart
    │   ├── providers/handoff_pod.dart
    │   └── providers/handoff_state.dart
    ├── impact/                    # Earth Forward: Impact Visualizer
    │   ├── ui/screens/impact_dashboard_view.dart
    │   ├── ui/widgets/eco_dial_gauge.dart # Smooth animated ring progress
    │   ├── ui/widgets/impact_metric_tile.dart
    │   ├── ui/widgets/carbon_saved_card.dart
    │   ├── ui/widgets/community_counter_ticker.dart
    │   ├── ui/widgets/milestone_trophy_grid.dart
    │   ├── ui/actions/impact_actions.dart
    │   ├── providers/impact_pod.dart
    │   └── providers/impact_state.dart
    └── account/profile/           # User Profile & Upcycle Ledger
        ├── ui/screens/profile_view.dart
        ├── ui/widgets/profile_header_card.dart
        ├── ui/widgets/earnings_wallet_card.dart
        ├── ui/widgets/reputation_star_pill.dart
        ├── ui/actions/profile_actions.dart
        ├── providers/profile_pod.dart
        └── providers/profile_state.dart
```

---

### 4. Missing Design System Elements (To Add to `design_system.md`)

In accordance with the prompt ("add anything that might be missing in the design system to complete this project. once you're done, add it to design_system.md of the frontend"), the following components will be formally specified in `ungraey_flutter/design_system.md`:

1. **Camera Viewfinder HUD & Scanning Mesh**:
   - High-contrast HUD overlay with calibrated corner reticles (`Color(0xFF10B981)`).
   - Animated vertical sweep laser line using `LinearGradient` with `BlendMode.screen`.
   - Real-time floating squircle bounding boxes with label chip (`📦 Corrugated Cardboard • 96%`).
2. **Material Detection Pill Chips**:
   - Squircle pills (`BorderRadius.circular(100)`) with category emoji/icon, confidence percentage, and active bounty match counter (`3 local buyers want this`).
3. **Earth Forward Eco-Dial & Metric Progress**:
   - Multi-ring custom painter dial rendering Landfill Weight Saved (kg), CO2e Offset (kg), and Trees Planted Equivalent.
   - Spring-driven value interpolation with tabular figures (`FontFeature.tabularFigures()`).
4. **Cryptographic Handoff QR Card**:
   - Centered QR code container with subtle primary luminescence (`.blendColor(primary, 0.08)`).
   - Pulsing expiration ring (`01:59 remaining`) and dual action toggle (Show QR / Scan QR).
5. **Floating Dynamic Notification Pill (Live Nearby Alert)**:
   - Floating pill at screen top with bounce-in spring curve (`KCurves.bouncySpring`), showing real-time bids: `"New Bounty: Ceramics Studio needs 20 glass jars ($2.00) 0.8 mi away"`.

---

## Step-by-Step Implementation Strategy

### Phase 1: Configuration, Security & Dependencies
1. Update root and package `.gitignore` files to guarantee GitGuardian safety (no secret leaks).
2. Add necessary Flutter packages to `ungraey_flutter/pubspec.yaml` (`flutter_riverpod`, `equatable`, `go_router`, `qr_flutter`, `mobile_scanner`, `image_picker`, `shared_preferences`).
3. Create `okiki/` directory and populate `okiki/readme.md` and `okiki/progress.md`.
4. Generate `ungraey_flutter/design_system.md` with complete Aura Design System specifications.

### Phase 2: Serverpod Backend (`ungraey_server`)
1. Create `.spy.yaml` data models for `MaterialCategory`, `RewardType`, `Bounty`, `Snap`, `HandoffTransaction`, and `EcoImpact`.
2. Generate Serverpod code via `serverpod generate`.
3. Create default database migration.
4. Implement endpoints:
   - `bounty_endpoint.dart`: CRUD and spatial search.
   - `snap_endpoint.dart`: Photo submission, tag extraction, 5-mile matching algorithm.
   - `handoff_endpoint.dart`: QR token creation and atomic handoff verification.
   - `impact_endpoint.dart`: User and community environmental statistics.

### Phase 3: Flutter Aura Theme & Reusable UI Foundation
1. Implement `AppThemeExtension`, `PureThemeExtension`, `PureDarkThemeExtension`, `PureLightThemeExtension`, and `ThemeDataPure`.
2. Implement core components:
   - `BackdropShadow` (Apple-grade gradient dissolve mask).
   - `ScaleClickWrapper` (decoupled tactile compression).
   - `CanvasGridPainter` (drafting dot matrix).
   - `SearchHighlightedText` (live keyword matching).
   - `KCurves` (calibrated iOS and bouncy springs).
3. Implement `MainShellView` and `MainFloatingDock` with smooth tab transitions.

### Phase 4: The Snap Feature (AI Camera & Tagging)
1. Implement `MaterialClassifier` logic (smart on-device multi-tag recognition for cardboard, wood, denim, jars, plastics).
2. Build `SnapCameraView` with `CameraViewfinderHud`, animated scanning laser, and shutter button.
3. Build `SnapMatchView` with `DetectedMaterialChips` and `InstantMatchCard` showing immediate nearby payouts.
4. Implement `SnapPod`, `SnapState`, and `SnapActions` adhering to `rules.md` (all files < 200 lines).

### Phase 5: The Bounty Marketplace
1. Implement `BountiesFeedView` with fused search + filter pill, distance filter, and category chips.
2. Implement `BountyCard` featuring trade vs cash badges, distance metrics, and one-tap claim.
3. Implement `CreateBountyView` allowing buyers to post demand with quantity, location radius, and reward details.
4. Implement `BountiesPod`, `BountiesState`, and `BountiesActions`.

### Phase 6: The Handoff (QR Code Exchange)
1. Implement `ShowQrView` with high-security QR rendering, pulsing timer, and trade summary.
2. Implement `ScanQrView` with tactile bracket animations and camera scan processing.
3. Implement `HandoffCelebrationView` with celebration haptics, reward payout confirmation, and immediate carbon impact feedback.
4. Implement `HandoffPod`, `HandoffState`, and `HandoffActions`.

### Phase 7: Earth Forward Impact Visualizer & Profile
1. Implement `ImpactDashboardView` featuring:
   - `EcoDialGauge`: Custom painted multi-ring progress meter.
   - `CarbonSavedCard` & `LandfillDivertedCard`: Concrete real-world equivalencies.
   - `CommunityCounterTicker`: Aggregated live counter showing neighborhood waste diverted.
   - `MilestoneTrophyGrid`: Unlockable badges (e.g. "Zero Waste Hero", "Circular Champion").
2. Implement `ProfileView` with wallet balance, transaction ledger, and reputation ratings.
3. Implement `ImpactPod`, `ImpactState`, and `ImpactActions`.

### Phase 8: Verification & Documentation
1. Run `dart analyze` across `ungraey_flutter`, `ungraey_client`, and `ungraey_server`.
2. Run `dart format` to ensure clean code style.
3. Verify modularity: verify all UI files are strictly under 200 lines and contain no inlined widget helper methods.
4. Update `okiki/progress.md` and root `AGENTS.md`.

---

## Verification Plan

### Automated Checks
- `dart analyze` in `ungraey_flutter` & `ungraey_server`: Zero errors or warnings.
- `dart format --output=none --set-exit-if-changed .`: Code formatting compliance.
- UI File Line Count Audit: Every widget file verified under 200 lines.

### Manual / Visual Verification
- **Aura Theme Fidelity**: Validate surface tinting (`.blendColor`), hairline borders, and `BackdropShadow` scrolling transitions.
- **Camera Snap & Tag Flow**: Snap photo or select sample pile -> observe instant material chips and nearby bounty matches.
- **Bounty Posting & Feed**: Post a bounty -> see it appear in feed with correct category and proximity tags.
- **QR Handoff**: Open QR on seller screen -> scan on buyer screen -> see instant confirmation and eco impact metrics increment.
- **Impact Visualizer**: Verify animated dial rings and carbon savings numbers count up smoothly.
