import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';

class CustomLoadingIcon extends StatelessWidget {
  const CustomLoadingIcon({
    Key? key,
    this.valueColor = AppColors.primaryColor,
    this.size,
  }) : super(key: key);

  final Color valueColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ),
    );
  }
}
