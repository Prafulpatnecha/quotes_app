import 'dart:async';
// import 'package:share_plus/share_plus.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes_app/utils/quotes_model.dart';
import '../../utils/globle_values.dart';
import '../home_screen/home_page.dart';

QuotesModel? quotesModelEmpty;

class ViewCategory extends StatefulWidget {
  const ViewCategory({super.key});

  @override
  State<ViewCategory> createState() => _ViewCategoryState();
}

class _ViewCategoryState extends State<ViewCategory> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 1),
          () {
        setState(() {
        });
      },
    );
    quotesModelEmpty = QuotesModel.toList(iList: emptyList);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: quotesModelImage!.quotesModelList[selectImageIndex].image!,
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: quotesModelEmpty!.quotesModelList.length,
              options:
              CarouselOptions(height: h, scrollDirection: Axis.vertical),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                selectIndexCopy = index - 1;
                return Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: w * 0.9,
                                child: Text(
                                  quotesModelEmpty!
                                      .quotesModelList[index].quotes!
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: colorFilled,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: quotesModelFont!
                                        .quotesModelList[selectFont].font,
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          quotesModelEmpty!.quotesModelList[index].author!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorFilled,
                              fontSize: 20,
                              fontFamily: quotesModelFont!
                                  .quotesModelList[selectFont].font),
                        ),
                      ],
                    ),
                    (optionAdd)
                        ? containerButton(
                        iconfind: const Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                          size: 40,
                        ),
                        alignmentFind: const Alignment(0, 0.72),
                        onPass: () {})
                        : Container(),
                  ],
                );
              },
            ),
            (optionAdd)
                ? Container(
              alignment: const Alignment(0, 0.8),
              child: IconButton(
                style: ButtonStyle(
                    backgroundColor:
                    WidgetStateProperty.all(Colors.white12)),
                onPressed: () {
                  setState(() {
                    optionAdd = false;
                  });
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            )
                : Stack(
              children: [
                containerButton(
                    iconfind: const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 40,
                    ),
                    alignmentFind: const Alignment(0, 0.55),
                    onPass: () {
                      imageBool=false;
                      // Share.share('check out my website https://example.com');
                      Navigator.of(context).pushNamed('/screen');
                    }),
                containerButton(
                    iconfind: const Icon(
                      Icons.download_for_offline_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    alignmentFind: const Alignment(0.5, 0.66),
                    onPass: () {
                      setState(() {
                        imageBool=true;
                        if(selectIndexCopy == -1){
                          selectIndexCopy=quotesModelEmpty!.quotesModelList.length-1;
                        }
                        Navigator.of(context).pushNamed('/screen');
                      });
                    }),
                containerButton(
                    iconfind: const Icon(
                      Icons.format_paint_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    alignmentFind: const Alignment(-0.5, 0.66),
                    onPass: () {
                      Navigator.of(context).pushNamed('/backview');
                    }),
                containerButton(
                    iconfind: const Icon(
                      Icons.navigate_before,
                      color: Colors.white,
                      size: 40,
                    ),
                    alignmentFind: const Alignment(0.62, 0.88),
                    onPass: () {
                      Navigator.of(context).pop();
                    }),
                containerButton(
                    iconfind: const Icon(
                      Icons.copy,
                      color: Colors.white,
                      size: 40,
                    ),
                    alignmentFind: const Alignment(-0.62, 0.88),
                    onPass: () {
                      Clipboard.setData(ClipboardData(
                          text: (selectIndexCopy != -1)
                              ? quotesModelEmpty!
                              .quotesModelList[selectIndexCopy]
                              .quotes!
                              : quotesModelEmpty!
                              .quotesModelList[quotesModelEmpty!
                              .quotesModelList.length -
                              1]
                              .quotes!));
                    }),
                containerButton(
                  iconfind: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  alignmentFind: const Alignment(0, 0.8),
                  onPass: () {
                    setState(() {
                      optionAdd = true;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Container containerButton(
      {required Icon iconfind,
        required Alignment alignmentFind,
        required VoidCallback onPass}) {
    return Container(
      alignment: alignmentFind,
      child: IconButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white12)),
        onPressed: onPass,
        icon: iconfind,
      ),

    );
  }
}
