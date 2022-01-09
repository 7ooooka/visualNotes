import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:visual_notes/common/constants/provider_list.dart';
import 'common/navigation/router.dart' as router;
import 'package:visual_notes/screens/manufacturers_screen.dart';
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
          providers: ProviderList.providerList,
          child:
      const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: router.generateRoute,
      builder: EasyLoading.init(),
      home:  ManufactreScreen(),
    );
  }
}
