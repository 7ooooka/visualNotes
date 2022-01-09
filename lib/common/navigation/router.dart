import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visual_notes/common/constants/routes.dart';
import 'package:visual_notes/models/manufacturer.dart';
import 'package:visual_notes/screens/manufacturers_screen.dart';
import 'package:visual_notes/screens/uploading_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  log("Route Name:" + settings.name.toString());
  log("Route arg:" + settings.arguments.toString());

  switch (settings.name) {
    case RoutesNames.ManufactreScreen:
      return MaterialPageRoute(
        builder: (context) => ManufactreScreen(),
      );
    case RoutesNames.UploadingScreen:
      return MaterialPageRoute(
        builder: (context) => UploadingScreen(manufacture: settings.arguments as Manufacture,),
      );
    default:
      return MaterialPageRoute(
          builder: (context) => ManufactreScreen(),
        );
  }
}
