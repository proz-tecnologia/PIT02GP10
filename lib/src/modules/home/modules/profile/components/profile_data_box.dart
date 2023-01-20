import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/models/user_model.dart';
import 'package:gastos_app/src/modules/home/modules/profile/components/profile_value.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/picture_pick_box/components/picture_box.dart';

class ProfileDataBox extends StatelessWidget {
  const ProfileDataBox({
    Key? key,
    required this.user,
    required this.onEditUser,
    this.onRemovePicture,
    this.onPictureUpload,
  }) : super(key: key);

  final UserModel user;
  final VoidCallback onEditUser;
  final VoidCallback? onRemovePicture;

  final Future<String?> Function(File file)? onPictureUpload;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.20,
          child: Center(
            child: PictureBox(
              pictureUrl: user.avatarUrl,
              onRemovePicture: onRemovePicture,
              onPictureUpload: onPictureUpload,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ProfileValue(title: "Nome", value: user.name),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ProfileValue(title: "Apelido", value: user.nickname ?? '-'),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ProfileValue(title: "E-mail", value: user.email),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ProfileValue(title: "Telefone", value: user.phone ?? '-'),
        ),
        const SizedBox(height: 20),
        Center(
          child: CustomElevatedButton(
            backgroundColor: AppColors.expenseColor,
            onPressed: onEditUser,
            child: const Text("Editar Perfil"),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
