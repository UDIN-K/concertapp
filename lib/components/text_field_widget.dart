import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldModel extends FlutterFlowModel<TextFieldWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.label = true,
    this.helper = false,
    this.hint = '',
    this.value = '',
    this.leading_icon,
    this.leading_icon_present = false,
    this.trailing_icon,
    this.trailing_icon_present = false,
    this.bg,
    this.radius,
    this.variant = 'outlined',
    this.error = false,
    this.onChanged,
    this.obscureText = false,
  });

  final bool label;
  final bool helper;
  final String hint;
  final String value;
  final Widget? leading_icon;
  final bool leading_icon_present;
  final Widget? trailing_icon;
  final bool trailing_icon_present;
  final Color? bg;
  final double? radius;
  final String variant;
  final bool error;
  final void Function(String)? onChanged;
  final bool obscureText;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final bgColor = widget.bg ?? theme.secondaryBackground;
    final borderRadius = widget.radius ?? 12.0;

    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      style: GoogleFonts.urbanist(
        fontSize: 14,
        color: theme.primaryText,
      ),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: GoogleFonts.urbanist(
          fontSize: 14,
          color: theme.secondaryText.withValues(alpha: 0.6),
        ),
        filled: widget.variant == 'filled',
        fillColor: bgColor,
        prefixIcon: widget.leading_icon_present ? Padding(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: widget.leading_icon,
        ) : null,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: widget.trailing_icon_present ? Padding(
          padding: const EdgeInsets.only(right: 16, left: 8),
          child: widget.trailing_icon,
        ) : null,
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: widget.variant == 'filled'
              ? BorderSide.none
              : BorderSide(color: theme.alternate),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: widget.variant == 'filled'
              ? BorderSide.none
              : BorderSide(color: theme.alternate),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: theme.primary),
        ),
        errorBorder: widget.error
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: theme.error),
              )
            : null,
      ),
    );
  }
}
