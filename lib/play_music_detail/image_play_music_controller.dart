import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class PlayMusicController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController animationController;
  var isAnimating = false.obs;
  @override
  void onInit() {
    super.onInit();
    print('Init controller');
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    animationController.dispose();
  }

  void startAnimation(){
    if(animationController.isAnimating){
      isAnimating.value = false;
      animationController.stop();
    }else{
      isAnimating.value = true;
      animationController.forward();
      animationController.repeat();
    }
  }
}