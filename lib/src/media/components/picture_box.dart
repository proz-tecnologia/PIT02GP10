import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/media/controllers/picture_controller.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';
import 'package:gastos_app/src/shared/components/effectless_inkwell.dart';
import 'package:gastos_app/src/shared/components/image_network_builder.dart';

class PictureBox extends StatefulWidget {
  const PictureBox({
    Key? key,
    required this.pictureUrl,
  }) : super(key: key);

  final String? pictureUrl;

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
                  onTap: () {
                    controller.togglePicture(context);
                  },
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
                  onPressed: () {
                    controller.togglePicture(context);
                  },
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
