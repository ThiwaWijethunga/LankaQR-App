import 'package:flutter/material.dart';
import 'package:project1/screens/splash_screen.dart';
import 'package:app_links/app_links.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is ready
  final appLinks = AppLinks();

  runApp( MyApp(appLinks: appLinks));
}

class MyApp extends StatelessWidget {
  final AppLinks appLinks;
  const MyApp({Key? key, required this.appLinks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(appLinks: appLinks,)
    );
  }
}