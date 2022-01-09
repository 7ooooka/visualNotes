import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:visual_notes/main.dart';
import 'package:visual_notes/models/manufacturer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visual_notes/providers/manufactre_provider.dart';
class ManufactreHelper{
  ManufacturerProvider _provider = Provider.of<ManufacturerProvider>(navigatorKey.currentContext!, listen: false);
  Future<File> getImage({required ImageSource source}) async {
    final picker = ImagePicker();
    final pickedFile =
    await picker.pickImage(source: source, imageQuality: 20);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      log('No image selected');
      return File("");
    }
  }
  activateToggleBtn(isSelected,index){
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
    }
  }

  Future<void> uploadManufacture({required Manufacture manufacture,required File imageFile}) async {
    Reference reference =
    FirebaseStorage.instance.ref().child("profileImages");
    UploadTask  uploadTask = reference.putFile(imageFile);

    TaskSnapshot taskSnapshot = await uploadTask;
    DocumentReference documentReference =await FirebaseFirestore.instance.collection("Manufactres").doc();
    manufacture.image = await taskSnapshot.ref.getDownloadURL();
    manufacture.id = documentReference.id;
    _provider.addManufacturer(manufacture);
    documentReference.set(manufacture.toJson());
  }

  getAllManufacturers() async {
    List<Manufacture>manufacturers = [];
    await FirebaseFirestore.instance
        .collection("Manufactres")
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          manufacturers.add(Manufacture.fromJson(element.data()));
        }
      }
    });
    _provider.manufacturers = manufacturers;
  }
  updateManufacture({required Manufacture manufacturer})
  async {
    if(manufacturer.imagePath!=""){
      Reference reference =
      FirebaseStorage.instance.ref().child("profileImages");
      UploadTask  uploadTask = reference.putFile(File(manufacturer.imagePath));

      TaskSnapshot taskSnapshot = await uploadTask;
      manufacturer.image = await taskSnapshot.ref.getDownloadURL();
    }
    _provider.updateManufacturer(manufacturer);
     FirebaseFirestore.instance
        .collection("Manufactres").doc(manufacturer.id).update(manufacturer.toJson());

  }
  deleteManufacurer({required Manufacture manufacturer})
  {
    _provider.deleteManufacturer(manufacturer);
    FirebaseFirestore.instance
        .collection("Manufactres").doc(manufacturer.id).delete();
  }
}