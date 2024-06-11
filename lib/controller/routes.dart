import 'package:flutter/material.dart';
import 'package:quotes_app/home/booklist/book_screen.dart';
import 'package:quotes_app/home/category_page/category_screen.dart';
import 'package:quotes_app/home/category_view/view_category.dart';

import '../home/background_changes/back_page.dart';
import '../home/home_screen/home_page.dart';
import '../home/on_screen/on_page.dart';

class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes={
    '/':(context)=>const HomePage(),
    '/view':(context)=>const OnScreen(),
    '/backview':(context)=>const BackGChange(),
    '/screen':(context)=>const ScreenShort(),
    '/category':(context)=>const CategoryPage(),
    '/view-category':(context)=>const ViewCategory(),
    '/book':(context)=>const BookScreen(),
  };
}