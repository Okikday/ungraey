import 'package:flutter/material.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Interactive dual slider row for specifying commodity quantity and dollar reward.
class BountySlidersRow extends StatelessWidget {
  final int quantity;
  final int rewardDollars;
  final ValueChanged<int> onQuantityChanged;
  final ValueChanged<int> onRewardChanged;

  const BountySlidersRow({
    super.key,
    required this.quantity,
    required this.rewardDollars,
    required this.onQuantityChanged,
    required this.onRewardChanged,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quantity: $quantity items',
                style: TextStyle(color: pure.textSecondary, fontSize: 12),
              ),
              Slider(
                value: quantity.toDouble(),
                min: 5,
                max: 200,
                divisions: 39,
                activeColor: pure.primary,
                onChanged: (v) => onQuantityChanged(v.toInt()),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reward: \$$rewardDollars',
                style: TextStyle(color: pure.textSecondary, fontSize: 12),
              ),
              Slider(
                value: rewardDollars.toDouble(),
                min: 1,
                max: 100,
                divisions: 99,
                activeColor: pure.secondary,
                onChanged: (v) => onRewardChanged(v.toInt()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
