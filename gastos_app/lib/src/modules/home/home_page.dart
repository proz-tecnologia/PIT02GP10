import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/modules/authentication/services/auth_service.dart';
import 'package:gastos_app/src/modules/home/components/bottom_navigation_bar/custom_bottom_navigation.dart';
import 'package:gastos_app/src/modules/home/components/custom_app_bar.dart';
import 'package:gastos_app/src/modules/home/components/drawer/custom_drawer.dart';
import 'package:gastos_app/src/modules/home/components/home_body.dart';
import 'package:gastos_app/src/modules/home/controllers/home_page_controller.dart';
import 'package:gastos_app/src/modules/home/controllers/home_page_states.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final homeController = Modular.get<HomePageController>();

  @override
  void initState() {
    homeController.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          onOpenDrawer: () {
            _scaffoldKey.currentState?.openEndDrawer();
          },
        ),
        endDrawer: CustomDrawer(
          onLogout: () async {
            await AuthService().logout();
          },
        ),
        body: ValueListenableBuilder<HomePageState>(
          valueListenable: homeController.homeStateNotifier,
          builder: (context, state, _) {
            if (state is HomePageStateSuccess) {
              final success = state;

              return HomeBody(
                expenses: success.expensesList,
                profits: success.profitsList,
                loggedUser: success.loggedUser,
                onRefresh: () {
                  homeController.loadData();
                },
              );
            } else if (state is HomePageStateError) {
              return Center(child: Text(state.error));
            } else if (state is HomePageStateLoading) {
              return const Center(child: CustomLoadingIcon());
            }
            return const SizedBox();
          },
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
