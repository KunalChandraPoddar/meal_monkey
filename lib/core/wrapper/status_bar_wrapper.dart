import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarWrapper extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const StatusBarWrapper({
    super.key,
    required this.child,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = backgroundColor.computeLuminance() < 0.5;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness:
            isDark ? Brightness.dark : Brightness.light,
      ),
      child: child,
    );
  }
}