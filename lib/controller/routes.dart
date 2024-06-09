import 'package:flutter/material.dart';

import '../home/home_screen/home_page.dart';
import '../home/on_screen/on_page.dart';

class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes={
    '/':(context)=>const HomePage(),
    '/view':(context)=>const OnScreen(),
  };
}