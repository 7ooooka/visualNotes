import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visual_notes/common/app_dimensions.dart';
import 'package:visual_notes/common/constants/app_colors.dart';
import 'package:visual_notes/common/constants/app_font_size.dart';
import 'package:visual_notes/common/constants/app_text_style.dart';
import 'package:visual_notes/common/constants/routes.dart';
import 'package:visual_notes/common/navigation/navigation.dart';
import 'package:visual_notes/helper/manufactre_helper.dart';
import 'package:visual_notes/main.dart';
import 'package:visual_notes/models/manufacturer.dart';

class ManufactureCard extends StatelessWidget {
Manufacture manufacture;

ManufactureCard({required this.manufacture});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: AppDimensions.width,
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.convertToH(10),vertical: AppDimensions.convertToH(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                    manufacture.image,
                    width: AppDimensions.convertToW(130),
                    height:AppDimensions.convertToH(80),
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Icon(Icons.error),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                   Text(
                        manufacture.id,
                        style: AppTextStyles.small_dark_grey_w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                Text(manufacture.title,
                    maxLines: 2,
                    style: TextStyle(
                        color: AppColors.red,
                        overflow: TextOverflow.ellipsis,
                        fontSize: AppFontSize.small,
                        fontWeight: FontWeight.w700)),
                Text(
                  manufacture.description,
                  style: AppTextStyles.x_small_bold_black,
                  maxLines: 2,
                ),
                Row(
                        children: [
                          Icon(
                            Icons.local_activity_rounded,
                            color: AppColors.grey,
                            size: 18,
                          ),
                          Text(
                           manufacture.status?"Open":"Closed",
                            style: AppTextStyles.small_dark_grey_w600,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
              ],
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
    Text(
    DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(manufacture.date)),
    style: AppTextStyles.small_dark_grey_w600,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    ),
          IconButton(icon:Icon(Icons.more_horiz),onPressed: (){
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                ),
                builder: (BuildContext context) {
                  return Container(
                    height: AppDimensions.height*0.25,
                    child: Column(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            color: Colors.transparent,
                            child:Center(child: Container(
                                width: 70,
                                height: 6,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(3)))),)
                        ),
                        Expanded(
                          child: Container(
                              width: double.infinity,
                              decoration:BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),) ,
                              child: renderDialogWidget()),
                        )
                      ],
                    ),
                  );
                });
          },)])
        ],
      ),
    );
  }

  Widget renderDialogWidget(){
    return
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppDimensions.convertToW(20),vertical:AppDimensions.convertToW(20) ),
        child: Column(children: [
          InkWell(
            onTap: (){
              Navigation(navigationKey: navigatorKey).goBack();
              Navigation(navigationKey: navigatorKey).navigateTo(routeName: RoutesNames.UploadingScreen,arg: manufacture);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.edit,color:AppColors.red,),
                SizedBox(width: AppDimensions.convertToW(10),),
                Text("edit",style: AppTextStyles.small_bold_black,)
              ],),
          ),
          Divider(color: AppColors.light_grey_100,height: AppDimensions.convertToH(35),),
          InkWell(
            onTap: (){
              Navigation(navigationKey: navigatorKey).goBack();
            ManufactreHelper _helper =ManufactreHelper();
              _helper.deleteManufacurer(manufacturer: manufacture);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.delete,color:AppColors.red,),
                SizedBox(width: AppDimensions.convertToW(10),),
                Text("Delete",style: AppTextStyles.small_bold_black,)
              ],),
          ),
        ],),
      );
  }
}
