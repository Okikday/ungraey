# Implementation Plan: Ungraey High-Fidelity UI Overhaul

Re-architect the entire **Ungraey** frontend UI to implement the fluid, tactile, top-tier aesthetic specified in the **Aura Design System** and visual layout grammar (floating pill dock, PageView spring physics, horizontal pinned carousels, blurred glass micro-tags, inset grouped tiles, and floating frosted context menu).

## User Review Required

> [!IMPORTANT]
> - **Zero Third-Party Branding / Leakage**: The redesign adopts the exact component patterns, spatial depth formulas, spring animations, and layout hierarchy without mentioning or referencing any other project names or external identifiers.
> - **Color Harmony**: Ungraey's signature Eco/Commodity identity (**Luminous Emerald `#10B981`** and **Deep Indigo/Violet `#4B24D2` / `#5375F6`**) are synthesized into the two-color principle, producing surface luminescence via `.blendColor()` and rich card gradients.
> - **Strict Flutter Rules**: Every single UI widget file remains strictly under 200 lines, zero inlined `Widget _build...()` helper methods are used, and all state flows through the Riverpod Pod pattern with `Equatable` states.

---

## 1. Aesthetic Architecture & Visual System

### 1.1 Core Tokens & Surfaces
- **Two-Color System**:
  - `Primary`: Luminous Indigo / Deep Blue (`#5375F6` dark, `#4B24D2` light) with Emerald highlight accents (`#10B981`).
  - `Secondary`: Eco Luminescence (`#10B981` / `#059669`) for positive carbon metrics, cash values, and active bounties.
  - `Scaffold Background`: Deep matte obsidian (`#131313` dark, `#F4F5F8` light).
  - `Surfaces & Cards`: `#1F1F1F` base surface, `#292929` elevated cards with `.blendColor(primary, 0.06)` depth tinting.
  - `Card Gradients`: `[Color(0xFF2C3555), Color(0xFF151821)]` (stops `[0.45, 1.0]`).
- **Hairline Borders & Ambient Shadows**:
  - `1.0px` borders using `borderSubtle.withValues(alpha: 0.22)`.
  - Ambient elevation shadows with `color: Colors.black.withValues(alpha: 0.18), blurRadius: 18`.
- **Apple-Grade Dissolve (`BackdropShadow`)**:
  - 10-stop non-linear alpha gradient mask with `ImageFilter.blur(sigmaX: 3, sigmaY: 3, tileMode: TileMode.decal)`.
  - Placed behind floating headers and bottom navigation docks so scrollable content dissolves smoothly into canvas.
- **Glass Micro-Tags (`BlurredTag`)**:
  - Compact squircle pills (`height: 22`, `borderRadius: 100`, `BackdropFilter(sigmaX: 4, sigmaY: 4)`).
  - Instant indicators for distance (`📍 1.4 mi`), reward (`💵 $10.00 Cash`), category (`📦 Cardboard`), and rating (`⭐ 4.9`).

---

## 2. Shell & Navigation Architecture

### 2.1 Root `MainShell`
- `PageView` with page-to-page physics driven by `KCurves.snappySpring` (700ms duration).
- Top safe area handling with `AnnotatedRegion<SystemUiOverlayStyle>`.
- Two-way sync with `MainShellPod` so tab switches animate smoothly with zero rebuild stutter.

### 2.2 Floating Dock (`MainBottomNavBar`)
- Centered floating pill dock:
  - Width dynamically responsive, height `68px`.
  - Decorated container with `borderRadius: BorderRadius.circular(1000)` and hairline border (`onSurface.withValues(alpha: 0.12)`).
  - Animated sliding background highlight (`_HighlightIndicator`) with `KCurves.bouncySpring` (600ms) tracking the active tab.
  - 4 core tabs:
    1. **Home / Impact** (`Iconsax.home_1` / `Iconsax.home_copy`)
    2. **Bounties / Market** (`Iconsax.people` / `Iconsax.people_copy`)
    3. **Snap / AI Vision** (`Iconsax.scan` / `Iconsax.camera_copy`)
    4. **Profile & Wallet** (`Iconsax.user` / `Iconsax.user_copy`)

