import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final Color? backgroundColor;

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return (ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
          backgroundColor: MaterialStateProperty.all(backgroundColor)),
      child: child,
    ));
  }
}
