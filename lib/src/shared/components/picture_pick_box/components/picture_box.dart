// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';
import 'package:gastos_app/src/shared/components/effectless_inkwell.dart';
import 'package:gastos_app/src/shared/components/image_network_builder.dart';
import 'package:gastos_app/src/shared/components/picture_pick_box/controllers/picture_controller.dart';
import 'package:gastos_app/src/shared/components/picture_pick_box/utils/media_utils.dart';
import 'package:image_picker/image_picker.dart';

class PictureBox extends StatefulWidget {
  const PictureBox({
    Key? key,
    required this.pictureUrl,
    this.onRemovePicture,
    this.onPictureUpload,
    required this.onPictureChange,
  }) : super(key: key);

  final String? pictureUrl;
  final void Function()? onRemovePicture;
  final Future<void> Function(File file)? onPictureUpload;
  final void Function(File? picture) onPictureChange;

  @override
  State<PictureBox> createState() => _PictureBoxState();
}

class _PictureBoxState extends State<PictureBox> {
  late final PictureController controller;

  @override
  void initState() {
    controller = PictureController(photoUrl: widget.pictureUrl);
    super.initState();
  }

  void togglePicture() {
    MediaUtils.openMediaSelectModal(
      context: context,
      onTakePicture: () async {
        final file = await controller.pickImage(
          source: ImageSource.camera,
          onPictureUpload: widget.onPictureUpload,
        );
        widget.onPictureChange(file);
        if (Navigator.canPop(context)) Navigator.pop(context);
      },
      onChooseFromGallery: () async {
        final file = await controller.pickImage(
          source: ImageSource.gallery,
          onPictureUpload: widget.onPictureUpload,
        );
        widget.onPictureChange(file);
        if (Navigator.canPop(context)) Navigator.pop(context);
      },
      onRemovePicture: widget.onRemovePicture != null
          ? () {
              if (Navigator.canPop(context)) Navigator.pop(context);
            }
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: ValueListenableBuilder<bool>(
        valueListenable: controller.changePictureNotifier,
        builder: (context, isChanging, _) {
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 2.0,
                  ),
                  shape: BoxShape.circle,
                ),
                child: EffectlessInkWell(
                  onTap: togglePicture,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(200)),
                    child: controller.picture.uploadUrl == null
                        ? const Center(
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: AppColors.fontColor,
                            ),
                          )
                        : ImageNetworkBuilder(
                            controller.picture.uploadUrl!,
                            boxFit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              if (isChanging)
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(190),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(200)),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: CustomLoadingIcon(),
                    ),
                  ),
                ),
              Positioned(
                bottom: 0,
                right: 0,
                child: ElevatedButton(
                  onPressed: togglePicture,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(5),
                  ),
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 20,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
