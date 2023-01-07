import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_icons.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconSize = 32.0;

    return Container(
      color: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.trending_up,
              color: AppColors.backgroundColor,
              size: iconSize,
            ),
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              AppIcons.wallet,
              color: AppColors.backgroundColor,
              height: iconSize,
            ),
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              AppIcons.goals,
              color: AppColors.backgroundColor,
              height: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
