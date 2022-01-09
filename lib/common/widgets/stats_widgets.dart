import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.dark
    ..maskType = EasyLoadingMaskType.black
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

/// For Loading Widget
void showLoading(context) {
  configLoading();
  EasyLoading.show(status: "Loading");
}

void dismissLoading() {
  EasyLoading.dismiss();
}

void showError(String message) {
  EasyLoading.showError(message, duration: Duration(seconds: 3));
}

void showSuccesses(context, String message) {
  EasyLoading.showSuccess(message, duration: Duration(seconds: 3));
}

void showInfo(message) {
  EasyLoading.showInfo(message, dismissOnTap: true);
}

void showToast(message) {
  EasyLoading.showToast(message, duration: Duration(seconds: 3));
}


void showProgress(message) {
  EasyLoading.showProgress(0.3, status: message);
}

void dismissStatsMessage() {
  EasyLoading.dismiss();
}
