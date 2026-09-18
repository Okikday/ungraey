# Aura Design System
### Universal Specification for Modern Fluid Interfaces (Ungraey Edition)

---

## 1. Philosophy & Aesthetic Pillars

The **Aura Design System** is built on the belief that software should feel tangible, calm, and exquisitely crafted. Interfaces should move with physical spring momentum, eliminate visual clutter, and prioritize typography and spatial depth over heavy decorative frames.

### Guiding Principles
1. **Calibrated Depth Over Flatness**: Never use sterile, dead greys or flat pure whites. Surfaces use subtle ambient luminescence, delicate primary color tinting, and multi-stop gradient masks.
2. **Unified Actions Over Scattered Buttons**: Related tools (e.g., Search + Filter) are fused into single floating squircle pills rather than isolated circles.
3. **Clutter-Free Canvases**: Destructive actions and drag handles do not float over content. Dragging is initiated by long-pressing headers; secondary tools live cleanly in context menus.
4. **Physicality & Spring Dynamics**: Views resist, stretch, and snap with authentic spring physics. Navigation transitions require intent (pulling past a calibrated threshold before "giving in").
5. **Dual Layout Modes (Framed vs. Plain)**: Users can switch seamlessly between structured squircle containers and distraction-free sequential raw canvas layouts.

---

## 2. Color System & Surface Luminescence

### 2.1 The Two-Color Principle
Interfaces strictly derive their visual hierarchy from **two core brand colors**:
- **`Primary`**: The authoritative brand tint used for active states, key CTAs, focus indicators, and selected pills. In Ungraey, this is **Luminous Emerald** (`#10B981` in dark mode, `#059669` in light mode), evoking circular renewal and thriving vitality.
- **`Secondary`**: The complementary accent used for code syntax, auxiliary tags, badges, and creative highlights. In Ungraey, this is **Warm Radiant Amber** (`#F59E0B`), symbolizing converted value and cash bounty rewards.

Avoid introducing uncurated tertiary colors. Variety is achieved through tonal opacity and alpha blending.

### 2.2 Surface Tinting Formula (`.blendColor`)
To establish depth and harmony in dark or light modes, elevated surfaces and content cards are lightly tinted with the primary hue:

$$\text{Surface Tint} = \text{baseSurface}.\text{blendColor}(\text{primary}, \alpha)$$

| Element Type | Tint Factor ($\alpha$) | Border Alpha | Use Case |
| :--- | :--- | :--- | :--- |
| **Scaffold Background** | `0.00` (Pure dark `#0D1110` / light `#F8FAF9`) | None | Base view canvas |
| **Standard Card / Frame** | `0.05 – 0.07` | `0.18 – 0.24` | Structured content containers |
| **Floating Action Pill** | `0.08 – 0.10` | `0.28 – 0.35` | Floating top bars, bottom docks |
| **Hero / Active Indicator**| `0.14 – 0.18` | `0.45 – 0.55` | Focused pills, active counter tags |
| **AI / Dynamic Gradient** | Blend Primary + Secondary | `0.30` | Intelligence surfaces, creative tools |

```dart
// Example: Surface tinting implementation
final cardBackground = theme.pure.surface.blendColor(theme.pure.primary, 0.06);
final cardBorder = theme.pure.borderSubtle.withValues(alpha: 0.22);
```

### 2.3 Hairline Borders & Ambient Shadows
- **Hairline Borders**: Always `1.0px` width. Borders never use opaque solid colors; they use `borderSubtle.withValues(alpha: 0.15 - 0.35)` to catch light without looking harsh.
- **Soft Ambient Shadows**:
  ```dart
  boxShadow: [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ]
  ```

---

## 3. The `BackdropShadow` Construct (Apple-Grade Dissolve)

When views scroll underneath floating top navigation bars or bottom docks, hard cutoff lines look unrefined. The `BackdropShadow` creates a non-linear, multi-stop gradient dissolve mask with decal-tiled backdrop blur, causing content to seamlessly fade into the background.

```
┌────────────────────────────────────────────────────────┐
│ Floating Top Bar                                       │
├┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┤ ◄ High Alpha (1.0)
│                                                        │
│   Seamless Gradient Dissolve Mask (10-Stop Falloff)    │
│                                                        │
├┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┤ ◄ Zero Alpha (0.0)
│ Scrollable Content Flow                                │
└────────────────────────────────────────────────────────┘
```

