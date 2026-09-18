import 'package:ungraey_client/ungraey_client.dart';
export 'package:ungraey_client/ungraey_client.dart' show RewardType;

/// UI presentation helpers on [RewardType].
extension RewardTypeUiExtension on RewardType {
  String get label {
    switch (this) {
      case RewardType.cash:
        return 'Cash Payout';
      case RewardType.points:
        return 'Eco Points';
      case RewardType.trade:
        return 'Direct Item Trade';
    }
  }

  String get badgePrefix {
    switch (this) {
      case RewardType.cash:
        return '\$';
      case RewardType.points:
        return 'PTS ';
      case RewardType.trade:
        return '🔄 ';
    }
  }
}
