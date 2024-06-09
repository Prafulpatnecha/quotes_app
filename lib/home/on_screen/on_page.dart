
import 'dart:async';

import 'package:flutter/material.dart';

class OnScreen extends StatefulWidget {
  const OnScreen({super.key});

  @override
  State<OnScreen> createState() => _OnScreenState();
}

class _OnScreenState extends State<OnScreen> {
  @override
    initState()
    {
      super.initState();
      Timer(
        const Duration(seconds: 3),
        ()=> Navigator.of(context).pushReplacementNamed('/')
          );
    }
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/i4.jpg'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        alignment: const Alignment(0,-0.6),
        child: const Text('“Inspirational”\n“Quotes”',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 30),),
      ),
    );
  }
}
// Inspirational Quotes