### 2.3 Special Action Button & Floating Frosted Context Menu
- A circular floating action button beside the nav bar with rotating icon animation.
- Tapping opens `FloatingContextMenu`:
  - Positioned above the button with `scaleXY` animation (`KCurves.bouncySpring`).
  - Frosted glass container (`BackdropFilter(sigmaX: 20, sigmaY: 20)`).
  - Tactile items with haptic feedback:
    - **Snap Waste Pile**: Launch AI camera viewfinder.
    - **Post Material Bounty**: Open commodity demand modal.
    - **Scan Handoff QR**: Open camera QR scanner to claim cash/points.

---

## 3. Screen & Feature Redesign

### 3.1 Home / Impact Dashboard (`HomeTab`)
- **Structure**: `CustomScrollView` with `BouncingScrollPhysics`.
- **Floating Header (`HomeTabHeader`)**:
  - Avatar with subtle hairline border + tap to profile.
  - Greeting text ("Hi, Alex") + status badge ("VERIFIED UPCYCLER").
  - Fused squircle pill containing live Search and Notification bell.
- **Top Pinned Urgency Bounties (`FeaturedSection`)**:
  - Horizontal carousel of `PinnedBountyCard`s (`width: 250`, `height: 168`):
    - Material banner, `BlurredTag` rating/distance, quantity needed, dollar cash bounty, and bookmark action.
- **Ongoing Exchanges (`OngoingExchangesSection`)**:
  - List of active handoffs styled with circular status avatars, progress indicator bar ("Handoff in progress"), and more options sheet (`...`).
- **Live Impact Dial & Community Ticker**:
  - Polished circular gauge showing kilograms diverted from landfill and carbon saved.
  - Animated community ticker bar.

### 3.2 Commodity Bounties Marketplace (`BountiesTab`)
- **Structure**: `CustomScrollView` with slivers.
- **Floating Header (`BountiesHeader`)**:
  - Large title "Commodity Bounties" + backdrop blur.
- **High-Demand Bounties Horizontal Carousel (`PinnedBountiesSection`)**:
  - Pinned cards showing high-value buyer demand (clean glass jars, scrap denim, pallets, copper wire).
  - Stacked buyer avatar circles (`SpaceAvatarGroup`).
- **Sticky Search & Category Filter Header**:
  - Inset search bar with inline prefix icon.
  - Filter pills for categories (`Cardboard`, `Glass Jars`, `Lumber`, `Textiles`, `Metals`).
- **Feed List Tiles (`BountyTile`)**:
  - Squircle card (`height: 64-80`), material icon thumbnail, title, buyer avatar group, reward pill, distance badge, and disclosure arrow.
  - Long press triggers `BountyTileContextMenuSheet`.
- **Bounty Detail Screen (`BountyDetailView`)**:
  - Sliver app bar with material image.
  - Buyer meta section (`SpaceMetaSection` pattern with buyer credentials, verification, chat/invite).
  - Quantity slider, pickup notes, and "Claim Bounty & Generate QR" action.

### 3.3 AI Snap & Material Classifier (`SnapTab`)
- **Viewfinder HUD**:
  - Optical corner brackets (`ScannerBracketOverlay`), live reticle with pulsing luminescence.
  - Real-time auto-tagging chips (`BlurredTag` with confidence percentage).
  - Shutter button with glowing outer ring and tactile compression (`ScaleClickWrapper`).
- **Instant Match Card**:
  - When photo is snapped, spring slide-up card showing local matching bounties within 5 miles.
  - Financial incentive summary ("Earn up to $15.00 from 2 buyers nearby").
  - One-tap handoff initiation.

### 3.4 Handoff & Closed-Loop QR Settlement (`HandoffViews`)
- **Show QR View**:
  - Centered squircle card with pulsing border glow and single-use cryptographic token.
  - Live timer indicating expiration (5 minutes).
- **Scan QR View**:
  - Real-time camera viewfinder with scanner beam animation.
- **Celebration View**:
  - Animated success checkmark + confetti.
  - Direct metric breakdown: "+15 kg diverted", "+22 kg CO2 offset", "+$15.00 credited to wallet".

### 3.5 Profile & Upcycler Wallet (`ProfileView`)
- **Floating Header (`ProfileAppBar`)**:
  - Title, back/refresh actions with backdrop blur.
- **Profile Header Card (`ProfileHeaderCard`)**:
  - Glowing circular avatar, user name, reputation level ("Tier 3 Upcycler - 98% Success").
- **Profile Stats Row (`ProfileStatsRow`)**:
  - 3 metric tiles: Diverted `142 kg`, Bounties `24`, Cash `$185.20`.
