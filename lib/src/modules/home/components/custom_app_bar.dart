import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_images.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.onOpenDrawer,
  }) : super(key: key);

  final VoidCallback onOpenDrawer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            AppImages.logo2,
            fit: BoxFit.contain,
          ),
          InkWell(
            onTap: onOpenDrawer,
            child: const Icon(
              Icons.menu,
              size: 30,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 68);
}
