import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_images.dart';

class AnimatedCat extends StatefulWidget {
  const AnimatedCat({
    Key? key,
    this.runAnimation = false,
  }) : super(key: key);
  final bool runAnimation;

  @override
  State<AnimatedCat> createState() => _AnimatedCatState();
}

class _AnimatedCatState extends State<AnimatedCat>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 450),
      vsync: this,
      value: 0,
      lowerBound: 0,
      upperBound: 1,
    );

    controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  TickerFuture? runAnimation() {
    if (controller.isDismissed) return controller.forward();
    return null;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.runAnimation) runAnimation();
    return Opacity(
      opacity: controller.value,
      child: Image.asset(
        AppImages.logo3,
      ),
    );
  }
}
