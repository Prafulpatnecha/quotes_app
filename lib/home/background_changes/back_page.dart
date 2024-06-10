import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quotes_app/home/home_screen/home_page.dart';
import 'package:quotes_app/utils/globle_values.dart';

class BackGChange extends StatefulWidget {
  const BackGChange({super.key});

  @override
  State<BackGChange> createState() => _BackGChangeState();
}

class _BackGChangeState extends State<BackGChange> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    setState(() {});
    // quotesModelImage=QuotesModel.toList(iList: imagesList);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: height,
              width: width,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                    sigmaX: 15, sigmaY: 15, tileMode: TileMode.mirror),
                child: Image(
                  image: quotesModelImage!
                      .quotesModelList[selectImageIndex].image!,
                  fit: BoxFit.cover,
                ),
              )),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CarouselSlider.builder(
                  options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: true,
                      // enlargeFactor: 600,
                      // height: height/2,
                      autoPlay: true,
                      aspectRatio: 9 / 14),
                  itemCount: quotesModelImage!.quotesModelList.length,
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectImageIndex = index;
                        });
                      },
                      child: (index == selectImageIndex)
                          ? Container(
                              // width: 200,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                image: DecorationImage(
                                  image: quotesModelImage!
                                      .quotesModelList[index].image!,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                'abcd',
                                style: TextStyle(
                                    color: colorFilled,
                                    fontSize: 30,
                                    fontFamily: quotesModelFont!
                                        .quotesModelList[selectFont].font),
                              )),
                            )
                          : Container(
                              // width: 500,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: quotesModelImage!
                                      .quotesModelList[index].image!,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                'abcd',
                                style: TextStyle(
                                    color: colorFilled,
                                    fontSize: 30,
                                    fontFamily: quotesModelFont!
                                        .quotesModelList[selectFont].font),
                              )),
                            ),
                    );
                  },
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Font',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            quotesModelFont!.quotesModelList.length,
                            (index) => (selectFont == index)
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  Colors.black45),
                                          overlayColor: WidgetStateProperty.all(
                                              Colors.white12),
                                          side: WidgetStateProperty.all(
                                              BorderSide(
                                                  color: Colors.white30))),
                                      onPressed: () {},
                                      child: Text(
                                        quotesModelFont!
                                            .quotesModelList[index].fName!,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: quotesModelFont!
                                                .quotesModelList[index].font),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          overlayColor: WidgetStateProperty.all(
                                              Colors.white12),
                                          side: WidgetStateProperty.all(
                                              BorderSide(
                                                  color: Colors.white30))),
                                      onPressed: () {
                                        setState(() {
                                          selectFont = index;
                                        });
                                      },
                                      child: Text(
                                        quotesModelFont!
                                            .quotesModelList[index].fName!,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: quotesModelFont!
                                                .quotesModelList[index].font),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            30,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ListView.builder(scrollDirection: Axis.horizontal,itemCount: 3,itemBuilder: (context, index) => Container(color: Colors.red,height: 10,width: 10,),)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
