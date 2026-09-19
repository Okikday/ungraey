import 'package:flutter/material.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../../../../core/enums/material_category.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Category dropdown for the bounty composer with material emoji labels.
class BountyCategoryField extends StatelessWidget {
  final MaterialCategory category;
  final ValueChanged<MaterialCategory> onChanged;

  const BountyCategoryField({
    super.key,
    required this.category,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return DropdownButtonFormField<MaterialCategory>(
      initialValue: category,
      decoration: InputDecoration(
        labelText: 'Material Category',
        labelStyle: TextStyle(color: pure.textMuted, fontSize: 13),
        filled: true,
        fillColor: pure.surfaceHighlight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
      dropdownColor: pure.surface,
      items: [
        for (final cat in MaterialCategory.values)
          DropdownMenuItem(
            value: cat,
            child: Text('${cat.emoji} ${cat.displayName}'),
          ),
      ],
      onChanged: (v) => onChanged(v ?? category),
    );
  }
}
