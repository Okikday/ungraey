import 'package:flutter/material.dart';
import '../theme/pure_theme_extension.dart';

/// Aura unified floating pill fusing Search + Filter actions.
class FloatingSearchFilterPill extends StatelessWidget {
  final VoidCallback onSearchTap;
  final VoidCallback onFilterTap;
  final bool isFilterActive;
  final String? placeholder;

  const FloatingSearchFilterPill({
    super.key,
    required this.onSearchTap,
    required this.onFilterTap,
    this.isFilterActive = false,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: pure.surface.blendColor(pure.primary, 0.08),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: isFilterActive
              ? pure.primary.withValues(alpha: 0.5)
              : pure.borderSubtle.withValues(alpha: 0.28),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.all(6),
              minimumSize: const Size(30, 30),
            ),
            onPressed: onSearchTap,
            icon: Icon(Icons.search_rounded, size: 18, color: pure.textSecondary),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: GestureDetector(
              onTap: onSearchTap,
              child: Text(
                placeholder ?? 'Search materials or bounties...',
                style: TextStyle(color: pure.textMuted, fontSize: 13),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            height: 18,
            width: 1,
            color: pure.borderSubtle.withValues(alpha: 0.35),
          ),
          const SizedBox(width: 4),
          IconButton(
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.all(6),
              minimumSize: const Size(30, 30),
            ),
            onPressed: onFilterTap,
            icon: Icon(
              Icons.tune_rounded,
              size: 18,
              color: isFilterActive ? pure.primary : pure.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
