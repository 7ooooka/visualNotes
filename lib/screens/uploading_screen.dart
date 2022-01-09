import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visual_notes/common/app_dimensions.dart';
import 'package:visual_notes/common/constants/app_colors.dart';
import 'package:visual_notes/common/constants/app_font_size.dart';
import 'package:visual_notes/common/constants/app_text_style.dart';
import 'package:visual_notes/common/navigation/navigation.dart';
import 'package:visual_notes/common/widgets/stats_widgets.dart';
import 'package:visual_notes/helper/manufactre_helper.dart';
import 'package:visual_notes/main.dart';
import 'package:visual_notes/models/manufacturer.dart';

class UploadingScreen extends StatefulWidget {
  Manufacture manufacture;

  UploadingScreen({required this.manufacture});

  @override
  _UploadingScreenState createState() => _UploadingScreenState();
}

class _UploadingScreenState extends State<UploadingScreen> {
  TextEditingController _titleTextController = TextEditingController();
  TextEditingController _descriptionTextController = TextEditingController();
  late StreamController _imageStreamController;
  late StreamController _toggleStreamController;
  File _image = File("");
  ManufactreHelper _manufactreHelper = ManufactreHelper();
  List<bool> isSelected = [true, false];
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _imageStreamController = StreamController.broadcast();
    _toggleStreamController = StreamController.broadcast();
    if(widget.manufacture.id!=""){
      isSelected = [widget.manufacture.status==true,widget.manufacture.status==false];
      _titleTextController.text = widget.manufacture.title;
      _descriptionTextController.text = widget.manufacture.description;
    }
    super.initState();
  }

  @override
  void dispose() {
    _imageStreamController.close();
    _toggleStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.blue_offWhite,
        elevation: 0.0,
        title: Text("Upload Item"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded,
                size: AppDimensions.convertToW(25), color: AppColors.white),
            onPressed: () async {
              Navigation(navigationKey: navigatorKey).goBack();
            }),
      ),
      body: Container(
        height: AppDimensions.height,
        padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.convertToW(20),
            vertical: AppDimensions.convertToH(10)),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                controller: _titleTextController,
                maxLines: null,
                decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.all(AppDimensions.convertToH(10)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Title",
                    hintStyle: AppTextStyles.small_light_grey_100),
                textAlign: TextAlign.start,
                style: AppTextStyles.medium_black,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                controller: _descriptionTextController,
                maxLines: null,
                decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.all(AppDimensions.convertToH(10)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Description",
                    hintStyle: AppTextStyles.small_light_grey_100),
                textAlign: TextAlign.start,
                style: AppTextStyles.medium_black,
              ),
              Container(
                height: AppDimensions.convertToH(40),
                margin: EdgeInsets.symmetric(vertical: AppDimensions.convertToH(40)),
                child:
                StreamBuilder(
                stream: _toggleStreamController.stream,
    builder: (context, streamSnapshot) {
                  return
                ToggleButtons(
                  borderColor: AppColors.grey_light_50,
                  fillColor: AppColors.Jelly_Bean,
                  borderWidth: 1,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Open',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Close',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    _manufactreHelper.activateToggleBtn(isSelected, index);
                    _toggleStreamController.sink.add("refrsh");
                  },
                  isSelected: isSelected,
                );})
              ),
           
              StreamBuilder(
                  stream: _imageStreamController.stream,
                  builder: (context, streamSnapshot) {
                    if (streamSnapshot.hasData && _image.path != "") {
                      File file = streamSnapshot.data as File;
                      return Image.file(
                        file,
                        width: AppDimensions.width,
                        height: AppDimensions.convertToH(180),
                        fit: BoxFit.contain,
                      );
                    } else if (widget.manufacture.id!="" && _image.path == "") {
                      return Container(
                        height: AppDimensions.convertToH(180),
                        width: AppDimensions.width,
                        child: CachedNetworkImage(
                          imageUrl: widget.manufacture.image,
                          fit: BoxFit.contain,
                          useOldImageOnUrlChange: true,
                          placeholder: (context, url) => Icon(Icons.error),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
              SizedBox(
                height: AppDimensions.convertToH(10),
              ),
              StreamBuilder(
                  stream: _imageStreamController.stream,
                  builder: (context, streamSnapshot) {
                    if (streamSnapshot.hasData && _image.path != "") {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.convertToW(20),
                            vertical: AppDimensions.convertToH(7)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border:
                              Border.all(color: AppColors.light_grey, width: 2),
                        ),
                        child: InkWell(
                          onTap: () {
                            _image = File("");
                            _imageStreamController.sink.add(_image);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: AppColors.dark_red,
                                size: AppDimensions.convertToH(20),
                              ),
                              SizedBox(
                                width: AppDimensions.convertToW(5),
                              ),
                              Text(
                                "Remove",
                                style: TextStyle(
                                    color: AppColors.dark_red,
                                    fontSize: AppFontSize.small,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return _image.path == "" || widget.manufacture.id==""
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.convertToW(20),
                                  vertical: AppDimensions.convertToH(7)),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    color: AppColors.light_grey, width: 2),
                              ),
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => Wrap(children: [
                                      ListTile(
                                        leading: Icon(Icons.camera_alt),
                                        title: Text("camera"),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _manufactreHelper
                                              .getImage(
                                                  source: ImageSource.camera)
                                              .then((value) {
                                            _image = value;
                                            _imageStreamController.sink
                                                .add(_image);
                                          });
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.photo_album),
                                        title: Text("Gallery"),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _manufactreHelper
                                              .getImage(
                                                  source: ImageSource.gallery)
                                              .then((value) {
                                            _image = value;
                                            _imageStreamController.sink
                                                .add(_image);
                                          });
                                        },
                                      ),
                                    ]),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.file_copy,
                                      size: 20,
                                      color: AppColors.Jelly_Bean,
                                    ),
                                    SizedBox(
                                      width: AppDimensions.convertToW(5),
                                    ),
                                    Text(
                                      widget.manufacture.id!="" &&
                                              _image.path == ""
                                          ? "Edit"
                                          : "Add Photo",
                                      style: TextStyle(
                                          color: AppColors.Jelly_Bean,
                                          fontSize: AppFontSize.small,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : SizedBox();
                    }
                  }),
              Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: AppDimensions.convertToH(60),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent),
                          child: ElevatedButton(
                              onPressed: () async {
                            if (_formKey.currentState!.validate()&& _image.path!=""||_formKey.currentState!.validate()&&widget.manufacture.id!="") {
                              showLoading(context);
                              if(widget.manufacture.id!=""){
                                widget.manufacture.description=_descriptionTextController.text;
                                widget.manufacture.title=_titleTextController.text;
                                widget.manufacture.status=isSelected.first?isSelected.first:false;
                                widget.manufacture.imagePath=_image.path;
                                await _manufactreHelper.updateManufacture(manufacturer: widget.manufacture);
                              }else {
                                await _manufactreHelper.uploadManufacture(
                                    manufacture: Manufacture(
                                        title: _titleTextController.text,
                                        description: _descriptionTextController.text,
                                        status: isSelected.first?isSelected.first:false,
                                        date: DateTime.now().millisecondsSinceEpoch
                                    ),
                                    imageFile: _image);
                              }
                                 dismissLoading();
                                 Navigator.pop(context);
                            }
                              },
                              style: ElevatedButton.styleFrom(
                                  splashFactory: NoSplash.splashFactory,
                                  primary: AppColors.Jelly_Bean,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 0.0),
                              child: FittedBox(
                                child: Text(
                                  widget.manufacture.id!=""?"Update": "Upload",
                                  style: AppTextStyles.medium_dark_white_bold,
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
