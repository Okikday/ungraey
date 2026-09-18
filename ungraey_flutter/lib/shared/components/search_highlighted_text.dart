import 'package:flutter/material.dart';
import '../theme/pure_theme_extension.dart';

/// Renders text with real-time highlighted search terms in a tinted pill span.
class SearchHighlightedText extends StatelessWidget {
  final String text;
  final String searchQuery;
  final TextStyle style;

  const SearchHighlightedText({
    super.key,
    required this.text,
    required this.searchQuery,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    if (searchQuery.trim().isEmpty) return Text(text, style: style);

    final theme = context.pureTheme;
    final spans = <InlineSpan>[];
    final lowerText = text.toLowerCase();
    final lowerQuery = searchQuery.toLowerCase().trim();

    int start = 0;
    while (true) {
      final index = lowerText.indexOf(lowerQuery, start);
      if (index == -1) {
        spans.add(TextSpan(text: text.substring(start)));
        break;
      }
      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index)));
      }
      final match = text.substring(index, index + lowerQuery.length);
      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
            decoration: BoxDecoration(
              color: theme.primary.withValues(alpha: 0.22),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              match,
              style: style.copyWith(
                color: theme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );
      start = index + lowerQuery.length;
    }

    return Text.rich(TextSpan(children: spans, style: style));
  }
}
