// Dependencies
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'ui/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Demo GetX',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}