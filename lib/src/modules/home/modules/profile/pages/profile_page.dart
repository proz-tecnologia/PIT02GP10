import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/modules/home/controllers/home_page_controller.dart';
import 'package:gastos_app/src/modules/home/modules/profile/components/profile_data_box.dart';
import 'package:gastos_app/src/modules/home/modules/profile/controllers/profile_page_controller.dart';
import 'package:gastos_app/src/modules/home/modules/profile/controllers/profile_page_state.dart';
import 'package:gastos_app/src/modules/home/modules/profile/profile_routes.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';
import 'package:gastos_app/src/shared/components/custom_refresh_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Modular.get<ProfilePageController>();

  @override
  void initState() {
    controller.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              ),
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder<ProfilePageState>(
              valueListenable: controller.profilePageStateNotifier,
              builder: (context, state, _) {
                if (state is ProfilePageStateLoading) {
                  return const Expanded(
                    child: Center(
                      child: CustomLoadingIcon(),
                    ),
                  );
                } else if (state is ProfilePageStateSuccess) {
                  final user = state.user;
                  return CustomRefreshIndicator(
                    onRefresh: controller.getUserData,
                    child: ProfileDataBox(
                      user: user,
                      onPictureUpload: (file) async {
                        final url = await controller.updateAvatar(file);
                        await Modular.get<HomePageController>().loadData();
                        return url;
                      },
                      onEditUser: () {
                        Modular.to.pushNamed(ProfileRoutes.editProfile).then(
                          (value) {
                            if (value == true) {
                              controller.getUserData();
                            }
                          },
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
