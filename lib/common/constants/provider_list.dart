import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:visual_notes/providers/manufactre_provider.dart';

class ProviderList {
  static final List<SingleChildWidget> providerList = [
    ChangeNotifierProvider<ManufacturerProvider>(
        lazy: false, create: (context) => ManufacturerProvider()),
  ];
}
