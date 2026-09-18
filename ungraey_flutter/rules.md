# Flutter Deterministic Blueprint

> A clean, scalable, highly debuggable Flutter architecture for real-time collaborative hangouts. Friends, classmates, and teammates can brainstorm on shared boards, sketch on live canvases, leave voice reactions, and jump directly into sessions via a built-in calendar without link-sharing friction. Once you see a screen, you can predict exactly where its notifier, logic, and widgets live.

---

## Table of Contents

1. [Core Philosophy](#1-core-philosophy)
2. [Widget Rules](#2-widget-rules)
   - [Keep Widgets Small, Modular, and Under 200 Lines](#21-keep-widgets-small-modular-and-under-200-lines)
   - [Widget File vs. Private Widget Decision](#22-widget-file-vs-private-widget-decision)
   - [Sub-Widgets Read Directly from State](#23-sub-widgets-read-directly-from-state-avoid-parameter-drilling--model-passing)
   - [Separation of Actions & Functions (The ui/actions/ Pattern)](#24-separation-of-actions--functions-the-uiactions-pattern)
   - [Widget Models (Data Classes)](#25-widget-models-data-classes)
   - [Use Specialist Widgets Over Generalist Ones](#26-use-specialist-widgets-over-generalist-ones)
3. [Code Documentation Standards](#3-code-documentation-standards)
4. [Performance Optimization](#4-performance-optimization)
5. [Folder Structure Overview](#5-folder-structure-overview)
6. [lib/app](#6-libapp)
7. [lib/core](#7-libcore)
   - [base](#71-corebase)
   - [enums](#72-coreenums)
   - [utils](#73-coreutils)
8. [lib/data](#8-libdata)
9. [lib/network](#9-libnetwork)
10. [lib/shared](#10-libshared)
11. [lib/features](#11-libfeatures)
    - [Feature Organization & Grouping Rules](#111-feature-organization--grouping-rules)
    - [Internal Feature Structure](#112-internal-feature-structure)
    - [UI Layer](#113-ui-layer)
    - [Logic Layer](#114-logic-layer)
    - [Providers / State Layer](#115-providers--state-layer)
12. [Riverpod State Pattern (Pod Structure)](#12-riverpod-state-pattern-pod-structure)
    - [Pod Definition & me Accessor](#121-pod-definition--me-accessor)
    - [State Definition with Equatable](#122-state-definition-with-equatable)
    - [Extension Part Files (ext_on_*_pod.dart)](#123-extension-part-files-ext_on__poddart)
    - [Extension Helpers on Providers](#124-extension-helpers-on-providers)
    - [Controller Lifecycle Management](#125-controller-lifecycle-management)
    - [Sub-Pod Aggregation](#126-sub-pod-aggregation)
13. [Shared Packages & Preferences](#13-shared-packages--preferences)
14. [AI Tooling & Contribution Guidelines](#14-ai-tooling--contribution-guidelines)

---

## 1. Core Philosophy

- **Deterministic Architecture**: Given any feature or screen name (e.g., live canvas, sprint checklist, voice reaction tray, calendar drop-in), the location of its notifier (Pod), state, logic, actions, and widgets is strictly predictable.
- **Active Social Hangout Experience**: Architecture is designed for real-time multiplayer presence, zero-friction session jump-ins (no "where's the link?" scramble), synchronized drawing strokes, audio clip playback, and collaborative checklists.
- **Unidirectional Data Flow**: UI → Actions/Logic → Notifiers (Pods) → Real-time Engine / API → UI.
- **Modular UI Components**: UI components must be highly modular. Avoid monolithic widgets; decompose complex screens into focused files under `widgets/`.
- **Riverpod Pod Structure**: Prefer **Riverpod** (`flutter_riverpod`) using the **Pod structure** for state management, unless state is strictly ephemeral and local to a single widget (in which case `ValueNotifier` or local widget state is acceptable).
- **Consistency First**: AI tooling and contributors must check if a structural pattern already exists in canonical feature modules (`spaces`, `canvas`, `calendar`, `checklist`) before inventing something new.

---

## 2. Widget Rules

### 2.1 Keep Widgets Small, Modular, and Under 200 Lines

- **Maximum 200 Lines of Code in UI Files**: Every UI widget and screen file must strictly remain under ~200 lines of code. If a file approaches or exceeds 200 lines, decompose it by extracting its sections, toolbars, member overlays, or controls into separate dedicated files under `widgets/` or `src/`.
- **No Inlined Build Helper Methods (`Widget _buildSomething(...)`)**: Do not declare private methods that return widgets (`Widget _buildToolbar(...)`, `Widget _buildParticipantTray(...)`, etc.) inside a widget or screen class! Any meaningful sub-tree must be extracted into its own dedicated widget class (`StatelessWidget`, `StatefulWidget`, or `ConsumerWidget`). This guarantees clean element lifecycles, avoids unnecessary subtree rebuilds, keeps code modular, and prevents bloated files.
- Break complex collaborative surfaces (e.g., live whiteboard, active hangout session) into smaller, focused components under the feature's `ui/widgets/` directory or `lib/shared/components/` if shared across features.

```dart
// Bad: monolithic build method cramming canvas controls and participants
class HangoutSessionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(children: [Text('Sprint Brainstorm'), Icon(Icons.mic)]),
          Expanded(child: Container(color: Colors.white)), // Monolithic canvas
          Row(children: [ElevatedButton(onPressed: () {}, child: Text('Drop Voice Note'))]),
        ],
      ),
    );
  }
}

// Good: decomposed modular widgets
class HangoutSessionHeader extends StatelessWidget {
  const HangoutSessionHeader({super.key});
  @override
  Widget build(BuildContext context) => const Row(
    children: [SessionTitleWidget(), VoiceActivityBadge()],
  );
}

class CanvasDrawingLayer extends StatelessWidget {
  const CanvasDrawingLayer({super.key});
  @override
  Widget build(BuildContext context) => const RepaintBoundary(child: CanvasSurface());
}

class VoiceReactionTriggerButton extends StatelessWidget {
  const VoiceReactionTriggerButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) =>
      ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.mic),
        label: const Text('Voice Reaction'),
      );
}
```

### 2.2 Widget File vs. Private Widget Decision

- A widget deserves its own file in `widgets/` if it is **reusable or significant enough** to stand alone (e.g., `SharedBoardCard`, `VoiceReactionBubble`, `SessionParticipantTile`, `CanvasToolPicker`).
- If a widget is only used internally within a parent widget and is **too small or specific to justify its own file**, declare it as a **private widget** (`_PrivateWidget`) in the same file, below the parent widget.
- Limit widgets in a single file to at most 8 small private helpers with a tolerance of 2 extra if they are tiny layout nodes. Avoid excessive nesting.

```dart
// shared_board_card.dart
class SharedBoardCard extends StatelessWidget {
  const SharedBoardCard({super.key, required this.data});
  final SharedBoardModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: _BoardThumbnail(coverUrl: data.coverUrl),
        title: Text(data.title),
        subtitle: Text('${data.activeParticipantCount} vibeing right now'),
      ),
    );
  }
}

// Private — highly specific sub-element for thumbnail rendering
class _BoardThumbnail extends StatelessWidget {
  const _BoardThumbnail({required this.coverUrl});
  final String coverUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(coverUrl, width: 48, height: 48, fit: BoxFit.cover),
    );
  }
}
```

### 2.3 Sub-Widgets Read Directly from State (Avoid Parameter Drilling / Model Passing)

- **Direct Selection over Parameter Drilling**: If a sub-widget needs state or model data that is already managed in the screen or feature's Riverpod provider (Pod), the sub-widget must be a `ConsumerWidget` or `ConsumerStatefulWidget` and read/watch that value directly inside its own `build()` method, rather than having models or state values passed down through layers of constructor parameters.
- **Rules for `.select()` vs. Watching State/Models**:
  1. **Strictly 1 isolated property**: Select that property directly:
     ```dart
     final boardTitle = ref.watch(LiveCanvasPod.me.select((s) => s.activeBoard?.title));
     ```
  2. **Multiple properties from the same source**: Whenever more than one property is needed from the same state or model, there must **NEVER** be multiple separate `ref.watch` or `.select` declarations on that same source. Instead, watch the state or model directly once:
     ```dart
     // BAD: Multiple declarations from the exact same source
     final activeTool = ref.watch(
       LiveCanvasPod.me.select((s) => s.currentTool.name),
     );
     final (strokeColor, strokeWidth) = ref.watch(
       LiveCanvasPod.me.select((s) => (s.strokeColor, s.strokeWidth)),
     );

     // GOOD: Watch the state once and access properties off the state
     final state = ref.watch(LiveCanvasPod.me);
     final activeTool = state.currentTool.name;
     final strokeColor = state.strokeColor;
     final strokeWidth = state.strokeWidth;
     ```
     Access `state.activeTool`, `state.strokeColor`, etc. directly off `state`. Never split the same source into multiple declarations cluttering the build tree.
- **Actions and Notifiers**: When triggering Pod actions, sub-widgets access the notifier directly using `Pod.me.not(ref)` or `ref.read(Pod.me.notifier)`. Only pass callbacks for navigation or parent dialog dismissal if they cannot be handled within the feature.

### 2.4 Separation of Actions & Functions (The `ui/actions/` Pattern)

- **Generic Helpers Allowed**: Generic, pure utility functions (e.g. mapping canvas tools to icons, duration formatting, color palettes) are allowed in the widget file, provided they do NOT make the widget file excessively long. If a widget becomes too long or jampacked, these helpers or private widgets must be extracted into their own files.
- **Action Functions Forbidden in Widgets**: Functions that take imperative action (such as `showModalBottomSheet`, `showDialog`, starting audio recording, joining live hangouts, navigating to sessions, or clipboard operations with snackbars) must **NEVER** reside inside the widget itself!
- **Directory Structure**:
  All action handlers must be placed in a dedicated `actions/` folder under the feature's `ui/` layer:
  `lib/features/<feature>/ui/actions/<feature>_actions.dart`
  Widgets simply invoke methods on these action classes:
  ```dart
  LiveCanvasActions.openColorPaletteModal(context, ref);
  HangoutSessionActions.joinLiveSession(context, ref, sessionId);
  VoiceReactionActions.openReactionTray(context, ref);
  ```
  This keeps the widget tree completely declarative, readable, and decoupled from imperative modal/action code.

### 2.5 Widget Models (Data Classes)

- **Public widgets** with **more than 2 non-action parameters** should receive their data through a dedicated immutable model class (using `Equatable` or standard immutable fields).
- The parameter name should consistently be `data`.
- **Private widgets** have no such restriction — they can accept individual parameters as appropriate.
- **Screens/Views** passed to a `GoRoute` should strictly accept one argument model or query parameters (e.g., `spaceId`, `boardId`, `checklistId`).

### 2.6 Use Specialist Widgets Over Generalist Ones

Always prefer the most specific widget for the job:
- Use `ColoredBox` or `DecoratedBox` instead of `Container` when only background color or border decoration is needed.
- Use `SizedBox` for fixed spacing or width/height constraints.
- Use `Padding` for whitespace padding only.
- Use `Align` or `Center` directly rather than nesting `Container(alignment: ...)`.

---

## 3. Code Documentation Standards

### 3.1 Simple Functions

Single-line triple-slash comment describing exactly what the function does:

```dart
/// Returns the formatted display name and live presence vibe for a participant.
String getParticipantLabel(HangoutMember member) => '${member.name} (${member.vibe})';
```

### 3.2 Complex Functions with Helper Routines

For complex multi-step functions:
1. A **3-line ASCII separator** above it.
2. A **one-liner triple-slash comment** on the line directly after the separator.
3. Private helper routines placed directly below.

```dart
// ============================================================
// Validates and dispatches voice reaction to live board
// ============================================================
/// Validates audio clip payload, formats reaction packet, and broadcasts to Api.
Future<bool> sendVoiceReaction() async {
  final validated = _validateAudioClip();
  if (!validated) return false;
  return await _broadcastReaction();
}

bool _validateAudioClip() { ... }
Future<bool> _broadcastReaction() async { ... }
```

### 3.3 Class-Level Comments

Every class, Pod, or mixin must have a brief doc comment explaining its responsibility:

```dart
/// Manages live canvas drawing state, active stroke buffers, tool selection, and real-time sync.
class LiveCanvasPod extends Notifier<LiveCanvasState> { ... }
```

---

## 4. Performance Optimization

- **`const` constructors everywhere possible.** Never instantiate non-const widgets if all arguments are compile-time constants.
- **`RepaintBoundary` for Canvas & Audio Waves**: Wrap high-frequency rendering trees (custom canvas drawing strokes, voice reaction soundwave animations, particle bursts) in `RepaintBoundary` widgets so repaints do not dirty the surrounding UI chrome (toolbars, headers, member lists).
- **Selective watching:** Watch specific state properties or use `.select` for fine-grained updates (e.g., active tool change, single participant status), preventing full board rebuilds.
- **Real-Time Stream & Controller Lifecycle**: Always cancel WebRTC/WebSocket real-time subscriptions, audio recording streams, text controllers, and animation controllers in `ref.onDispose`.
- **Offload Heavy Serializations**: When bundling large vector stroke histories or generating board snapshots, offload CPU-bound calculations using `compute()` or worker isolates.
- **Lazy Loading**: Use `ListView.builder` or `SliverList` for checklist items, space member directories, and calendar sprint logs.

---

## 5. Folder Structure Overview

```
lib/
├── app/                  ← Application setup, routing, themes, global config
│   ├── assets/           ← Generated asset accessors (flutter_gen)
│   ├── config/           ← Environment, flavors, base URLs, WebSocket/WebRTC config
│   ├── constants/        ← Global app constants, strings, sizing, canvas defaults
│   ├── routes/           ← GoRouter configuration with instant calendar drop-in redirects
│   ├── app.dart          ← Root MaterialApp.router widget
│   ├── app_provider.dart ← Global AppNotifier / app-level state
│   └── app_state.dart    ← Global AppState
├── core/                 ← Foundational shared utilities, base classes, enums
│   ├── base/             ← Mixins, extensions, helper utilities, base classes
│   ├── enums/            ← Global enum definitions (SpaceRole, SessionStatus, CanvasTool, ReactionType)
│   ├── utils/            ← UI utilities (toasts, sheets, popups) and misc helpers (Result)
│   └── core.dart         ← Core barrel file
├── data/                 ← Local persistence, caching, and storage drivers
│   ├── const_data/       ← Static seed or default canvas presets
│   ├── drift/            ← Drift SQLite local database & DAOs (cached boards, sketches, checklists, sessions)
│   ├── shared_preferences/ ← SharedPreferences wrapper & typed accessors (user vibes, tool prefs)
│   ├── storage/          ← Secure storage for auth tokens and room keys
│   ├── app_paths.dart    ← App sandbox paths, audio cache directory helpers
│   └── shared_pref_keys.dart
├── network/              ← Remote networking, REST API, WebSockets & real-time sync
│   ├── extra/            ← Interceptors, auth session manager, socket reconnect handlers
│   ├── models/           ← Request and response DTOs (strokes, voice clips, presence, events)
│   ├── src/              ← Domain-specific API services (auth, users, spaces, boards, canvas, calendar, voice)
│   ├── api.dart          ← Primary Api singleton (Api.instance)
│   ├── core_api.dart     ← Low-level HTTP transport client & socket manager
│   └── external_api.dart ← Real-time cloud sync, audio storage (S3, WebRTC, Firebase)
├── shared/               ← Reusable cross-feature UI design system components
│   ├── animations/       ← Motion widgets, reaction pops, pulse indicators, vibe particles
│   ├── components/       ← Reusable widgets (buttons, live avatar stacks, voice pills, modal cards)
│   ├── models/           ← Shared UI data models (UserProfile, PresenceStatus)
│   ├── popups/           ← Instant drop-in prompts, reaction trays, bottom sheets
│   └── theme/            ← Theme data, typography, PureThemeExtension
├── features/             ← Feature modules (screencentric & domain flows)
│   ├── auth/             ← Onboarding, auth (sign in, sign up, profile setup)
│   ├── main/             ← Root navigation shell & tabs (hangout, spaces, calendar) ONLY
│   ├── spaces/           ← Group spaces (hangouts, project rooms, book clubs, member vibes)
│   ├── canvas/           ← Shared boards, real-time sketching, brainstorming canvas
│   ├── calendar/         ← Built-in calendar, sprint events, instant drop-in jump logic
│   ├── checklist/        ← Collaborative study & sprint checklists, live progress sync
│   ├── voice_reactions/  ← Voice reaction recording, soundboard playback, audio notes
│   ├── notifications/    ← Instant drop-in invitations, session start alerts, reaction pings
│   ├── account/          ← Domain feature group (e.g. features/account/profile/)
│   │   └── profile/      ← User profile, custom avatar/vibe, audio preferences
│   └── splash.dart       ← Splash screen
└── main.dart             ← Application entrypoint
```

---

## 6. lib/app

Handles app bootstrapping, routing, and global application-level state.

- **`app.dart`**: Defines root `App` consuming `appProvider` and `appRouter`.
- **`app_provider.dart`**: Declares `appProvider = NotifierProvider<AppNotifier, AppState>(AppNotifier.new);` managing theme modes, authentication status transitions, and global connectivity.
- **`routes/app_router.dart`**: Declares `GoRouter` with instant drop-in deep links.
  > [!IMPORTANT]
  > **Instant Drop-In Routing**: When an event, sprint, or hangout starts, the built-in calendar drops everyone directly into the live canvas (`/spaces/:spaceId/canvas/:boardId`) or collaborative sprint checklist (`/spaces/:spaceId/checklist/:checklistId`), eliminating link-sharing friction and expired file scrambles.
- **`assets/`**: Auto-generated by `flutter_gen` into typed accessors (e.g., `AppAssets.icons...`). Never manually hardcode asset path strings.

---

## 7. lib/core

### 7.1 core/base

Holds core architectural extensions, mixins, and common helpers:
- **`extensions/src/extension_on_provider.dart`**: Riverpod extension methods (`read`, `watch`, `not`, `readX`, `watchX`, `notX`, `keepAliveFor`).
- **`mixins/text_editing_controller_factory_mixin.dart`**: Lifecycle-managed `TextEditingController` generation via `useTextEditingController()` and `disposeControllers()`.
- **`helpers/validators.dart`**: Shared email, password, and input validation utilities.
- **`helpers/formatters/`**: Date, timer, sprint countdown, and audio duration formatting helpers.

### 7.2 core/enums

Holds system-wide domain enumerations:
- `SpaceRole` (`host`, `collaborator`, `member`, `viewer`)
- `SessionStatus` (`scheduled`, `startingSoon`, `live`, `concluded`)
- `CanvasTool` (`pen`, `brush`, `highlighter`, `eraser`, `stickyNote`, `selector`)
- `ReactionType` (`voiceClip`, `quickAudio`, `vibeBurst`, `emoji`)

### 7.3 core/utils

- **`misc/result.dart`**: Unified functional `Result<T>` or `ApiResult<T>` wrapper for safe execution without uncaught exceptions (`Result.tryRun`, `Result.tryRunAsync`).
- **`ui/nav_utils.dart`**: Safe navigation wrappers with instant session jump helpers.
- **`ui/ui_utils.dart`**: Toast notifications, bottom sheet launchers, voice reaction overlays.

---

## 8. lib/data

Responsible for local persistence, caching, and offline data access:
- **`drift/`**: Drift SQLite database for local board caching, offline canvas sketches, cached checklists, and scheduled hangout events.
- **`shared_preferences/shared_prefs.dart`**: Fast key-value persistence for flags, cached tokens, active vibe status, and tool preferences.
- **`storage/`**: Secure storage (`flutter_secure_storage`) for sensitive auth tokens, live room credentials, and encryption keys.

---

## 9. lib/network

Centralizes all network communications, REST API, WebSockets, and real-time multiplayer coordination:
- **`Api.instance`**: Unified entrypoint (`Api.instance.auth`, `Api.instance.users`, `Api.instance.spaces`, `Api.instance.boards`, `Api.instance.canvas`, `Api.instance.calendar`, `Api.instance.voice`).
- **`AuthSession.instance`**: Singleton holding current user session, active tokens, and profile info.
- **`extra/misc/token_interceptor.dart`**: Transparent JWT token refresh and session invalidation interceptor.
- **`models/`**: Strongly-typed request and response DTOs for strokes, audio packets, checklist mutations, and presence pulses.

---

## 10. lib/shared

Contains the global reusable UI design system:
- **`components/`**: Modular, atomic UI components (e.g., `AppButton`, `AppTextInput`, `LiveAvatarStack`, `VoiceReactionBubble`, `InstantDropInBanner`, `CanvasMiniMap`).
- **`styles/`**: Social hangout theme, vibrant accent palettes, dark mode styling, and typography.
- Shared widgets must remain completely independent of any specific feature Pod or state.

---

## 11. lib/features

Features are self-contained vertical slices. Each feature module contains its own UI, business logic, state (providers), and models.

### 11.1 Feature Organization & Grouping Rules

Features follow two approved patterns:

1. **Standalone Top-Level Features**:
   Self-contained features living directly under `lib/features/`:
   ```
   features/
   ├── auth/             ← Authentication, onboarding, profile setup
   ├── spaces/           ← Collaborative spaces, hangout rooms, member vibes
   ├── canvas/           ← Shared boards, real-time sketching, brainstorming
   ├── calendar/         ← Built-in calendar, sprint events, instant drop-in routing
   ├── checklist/        ← Collaborative study & sprint checklists, real-time sync
   ├── voice_reactions/  ← Voice clip recording, soundboard playback, audio notes
   ├── notifications/    ← Instant drop-in invitations, session start alerts, reaction pings
   ```

2. **Grouped Features (Domain Categories)**:
   Features are allowed to be grouped when they share a cohesive domain (e.g., `account`):
   ```
   features/
   └── account/
       ├── profile/      ← User profile, custom avatar vibe, audio settings
       └── settings/     ← Hangout preferences, theme, notification controls
   ```
   Under a domain group like `account/`, each child folder is an independent, complete feature containing its own `ui/`, `providers/`, `logic/`, etc.

3. **THE STRICT EXCEPTION: `main` Feature**:
   - The `main` feature is exclusively reserved for the root navigation shell and bottom tabs (`main_shell.dart`, `tabs/`: `hangout_tab.dart`, `spaces_tab.dart`, `calendar_tab.dart`).
   - **`main` CANNOT be grouped with anything else.**
   - **Distinct collaborative features (e.g. `canvas`, `checklist`, `voice_reactions`, `notifications`) must NEVER be placed inside `main`.** They must live in their own dedicated feature folder (e.g. `features/canvas/`).

### 11.2 Internal Feature Structure

```
features/<feature_name>/ (or features/<group>/<feature_name>/)
├── models/         ← Domain or presentation models specific to this feature
├── logic/          ← Pure business logic, static use-cases, validators (no BuildContext, no Ref)
├── providers/      ← Riverpod Pods, states, and extension part files
└── ui/
    ├── actions/    ← UI-level action handlers & navigation callbacks (modals, dialogs, drop-ins)
    ├── screens/    ← Route-level views (always suffixed with View, e.g., LiveCanvasView, HangoutSpaceView)
    └── widgets/    ← Feature-specific modular widgets (decomposed, no monolithic files)
```

### 11.3 UI Layer

- **Screens / Views (`screens/`)**:
  - Always suffix screen widgets with `View` (e.g., `SignInView`, `ProfileView`, `HangoutSpaceView`, `LiveCanvasView`, `CalendarScheduleView`, `SprintChecklistView`).
  - Screen widgets extend `ConsumerWidget`, `ConsumerStatefulWidget`, or stateful widgets.
- **Widgets (`widgets/`)**:
  - Modular, reusable sub-components of the screen (e.g., `CanvasToolbar`, `VoiceReactionTray`, `ChecklistProgressCard`).
  - Large screens must be decomposed into multiple focused widgets in `widgets/`. Avoid monolithic screens.
- **Actions (`actions/`)**:
  - UI interactions requiring `BuildContext` or navigation are encapsulated in action helpers (e.g., `LiveCanvasActions`, `HangoutSpaceActions`).

### 11.4 Logic Layer

- Contains pure Dart business logic, calculation, vector math, and multi-step orchestration.
- Logic classes or functions must not reference `BuildContext`.
- Methods should return `Result<T>` or model objects rather than throwing unhandled exceptions.

### 11.5 Providers / State Layer

All Riverpod state management lives under `providers/` using the **Pod structure**.

---

## 12. Riverpod State Pattern (Pod Structure)

The project strictly follows the **Pod Structure** for Riverpod state management.

### 12.1 Pod Definition & `me` Accessor

Every Pod defines a private top-level provider constant and exposes it publicly via a static `me` property on the Pod class:

```dart
// live_canvas_pod.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athenaeum/core/base/base.dart';
import 'package:athenaeum/core/enums/canvas_tool.dart';
import 'live_canvas_state.dart';

part 'ext_on_live_canvas_pod.dart';

final _liveCanvasProvider = NotifierProvider.autoDispose<LiveCanvasPod, LiveCanvasState>(
  LiveCanvasPod.new,
  name: 'LiveCanvasPod',
);

class LiveCanvasPod extends Notifier<LiveCanvasState> {
  /// Public accessor for the provider instance
  static final me = _liveCanvasProvider;

  @override
  LiveCanvasState build() {
    ref.onDispose(_dispose);
    initializeSocketSync();
    return const LiveCanvasState();
  }

  void selectTool(CanvasTool tool) => state = state.copyWith(currentTool: tool);

  void setStrokeColor(int colorValue) => state = state.copyWith(strokeColor: colorValue);

  void _dispose() {
    disconnectSocket();
  }
}
```

When arguments or family-like initialization is needed (e.g., board ID or space ID), use named constructors with factories:
```dart
final _boardSessionProvider = NotifierProvider.autoDispose(
  () => BoardSessionPod.create(boardId: ''),
  name: 'BoardSessionPod',
);

class BoardSessionPod extends Notifier<BoardSessionState> {
  static final me = _boardSessionProvider;

  final String boardId;
  BoardSessionPod.create({required this.boardId});
  ...
}
```

### 12.2 State Definition with Equatable

Every Pod has a corresponding `<name>_state.dart` declaring an immutable state class:

```dart
// live_canvas_state.dart
import 'package:equatable/equatable.dart';
import 'package:athenaeum/core/enums/canvas_tool.dart';

class LiveCanvasState extends Equatable {
  final bool isLoading;
  final CanvasTool currentTool;
  final int strokeColor;
  final double strokeWidth;
  final int activeCollaboratorsCount;
  final String? errorMessage;

  const LiveCanvasState({
    this.isLoading = false,
    this.currentTool = CanvasTool.pen,
    this.strokeColor = 0xFF000000,
    this.strokeWidth = 3.0,
    this.activeCollaboratorsCount = 1,
    this.errorMessage,
  });

  LiveCanvasState copyWith({
    bool? isLoading,
    CanvasTool? currentTool,
    int? strokeColor,
    double? strokeWidth,
    int? activeCollaboratorsCount,
    String? errorMessage,
  }) {
    return LiveCanvasState(
      isLoading: isLoading ?? this.isLoading,
      currentTool: currentTool ?? this.currentTool,
      strokeColor: strokeColor ?? this.strokeColor,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      activeCollaboratorsCount: activeCollaboratorsCount ?? this.activeCollaboratorsCount,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    currentTool,
    strokeColor,
    strokeWidth,
    activeCollaboratorsCount,
    errorMessage,
  ];
}
```

### 12.3 Extension Part Files (`ext_on_*_pod.dart`)

To keep Pod classes lean and readable, auxiliary routines (WebSocket event handlers, stroke smoothing calculations, audio recording listeners) are separated into a `part` file:

```dart
// In live_canvas_pod.dart:
part 'ext_on_live_canvas_pod.dart';

// In ext_on_live_canvas_pod.dart:
part of 'live_canvas_pod.dart';

extension ExtOnLiveCanvasPod on LiveCanvasPod {
  void initializeSocketSync() {
    // Connect to real-time multiplayer canvas channel
  }

  void disconnectSocket() {
    // Unsubscribe and release canvas sync channel
  }
}
```

### 12.4 Extension Helpers on Providers

Use the custom Riverpod extension helpers defined in `lib/core/base/extensions/src/extension_on_provider.dart`:

```dart
// Reading state
final state = MyPod.me.read(ref);       // WidgetRef
final state = MyPod.me.readX(ref);      // Ref (inside notifiers)

// Watching state
final state = MyPod.me.watch(ref);      // WidgetRef
final state = MyPod.me.watchX(ref);     // Ref

// Accessing the Notifier instance
final notifier = MyPod.me.not(ref);     // WidgetRef
final notifier = MyPod.me.notX(ref);    // Ref

// Watching the Notifier instance
final notifier = MyPod.me.watchNot(ref);
final notifier = MyPod.me.watchNotX(ref);

// Auto-caching / keep-alive
ref.keepAliveFor(const Duration(minutes: 5));
```

### 12.5 Controller Lifecycle Management

Use `TextEditingControllerFactoryMixin` or dedicated teardown callbacks to manage text controllers, audio recorders, and focus nodes in Pods:
- Call `useTextEditingController()` to register controllers.
- Call `disposeControllers()` inside `ref.onDispose` to prevent memory leaks.

### 12.6 Sub-Pod Aggregation

When a top-level feature coordinates multiple sub-tabs or sub-features (e.g., `MainPod` managing tabs), expose sub-providers directly on the parent Pod class as static properties:

```dart
class MainPod extends Notifier<MainState> {
  static final me = _mainProvider;

  // Sub-tab pod accessors
  static final hangoutTab = HangoutTabPod.me;
  static final spacesTab = SpacesTabPod.me;
  static final calendarTab = CalendarTabPod.me;
}
```

---

## 13. Shared Packages & Preferences

| Concern | Package | Pattern / Usage |
|---|---|---|
| State Management | `flutter_riverpod: ^3.3.2` | Pod Structure (`NotifierProvider`, `me` static accessor, `ext_on_*_pod.dart`) |
| Data Models | `equatable: ^2.0.8` | Immutable states, value equality via `props` and `copyWith` |
| Routing & Navigation | `go_router: ^17.3.0` | Declarative routing with instant drop-in deep links in `app_router.dart` |
| Local Storage | `drift: ^2.34.3` + `shared_preferences` + `kickin_storage` | Typed SQLite tables (cached boards, checklists), key-value settings, secure storage |
| Networking & Sync | `kickin_network: ^0.0.3` | `Api.instance` modular REST client & real-time socket connections |
| Asset Management | `flutter_gen: ^5.12.0` | Type-safe generated assets in `lib/app/assets/` |
| Component Modularity | Native Flutter | Extract UI into focused files under `widgets/` (all files < 200 lines) |

---

## 14. AI Tooling & Contribution Guidelines

1. **Verify Existing Precedent**: Before generating new files or folder structures, inspect existing canonical collaborative modules (`spaces`, `canvas`, `calendar`, `checklist`, `voice_reactions`).
2. **Follow Riverpod Pod Pattern**: All new stateful features must use `Notifier<State>` or `AsyncNotifier<State>`, provide a static `me` accessor, use `ext_on_*_pod.dart` for auxiliary logic when needed, and maintain an immutable `*State` class.
3. **Modular Widgets Under 200 Lines**: Never output monolithic screens with inlined 500-line build methods. Extract distinct widgets into separate files under `ui/widgets/`.
4. **No UI Imperative Code in Widgets**: Modals, drop-in actions, audio triggers, and navigation must reside in `ui/actions/<feature>_actions.dart`.
5. **Strict Isolation of `main`**: Never place unrelated screens or features inside `lib/features/main/`. Feature grouping is permitted under domains (e.g., `features/account/`), but `main` cannot be grouped with anything else.
6. **Instant Drop-In Over Links**: All meeting and sprint flows must prioritize instant drop-in routing via the built-in calendar directly into live boards or checklists.
7. **Maintain `cache_progress.md`**: Keep tracking progress, architecture updates, and notes for subsequent sessions in `cache_progress.md` at the project root.
