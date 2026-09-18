import 'package:equatable/equatable.dart';

/// A single real-time nearby event surfaced to the user.
class NearbyAlert extends Equatable {
  final String emoji;
  final String headline;
  final String detail;
  final bool isSnap;

  const NearbyAlert({
    required this.emoji,
    required this.headline,
    required this.detail,
    required this.isSnap,
  });

  @override
  List<Object?> get props => [emoji, headline, detail, isSnap];
}

/// State for the live nearby alert pill overlay.
class NearbyAlertState extends Equatable {
  final bool visible;
  final NearbyAlert? alert;

  const NearbyAlertState({this.visible = false, this.alert});

  NearbyAlertState copyWith({bool? visible, NearbyAlert? alert}) {
    return NearbyAlertState(
      visible: visible ?? this.visible,
      alert: alert ?? this.alert,
    );
  }

  @override
  List<Object?> get props => [visible, alert];
}
