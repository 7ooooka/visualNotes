import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:visual_notes/common/constants/app_colors.dart';
import 'package:visual_notes/main.dart';



class BottomSheetCustom{

  static BottomSheetCustom? _instance;

  BottomSheetCustom._internal();

  factory BottomSheetCustom() {
    return _instance ??= BottomSheetCustom._internal();
  }

  void displayModalBottomSheet({
    BuildContext? context,
    bool isDismiss:true,
    double? fixedSize,
    required Widget widget,
    Color color:Colors.white,
    bool showDivider:true,
  }) {
    showModalBottomSheet(
        context: context ?? navigatorKey.currentContext!,
        isDismissible: isDismiss,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        ),
        builder: (BuildContext context) {
          return Container(
            height: fixedSize,
            child: Column(
              children: [
                showDivider? Container(
                    height: 50,
                    width: 50,
                    color: Colors.transparent,
                    child:Center(child: Container(
                        width: 70,
                        height: 6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(3)))),)
                ):SizedBox(),
                Expanded(
                  child: Container(
                    width: double.infinity,
                      decoration:BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),) ,
                      child: widget),
                )
              ],
            ),
          );
        });
  }
}