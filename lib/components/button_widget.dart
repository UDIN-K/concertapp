import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonModel extends FlutterFlowModel<ButtonWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.content,
    this.icon,
    this.icon_present = false,
    this.icon_end,
    this.icon_end_present = false,
    this.variant = 'primary',
    this.size = 'medium',
    this.full_width = false,
    this.loading = false,
    this.disabled = false,
    this.onPressed,
  });

  final String content;
  final Widget? icon;
  final bool icon_present;
  final Widget? icon_end;
  final bool icon_end_present;
  final String variant;
  final String size;
  final bool full_width;
  final bool loading;
  final bool disabled;
  final VoidCallback? onPressed;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    Color bgColor;
    Color textColor;
    Border? border;

    switch (widget.variant) {
      case 'ghost':
        bgColor = Colors.transparent;
        textColor = theme.secondaryText;
        border = null;
        break;
      case 'outline':
        bgColor = Colors.transparent;
        textColor = theme.primaryText;
        border = Border.all(color: theme.alternate);
        break;
      case 'secondary':
        bgColor = theme.secondaryBackground;
        textColor = theme.primaryText;
        border = null;
        break;
      default: // primary
        bgColor = theme.primary;
        textColor = theme.onPrimary;
        border = null;
    }

    double vPad;
    double hPad;
    double fontSize;
    switch (widget.size) {
      case 'small':
        vPad = 8;
        hPad = 16;
        fontSize = 13;
        break;
      case 'large':
        vPad = 16;
        hPad = 24;
        fontSize = 16;
        break;
      default: // medium
        vPad = 12;
        hPad = 20;
        fontSize = 14;
    }

    final buttonChild = widget.loading
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: textColor,
            ),
          )
        : Row(
            mainAxisSize:
                widget.full_width ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon_present && widget.icon != null) ...[
                widget.icon!,
                const SizedBox(width: 8),
              ],
              Text(
                widget.content,
                style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              if (widget.icon_end_present && widget.icon_end != null) ...[
                const SizedBox(width: 8),
                widget.icon_end!,
              ],
            ],
          );

    return GestureDetector(
      onTap: widget.disabled ? null : widget.onPressed,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: widget.disabled ? 0.5 : 1.0,
        child: Container(
          width: widget.full_width ? double.infinity : null,
          padding: EdgeInsets.symmetric(vertical: vPad, horizontal: hPad),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(14),
            border: border,
            boxShadow: widget.variant == 'primary'
                ? [
                    BoxShadow(
                      color: theme.primary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Center(
            widthFactor: widget.full_width ? null : 1.0,
            child: buttonChild,
          ),
        ),
      ),
    );
  }
}
