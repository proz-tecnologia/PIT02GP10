import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_icons.dart';

class DrawerSideIcon extends StatelessWidget {
  const DrawerSideIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 4, top: 10, bottom: 10),
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: SizedBox(
          height: 24,
          child: SvgPicture.asset(
            AppIcons.arrowLeft,
          ),
        ),
      ),
    );
  }
}