- **Inset Grouped Settings Cards (`ProfileSettingsGroup`)**:
  - Account: Edit Details, Ungraey Wallet & Payouts, Verification.
  - Preferences: 5-Mile Proximity Alerts, Material Watchlist.
  - About & Support: Impact Methodology, Help Center.
  - Session: Sign Out.

---

## 4. Component Hierarchy & File Plan

### Shared Components (`ungraey_flutter/lib/shared/`)
- `components/buttons/scale_click_wrapper.dart`
- `components/layout/backdrop_shadow.dart`
- `components/layout/app_text.dart`
- `components/layout/app_padding.dart`
- `components/indicators/blurred_tag.dart`
- `components/painters/canvas_grid_painter.dart`
- `components/typography/search_highlighted_text.dart`
- `theme/src/app_colors.dart`
- `theme/src/pure_theme_extension.dart`
- `theme/src/pure_dark_theme_extension.dart`
- `theme/src/pure_light_theme_extension.dart`
- `theme/src/app_theme_extension.dart`
- `theme/src/app_theme.dart`

### Main Shell (`ungraey_flutter/lib/features/main/`)
- `ui/screens/main_shell.dart`
- `ui/widgets/main_bottom_nav_bar.dart`
- `ui/widgets/special_action_button.dart`
- `ui/widgets/floating_context_menu.dart`
- `providers/main_shell_pod.dart`
- `providers/main_shell_state.dart`

### Home / Impact Feature (`ungraey_flutter/lib/features/impact/` & `home/`)
- `ui/screens/home_tab.dart`
- `ui/widgets/home_header.dart`
- `ui/widgets/featured_bounties_section.dart`
- `ui/widgets/featured_bounty_card.dart`
- `ui/widgets/ongoing_exchanges_section.dart`
- `ui/widgets/ongoing_exchange_tile.dart`
- `ui/widgets/impact_dial_widget.dart`
- `ui/widgets/community_counter_widget.dart`

### Bounties Feature (`ungraey_flutter/lib/features/bounties/`)
- `ui/screens/bounties_tab.dart`
- `ui/screens/bounty_detail_view.dart`
- `ui/screens/create_bounty_modal.dart`
- `ui/widgets/bounties_header.dart`
- `ui/widgets/pinned_bounties_section.dart`
- `ui/widgets/pinned_bounty_card.dart`
- `ui/widgets/bounty_tile.dart`
- `ui/widgets/bounty_search_bar.dart`
- `ui/widgets/bounty_meta_section.dart`
- `ui/widgets/bounty_tile_context_menu_sheet.dart`

### Snap & AI Vision (`ungraey_flutter/lib/features/snap/`)
- `ui/screens/snap_tab.dart`
- `ui/widgets/camera_viewfinder_hud.dart`
- `ui/widgets/detected_material_chips.dart`
- `ui/widgets/instant_match_card.dart`
- `ui/widgets/shutter_button.dart`
- `logic/material_classifier.dart`

### Handoff Feature (`ungraey_flutter/lib/features/handoff/`)
- `ui/screens/show_qr_view.dart`
- `ui/screens/scan_qr_view.dart`
- `ui/screens/handoff_celebration_view.dart`
- `ui/widgets/qr_pulsing_card.dart`
- `ui/widgets/scanner_bracket_overlay.dart`

### Profile Feature (`ungraey_flutter/lib/features/account/profile/`)
- `ui/screens/profile_view.dart`
- `ui/widgets/profile_app_bar.dart`
- `ui/widgets/profile_header_card.dart`
- `ui/widgets/profile_stats_row.dart`
- `ui/widgets/profile_settings_group.dart`
- `ui/widgets/wallet_card.dart`

---

## 5. Verification & Quality Assurance

1. **Static Analysis**: `dart analyze` in both `ungraey_flutter` and `ungraey_server` must yield **0 issues**.
2. **Line Count & Modularization**: Every single Dart UI widget file must be **< 200 lines**.
3. **No Inlined Build Helpers**: 0 instances of `Widget _build...()`.
4. **GitGuardian Safeguards**: Zero passwords, secret tokens, or sensitive strings in source code.
5. **Aura Design Specs**: Update `ungraey_flutter/design_system.md` with complete documentation of tokens, spring curves, and component patterns.
6. **Progress Records**: Log all updates in `okiki/progress.md` and `okiki/readme.md`.
