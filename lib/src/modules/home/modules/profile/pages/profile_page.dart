import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/core/app_images.dart';
import 'package:gastos_app/src/modules/home/modules/profile/components/profile_value.dart';
import 'package:gastos_app/src/modules/home/modules/profile/profile_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                child: Image.asset(
                  AppImages.profileImage,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ProfileValue(title: "Nome", value: "Fulano da Silva"),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ProfileValue(title: "Apelido", value: "Fulaninho"),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ProfileValue(title: "E-mail", value: "fulano@silva.com"),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:
                    ProfileValue(title: "Telefone", value: "(13) 99999-9999"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed(ProfileRoutes.editProfile);
                },
                child: const Text("Editar"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
