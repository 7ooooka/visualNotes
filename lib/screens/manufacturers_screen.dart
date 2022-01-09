import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visual_notes/common/app_dimensions.dart';
import 'package:visual_notes/common/constants/app_colors.dart';
import 'package:visual_notes/common/constants/routes.dart';
import 'package:visual_notes/common/navigation/navigation.dart';
import 'package:visual_notes/helper/manufactre_helper.dart';
import 'package:visual_notes/main.dart';
import 'package:visual_notes/models/manufacturer.dart';
import 'package:visual_notes/providers/manufactre_provider.dart';
import 'package:visual_notes/widgets/manufacture_card.dart';

class ManufactreScreen extends StatefulWidget {
  @override
  _ManufactreScreenState createState() => _ManufactreScreenState();
}

class _ManufactreScreenState extends State<ManufactreScreen> {
  ManufactreHelper _manufactreHelper = ManufactreHelper();
  @override
  void initState() {
    _manufactreHelper.getAllManufacturers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AppDimensions(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(backgroundColor: AppColors.blue_offWhite,elevation: 0.0,title: Text("Defects Tracker"),actions:  [
          InkWell(onTap: (){
            Navigation(navigationKey: navigatorKey).navigateTo(routeName: RoutesNames.UploadingScreen,arg: Manufacture());
          },child: Padding(padding: EdgeInsets.symmetric(horizontal: 5),child: Icon(Icons.add,size: AppDimensions.convertToH(30),)))
        ]),
        body:
        Consumer<ManufacturerProvider>(
            builder: (context, providerValue, child) {
          if(providerValue.manufacturers.isNotEmpty){
          return
          ListView.builder(
            shrinkWrap: true,
      padding: EdgeInsets.all(AppDimensions.convertToH(10)),
      itemCount:providerValue.manufacturers.length,
      itemBuilder: (context, index)
      {
        return
            ManufactureCard(manufacture: providerValue.manufacturers[index],);
      });}else{
            return
              const Center(child: CircularProgressIndicator());
          }})
      ),
    );
  }
}
