import 'package:flutter/cupertino.dart';
import 'package:visual_notes/models/manufacturer.dart';

class ManufacturerProvider with ChangeNotifier{
   List <Manufacture>_manufacturers = [];
  List<Manufacture> get manufacturers => _manufacturers;

  set manufacturers(List<Manufacture> manufacturers) {
    _manufacturers = manufacturers;
    notifyListeners();
  }
  addManufacturer(Manufacture manufacturer) {
    _manufacturers.add(manufacturer);
    notifyListeners();
  }

   updateManufacturer(Manufacture manufacturer) {
    int index= _manufacturers.indexWhere((element) => element.id == manufacturer.id);
    _manufacturers[index] = manufacturer;
     notifyListeners();
   }
   deleteManufacturer(Manufacture manufacturer) {
     _manufacturers.remove(manufacturer);
     notifyListeners();
   }
}