import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/modules/home/home_routes.dart';

class HomeFAButton extends StatelessWidget {
  const HomeFAButton({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Modular.to.pushNamed(HomeRoutes.createProfit).then((value) {
                if (value == true) {
                  onRefresh();
                }
              });
            },
            child: Row(
              children: [
                const Icon(
                  Icons.add_circle,
                  color: AppColors.profitColor,
                  size: 24,
                ),
                const SizedBox(width: 6),
                Text(
                  "Ganho",
                  style: textStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          InkWell(
            onTap: () {
              Modular.to.pushNamed(HomeRoutes.createExpense).then(
                (value) {
                  if (value == true) {
                    onRefresh();
                  }
                },
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.remove_circle,
                  color: AppColors.expenseColor,
                  size: 24,
                ),
                const SizedBox(width: 6),
                Text(
                  "Despesa",
                  style: textStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
