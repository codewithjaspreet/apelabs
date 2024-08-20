import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

import 'package:get/get.dart';

class ClayController extends GetxController with SingleGetTickerProviderMixin {
  Color baseColor = Colors.indigo;
  RxDouble firstDepth = 50.0.obs;
  RxDouble secondDepth = 50.0.obs;
  RxDouble thirdDepth = 50.0.obs;
  RxDouble fourthDepth = 50.0.obs;
  late AnimationController animationController;
  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        update(); // Trigger GetX update
      });

    animationController.forward();
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  double? stagger(double value, double progress, double delay) {
    progress = progress - (1 - delay);
    if (progress < 0) progress = 0;
    return value * (progress / delay);
  }

  double get calculatedFirstDepth =>
      stagger(firstDepth.value, animationController.value, 0.25)!;
  double get calculatedSecondDepth =>
      stagger(secondDepth.value, animationController.value, 0.5)!;
  double get calculatedThirdDepth =>
      stagger(thirdDepth.value, animationController.value, 0.75)!;
  double get calculatedFourthDepth =>
      stagger(fourthDepth.value, animationController.value, 1)!;
}
