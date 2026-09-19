import 'package:flutter/animation.dart';

/// Curated spring and inertia animation curves.
class KCurves {
  const KCurves._();

  /// Fluid natural inertia for general transitions.
  static const Curve defaultIosSpring = Cubic(0.25, 0.1, 0.25, 1.0);

  /// Tactile energetic overshoot for pill snap and sheet presentations.
  static const Curve bouncySpring = Cubic(0.175, 0.885, 0.32, 1.275);

  /// Ultra-responsive immediate snappy curve for tab switches.
  static const Curve snappySpring = Cubic(0.05, 0.9, 0.1, 1.0);
}

/// Clamps values into [0.0, 1.0] before applying [curve] to prevent exceptions during overscroll.
class ClampedCurve extends Curve {
  final Curve curve;
  const ClampedCurve(this.curve);

  @override
  double transform(double t) =>
      curve.transform(t.clamp(0.0, 1.0).toDouble());
}
