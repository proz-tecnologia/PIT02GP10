import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({
    Key? key,
    required this.child,
    required this.onRefresh,
    this.backgroundColor = AppColors.primaryColor,
    this.foregroundColor = AppColors.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onRefresh;
 final Color backgroundColor;
 final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      edgeOffset: 2,
      displacement: 2,
      strokeWidth: 2,
      color: AppColors.fontColor,
     backgroundColor: backgroundColor,
      onRefresh: () async {
        onRefresh();
      },
      child: child,
    );
  }
}
