import 'package:flutter/material.dart';
import 'package:quotes_app/controller/routes.dart';

class MyQuotesApp extends StatelessWidget {
  const MyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/view',
      routes: AppRoutes.routes,
    );
  }
}
