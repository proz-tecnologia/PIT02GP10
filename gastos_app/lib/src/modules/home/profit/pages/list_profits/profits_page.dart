import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/modules/home/profit/pages/list_profits/components/empty_page.dart';
import 'package:gastos_app/src/modules/home/profit/pages/list_profits/components/error_page.dart';
import 'package:gastos_app/src/modules/home/profit/pages/list_profits/components/profits_list.dart';
import 'package:gastos_app/src/modules/home/profit/pages/list_profits/controllers/profits_page_controller.dart';
import 'package:gastos_app/src/modules/home/profit/pages/list_profits/profits_page_states.dart';
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
    profitsPageController.getProfitsList();
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
                  onPressed: () {
                    Modular.to.pop();
                  },
                )),
            Text(
              "Ganhos",
              style: textStyle,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ValueListenableBuilder<ProfitsPageState>(
                builder: (context, state, _) {
                  if (state is ProfitPageStateSuccess) {
                    return ProfitsList(
                      onRefresh: profitsPageController.getProfitsList,
                      profits: state.profitsList,
                    );
                  } else if (state is ProfitPageStateLoading) {
                    return const Center(
                      child: CustomLoadingIcon(
                        valueColor: AppColors.profitColor,
                      ),
                    );
                  } else if (state is ProfitPageStateError) {
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
