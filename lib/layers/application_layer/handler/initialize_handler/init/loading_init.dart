import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void loadingInit() {
  EasyLoading easyLoading = EasyLoading.instance;
  easyLoading.animationStyle = EasyLoadingAnimationStyle.opacity;
  easyLoading.animationDuration = const Duration(milliseconds: 500);
  easyLoading.displayDuration = const Duration(seconds: 1);
  easyLoading.indicatorType = EasyLoadingIndicatorType.fadingCircle;
  easyLoading.loadingStyle = EasyLoadingStyle.custom;
  easyLoading.indicatorSize = 45.0;
  easyLoading.radius = 10.0;
  easyLoading.progressColor = Colors.blue;
  easyLoading.backgroundColor = Colors.white;
  easyLoading.indicatorColor = Colors.blue;
  easyLoading.textColor = Colors.blue;
  easyLoading.userInteractions = false;
  easyLoading.dismissOnTap = false;
  easyLoading.maskType = EasyLoadingMaskType.custom;
  easyLoading.maskColor = Colors.blue.withOpacity(0.4);
  easyLoading.errorWidget = const Icon(Icons.error, color: Colors.red);
  easyLoading.successWidget = const Icon(Icons.check_circle, color: Colors.green);
  easyLoading.infoWidget = const Icon(Icons.info, color: Colors.blue);
}
