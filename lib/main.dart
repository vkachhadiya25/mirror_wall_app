import 'package:flutter/material.dart';
import 'package:mirror_wall_app/utils/app_routes.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: screenRoutes,
    ),
  );
}

