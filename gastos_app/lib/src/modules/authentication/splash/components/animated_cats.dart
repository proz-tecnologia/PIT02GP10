import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/splash/components/animated_cat.dart';

class AnimatedCats extends StatefulWidget {
  const AnimatedCats({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedCats> createState() => _AnimatedCatsState();
}

class _AnimatedCatsState extends State<AnimatedCats>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  int currentCat = 1;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
      value: 0,
      lowerBound: 1,
      upperBound: 4,
    );

    controller.addListener(() {
      setState(() {
        currentCat = controller.value.toInt();
      });
    });
    runAnimation();
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AnimatedCat(runAnimation: true),
        const SizedBox(width: 12),
        AnimatedCat(runAnimation: currentCat >= 2),
        const SizedBox(width: 12),
        AnimatedCat(runAnimation: currentCat >= 3),
        const SizedBox(width: 12),
        AnimatedCat(runAnimation: currentCat >= 4),
      ],
    );
  }
}