### 3.1 Architectural Implementation
```dart
import 'dart:ui';
import 'package:flutter/material.dart';

/// Renders a non-linear gradient shadow mask with decal blur.
/// Content scrolling underneath dissolves naturally into the background.
class BackdropShadow extends StatelessWidget {
  final double height;
  final (Alignment from, Alignment to) shadowDirection;
  final bool applyBlur;
  final Color? color;

  const BackdropShadow({
    super.key,
    required this.height,
    this.shadowDirection = const (Alignment.bottomCenter, Alignment.topCenter),
    this.applyBlur = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = color ?? theme.scaffoldBackgroundColor;
    final gradientProps = _computeGradientProps(effectiveColor);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2, tileMode: TileMode.decal),
        enabled: applyBlur,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: shadowDirection.$1,
              end: shadowDirection.$2,
              colors: gradientProps.$1,
              stops: gradientProps.$2,
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Container(
            height: height,
            color: effectiveColor,
          ),
        ),
      ),
    );
  }

  /// 10-stop progressive alpha curve preventing linear banding
  (List<Color>, List<double>) _computeGradientProps(Color color) {
    return (
      [for (int i = 0; i < 10; i++) color.withValues(alpha: 1.0 - (i * 0.1))],
      [for (int i = 0; i < 10; i++) i * 0.1],
    );
  }
}
```

- **`BlendMode.dstIn`**: Preserves the destination pixels only where the gradient mask has alpha, producing a feather-smooth edge.
- **`TileMode.decal`**: Ensures the blur does not bleed past the bounding box edges.

---

## 4. Animation Curves & Tactile Micro-Interactions

### 4.1 Curated Spring Curves (`KCurves`)
Standard linear and ease-in-out curves feel artificial. Interfaces rely on three calibrated spring curves:

| Curve Token | Cubic / Spring Parameters | Motion Feel | Primary Usage |
| :--- | :--- | :--- | :--- |
| **`KCurves.defaultIosSpring`** | `Cubic(0.25, 0.1, 0.25, 1.0)` | Fluid, natural inertia | Size transitions, accordion expansion |
| **`KCurves.bouncySpring`** | `Cubic(0.175, 0.885, 0.32, 1.275)` | Tactile, energetic overshoot | Section page slides, dock snapping |
| **`KCurves.snappySpring`** | `Cubic(0.05, 0.9, 0.1, 1.0)` | Ultra-responsive, immediate | Sheet presentation, tab switches |

### 4.2 Safe Animation Clamping (`_ClampedCurve`)
```dart
class ClampedCurve extends Curve {
  final Curve curve;
  const ClampedCurve(this.curve);

  @override
  double transform(double t) => curve.transform(t.clamp(0.0, 1.0));
}
```

### 4.3 Decoupled Scale Feedback (`ScaleClickWrapper`)
Interactive tiles, cards, and buttons should compress slightly upon press (`0.96` scale) and spring back upon release. Decouple gesture recognition from state changes using `AnimatedScale` + `ValueNotifier`.

---

## 5. Background Grid & Canvas Drawing (`CanvasGridPainter`)

To give structured or free-form canvases a subtle drafting feel without raster images, render a mathematical vector dot matrix with `CustomPainter`.

---

## 6. The Floating Pill & Unified Dock System

Related actions (Search + Filter, or Main Tab Navigation) are fused into a single floating squircle pill with 1px hairline dividers and background luminescence.

---

## 7. Dividers, Dotted Lines & Decorated Footers

Symmetrical outward gradient footer lines with a reactive center pill indicate the end of scrollable content feeds.

---

## 8. Physical Motion & Threshold Snapping

Pull-to-refresh and section switches require `55.0px` overscroll before triggering, accompanied by `HapticFeedback.mediumImpact()`.

---

## 9. Clutter-Free Drag & Context Menus

Header long-press initiates card reordering. No floating drag handles over clean content.

---

## 10. Dual Layout Modes: Framed vs. Plain Canvas

Support toggling between framed squircle containers (`.blendColor(primary, 0.06)`) and distraction-free plain canvas layouts.

---

## 11. Floating Audio & Quick Action Pills

Pulsing glow indicators with tabular timers and equalizer waveforms for live state recording.

---

## 12. Live Search Highlighting (`SearchHighlightedText`)

Real-time substring matching highlights matching query characters with a tinted squircle pill.

---

## 13. Extended Markdown Persistence Schema

Lightweight, human-readable data serialization for notes, descriptions, and trade conditions.

---

## 14. Component Architecture & Code Standards

- Riverpod state management with granular `.select()`.
- Maximum 200 lines per UI file.
- Zero magic numbers.
- Haptic feedback on all tactile events.

