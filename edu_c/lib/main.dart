import 'package:edu_c/controller/provider/provideroperation.dart';
import 'package:edu_c/utils/theme/theme_data.dart';
import 'package:edu_c/view/pages/splash/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Provideroperation(),
      child: MaterialApp(
        title: 'Edu_C',
        debugShowCheckedModeBanner: false,
        theme: MyTheme.theme,
        home: const SplashScreen(),
      ),
    );
  }
}

