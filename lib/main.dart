import 'package:doodle_blur_task/app/core/boot_up/injection_container.dart';
import 'package:doodle_blur_task/app/features/business/presentation/screens/business_screen.dart';
import 'package:flutter/material.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoodleBlue',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BusinessScreen(),
    );
  }
}
