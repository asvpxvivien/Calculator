import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOperation;
  final int flex;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isOperation = false,
    this.flex = 1,
  }) : super(key: key);

  @override
  _CalculatorButtonState createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    HapticFeedback.lightImpact();

    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Expanded(
      flex: widget.flex,
      child: Container(
        margin: EdgeInsets.all(8),
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: widget.isOperation
                      ? LinearGradient(
                          colors: [
                            scheme.primary.withOpacity(0.95),
                            scheme.primary.withOpacity(0.75),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Material(
                  color: widget.isOperation
                      ? Colors.transparent
                      : _getButtonColor(context),
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: _handleTap,
                    child: Container(
                      height: 68,
                      child: Center(
                        child: Text(
                          widget.text,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: _getTextColor(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _getButtonColor(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    if (widget.isOperation) {
      return scheme.primary;
    }

    // Pour les boutons numériques
    return theme.brightness == Brightness.dark
        ? scheme.surfaceContainerHighest
        : scheme.surface;
  }

  Color _getTextColor(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    if (widget.isOperation) {
      return scheme.onPrimary;
    }

    return theme.textTheme.bodyLarge?.color ?? scheme.onSurface;
  }
}
