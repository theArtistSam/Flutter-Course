import 'package:flutter/material.dart';
import 'package:flutter_app/screens/detailed_screen.dart';
import 'package:flutter_app/screens/sample_screen.dart';
import 'package:flutter_app/screens/splash_screen.dart';
import 'package:flutter_app/utils/bottom_navbar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and set the path manually
  final appDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(
      appDocDir.path); // Ensure path is initialized correctly
  await Hive.openBox('dataBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
