import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/modules/home/profit/pages/list_profits/components/empty_page.dart';
import 'package:gastos_app/src/modules/home/profit/pages/list_profits/components/error_page.dart';
import 'package:gastos_app/src/modules/home/profit/pages/list_profits/components/profits_list.dart';
import 'package:gastos_app/src/modules/home/profit/pages/list_profits/controllers/profits_page_controller.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';

class ProfitsPage extends StatefulWidget {
  const ProfitsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfitsPage> createState() => _ProfitsPageState();
}

class _ProfitsPageState extends State<ProfitsPage> {
  final profitsPageController = ProfitsPageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.profitColor,
          fontSize: 36,
        );
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                )),
            Text(
              "Ganhos",
              style: textStyle,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ValueListenableBuilder(
                builder: (context, state, _) {
                  if (state == ProfitsPageStates.success) {
                    return ProfitsList(
                      onRefresh: profitsPageController.getProfitsList,
                      profits: profitsPageController.profits,
                    );
                  } else if (state == ProfitsPageStates.loading) {
                    return const Center(
                      child: CustomLoadingIcon(
                        valueColor: AppColors.profitColor,
                      ),
                    );
                  } else if (state == ProfitsPageStates.error) {
                    return ErrorPage(
                      onTryAgain: profitsPageController.getProfitsList,
                    );
                  }
                  return EmptyPage(
                    onCreateProfit: () {},
                  );
                },
                valueListenable: profitsPageController.profitsPageStateNotifier,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
