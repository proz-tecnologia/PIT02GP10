import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/modules/authentication/authentication_routes.dart';
import 'package:gastos_app/src/modules/home/controllers/home_page_controller.dart';
import 'package:gastos_app/src/modules/home/home_routes.dart';
import 'package:gastos_app/src/modules/home/pages/profit/profit_list/components/empty_page.dart';
import 'package:gastos_app/src/modules/home/pages/profit/profit_list/components/error_page.dart';
import 'package:gastos_app/src/modules/home/pages/profit/profit_list/components/profits_list.dart';
import 'package:gastos_app/src/modules/home/pages/profit/profit_list/controllers/profit_list_page_controller.dart';
import 'package:gastos_app/src/modules/home/pages/profit/profit_list/controllers/profit_list_page_states.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';

class ProfitListPage extends StatefulWidget {
  const ProfitListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfitListPage> createState() => _ProfitListPageState();
}

class _ProfitListPageState extends State<ProfitListPage> {
  final profitListPageController = Modular.get<ProfitListPageController>();

  @override
  void initState() {
    profitListPageController.getProfitsList();

    profitListPageController.profitsPageStateNotifier.addListener(() {
      if (profitListPageController.state is ProfitPageStateError) {
        final state = profitListPageController.state as ProfitPageStateError;
        if (state.shouldLogout) {
          Modular.to.pop();
          Modular.to.pushReplacementNamed(AuthenticationRoutes.splash);
        }
      }
    });

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
              child: ValueListenableBuilder<ProfitListPageState>(
                builder: (context, state, _) {
                  if (state is ProfitPageStateSuccess) {
                    return ProfitsList(
                      onRefresh: profitListPageController.getProfitsList,
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
                      onTryAgain: profitListPageController.getProfitsList,
                    );
                  }
                  return EmptyPage(
                    onCreateProfit: () {
                      Modular.to.pushNamed(HomeRoutes.createProfit).then(
                        (value) {
                          if (value == true) {
                            if (value == true) {
                              Modular.get<HomePageController>().loadData();
                              Modular.to.pop();
                            }
                          }
                        },
                      );
                    },
                  );
                },
                valueListenable:
                    profitListPageController.profitsPageStateNotifier,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
