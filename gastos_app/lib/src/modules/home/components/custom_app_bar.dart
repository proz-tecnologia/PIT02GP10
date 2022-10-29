import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_images.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            AppImages.logo2,
            fit: BoxFit.contain,
          ),
          InkWell(
            child: const Icon(
              Icons.menu,
              size: 30,
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 68);
}
