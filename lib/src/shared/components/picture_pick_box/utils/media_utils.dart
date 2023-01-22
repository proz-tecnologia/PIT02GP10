import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';

class MediaUtils {
  static void openMediaSelectModal({
    required BuildContext context,
    VoidCallback? onTakePicture,
    VoidCallback? onChooseFromGallery,
    VoidCallback? onRemovePicture,
  }) {
    const backgroundColor = AppColors.primaryColor;
    const iconColor = AppColors.fontColor;
    const borderRadius = 20.0;

    showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      elevation: 5.0,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
      ),
      barrierColor: Colors.black.withAlpha(90),
      builder: (BuildContext context) {
        final sizes = MediaQuery.of(context).size;

        return SafeArea(
          child: Container(
            constraints: BoxConstraints(maxHeight: sizes.height * 0.5),
            decoration: const BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 28),
                        if (onTakePicture != null)
                          ListTile(
                            leading: const Icon(
                              Icons.add_a_photo,
                              color: iconColor,
                            ),
                            title: const Text("Tirar foto"),
                            onTap: onTakePicture,
                          ),
                        if (onChooseFromGallery != null)
                          ListTile(
                            leading: const Icon(
                              Icons.photo_album,
                              color: iconColor,
                            ),
                            title: const Text("Usar foto existente"),
                            onTap: onChooseFromGallery,
                          ),
                        if (onRemovePicture != null)
                          ListTile(
                            leading: const Icon(
                              Icons.delete,
                              color: iconColor,
                            ),
                            title: const Text("Remover foto"),
                            onTap: onRemovePicture,
                          ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(borderRadius),
                        topRight: Radius.circular(borderRadius),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          width: 40,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.fontColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
