import 'package:flutter/material.dart';

class FlutterFlowIconButton extends StatelessWidget {
  final double borderRadius;
  final double buttonSize;
  final Color? fillColor;
  final Widget icon;
  final VoidCallback? onPressed;

  const FlutterFlowIconButton({
    super.key,
    this.borderRadius = 8,
    this.buttonSize = 40,
    this.fillColor,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: Material(
        color: fillColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
