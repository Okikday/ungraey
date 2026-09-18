import 'package:flutter/material.dart';
import '../../../../core/enums/material_category.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Horizontal scrolling category selector pills for the bounty feed.
class CategoryFilterPills extends StatelessWidget {
  final MaterialCategory? selectedCategory;
  final ValueChanged<MaterialCategory?> onSelect;

  const CategoryFilterPills({
    super.key,
    required this.selectedCategory,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _FilterPill(
            label: 'All Materials',
            emoji: '✨',
            isSelected: selectedCategory == null,
            onTap: () => onSelect(null),
          ),
          const SizedBox(width: 8),
          for (final cat in MaterialCategory.values) ...[
            _FilterPill(
              label: cat.displayName,
              emoji: cat.emoji,
              isSelected: selectedCategory == cat,
              onTap: () => onSelect(cat),
            ),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  final String label;
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterPill({
    required this.label,
    required this.emoji,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return ScaleClickWrapper(
      scaleBetween: const (1.0, 0.94),
      onPressed: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? pure.primary.withValues(alpha: 0.20)
              : pure.surface.blendColor(pure.primary, 0.05),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isSelected
                ? pure.primary.withValues(alpha: 0.6)
                : pure.borderSubtle.withValues(alpha: 0.25),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 13)),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? pure.primary : pure.textSecondary,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