---

## 15. Viewfinder HUD & Scanning Mesh (Ungraey Extension)

The **Viewfinder HUD** creates a high-tech, tactile camera interface for snapping waste piles:

```
┌────────────────────────────────────────────────────────┐
│  [ ⚡ Flash ]                [ 5-Mile Active Radius ]   │
│                                                        │
│       ┌──                                    ──┐       │
│       │   [ 📦 Corrugated Cardboard • 96% ]    │       │
│       │   ════════ Scanning Laser ════════     │       │
│       │   [ 🪵 Treated Lumber • 88% ]          │       │
│       └──                                    ──┘       │
│                                                        │
│                  ( ◉ Capture Shutter )                 │
└────────────────────────────────────────────────────────┘
```

1. **Corner Reticles**: `24px` length, `2.5px` stroke with `BorderRadius.circular(4)` in `pure.primary`.
2. **Scanning Laser Beam**: Vertical translating sweep using `LinearGradient([transparent, primary.withValues(alpha: 0.6), transparent])`.
3. **Detected Bounding Boxes**: Semi-transparent floating squircle boxes over detected material regions with an attached label pill (`pure.primary` background with tabular confidence percentage).
4. **Shutter Button**: Dual concentric ring button (`72px` outer ring, `58px` inner core) that compresses to `0.90` on tap with `HapticFeedback.heavyImpact()`.

---

## 16. Material Tag Chips & Bounties Matching Badge (Ungraey Extension)

When materials are detected in a snap or listed in a bounty:

```
┌────────────────────────────────────────────────────────┐
│ 📦 Corrugated Cardboard │ 3 Local Bounties │ $14.50 Earnable │
└────────────────────────────────────────────────────────┘
```

- **Base Container**: Height `32px`, `BorderRadius.circular(100)`, padding `horizontal: 10, vertical: 4`.
- **Background**: `pure.surface.blendColor(pure.primary, 0.08)`.
- **Border**: `pure.primary.withValues(alpha: 0.28)`.
- **Match Indicator**: Green pulsing dot (`8px`) when active local buyers are seeking this exact category.

---

## 17. Earth Forward Eco-Dial & Metric Progress (Ungraey Extension)

To satisfy the hackathon's Earth Forward visualizer criteria, the **Eco-Dial Gauge** translates waste diverted into high-impact ecological metrics:

```
                  ╭───────────────╮
              ╭───╯   15.4 kg     ╰───╮
             │       DIVERTED          │
             │   32.8 kg CO2e Avoided  │
              ╰───╮   🌿 1.4 Trees    ╭───╯
                  ╰───────────────╯
```

1. **Multi-Arc Sweep Painter**:
   - Outer Ring: Landfill Diversion (kg) — `pure.primary` gradient.
   - Middle Ring: CO2e Offset (kg) — Radiant Cyan gradient.
   - Inner Ring: Tree Equivalent — Warm Amber gradient.
2. **Spring Interpolation**: Uses `KCurves.bouncySpring` to animate dial numbers up from zero upon screen presentation.
3. **Tabular Figures**: Always enforce `fontFeatures: [FontFeature.tabularFigures()]` on numeric values to prevent jitter during live updates.

---

## 18. Cryptographic Handoff QR Card & Scanner (Ungraey Extension)

For the closed-loop QR exchange between seller and buyer:

1. **Pulsing Expiration Halo**:
   - The QR card is enclosed in an animated gradient stroke that smoothly pulses from `pure.primary` to `pure.secondary`.
   - Countdown timer pill (`01:59 remaining`) rendered in monospaced tabular figures.
2. **Scanner Reticle**:
   - Dedicated camera viewfinder overlay with high-contrast corner reticles.
   - On successful QR detection: immediate `HapticFeedback.mediumImpact()`, followed by an audio-visual chime and transition to `HandoffCelebrationView`.

---

## 19. Floating Dynamic Nearby Alert Pill (Ungraey Extension)

Real-time bid and supply pings drop down from the top status bar:

```
┌────────────────────────────────────────────────────────────────┐
│  ⚡ New Bounty: Ceramics Studio wants 50 Glass Jars ($5.00) • 1.2mi  │
└────────────────────────────────────────────────────────────────┘
```

- **Entrance Motion**: Slides down from `-60px` with `KCurves.bouncySpring`.
- **Auto-Dismiss**: Resides for `4000ms`, then slides upward smoothly.
- **Interactive**: Tapping immediately opens the bounty details or match preview.
