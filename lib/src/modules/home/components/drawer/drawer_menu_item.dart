import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          color: AppColors.backgroundColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 0,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          children: [
            const SizedBox(width: 20),
            Icon(icon, size: 26),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: titleStyle,
              ),
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
