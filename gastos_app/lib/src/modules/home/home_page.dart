import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/home/components/bottom_navigation_bar/custom_bottom_navigation.dart';
import 'package:gastos_app/src/modules/home/components/custom_app_bar.dart';
import 'package:gastos_app/src/modules/home/components/drawer/custom_drawer.dart';
import 'package:gastos_app/src/modules/home/components/home_body.dart';
import 'package:gastos_app/src/modules/home/controller/home_controller.dart';
import 'package:gastos_app/src/modules/home/home_states.dart';
import 'package:gastos_app/src/repositories/auth/auth_repository.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final homeController = HomeController();

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
          onLogout: () {
            AuthRepository.logout();
          },
        ),
        body: ValueListenableBuilder<HomeStates>(
          valueListenable: homeController.homeStateNotifier,
          builder: (context, state, _) {
            if (state is HomeStateSuccess) {
              final success = state;

              return HomeBody(
                expenses: success.expensesList,
                profits: success.profitsList,
                loggedUser: success.loggedUser,
                onPopBack: () {
                  homeController.loadData();
                },
              );
            } else if (state is HomeStateError) {
              return Center(child: Text(state.error));
            } else if (state is HomeStateLoading) {
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
