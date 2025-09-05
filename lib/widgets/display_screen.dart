import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String text;
  final String previousText;
  final String operation;

  const DisplayScreen({
    Key? key,
    required this.text,
    this.previousText = '',
    this.operation = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, 28, 24, 24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Calcul précédent
          if (previousText.isNotEmpty)
            AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: previousText.isNotEmpty ? 1.0 : 0.0,
              child: Text(
                '$previousText $operation',
                style: TextStyle(
                  fontSize: 20,
                  color: theme.textTheme.bodyLarge?.color?.withOpacity(0.6),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

          SizedBox(height: 8),

          // Résultat principal
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOut,
                  ),
                  axisAlignment: -1,
                  child: child,
                ),
              );
            },
            child: Text(
              text,
              key: ValueKey(text),
              style: TextStyle(
                fontSize: _getFontSize(text),
                fontWeight: FontWeight.w300,
                color: theme.textTheme.bodyLarge?.color,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  double _getFontSize(String text) {
    if (text.length <= 6) return 56;
    if (text.length <= 8) return 48;
    if (text.length <= 10) return 40;
    return 32;
  }
}
