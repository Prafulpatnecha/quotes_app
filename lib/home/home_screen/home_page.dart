import 'dart:async';
import 'dart:ui' as ui;
// import 'package:share_plus/share_plus.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:quotes_app/utils/font_list_globle.dart';
import 'package:quotes_app/utils/imagelist.dart';
import 'package:quotes_app/utils/quoteslist.dart';
import 'package:quotes_app/utils/quotes_model.dart';
import '../../utils/globle_values.dart';
import '../funtions_creating.dart';

QuotesModel? quotesModelImage;
QuotesModel? quotesModelFont;
QuotesModel? quotesModelText;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 1),
      () {
        setState(() {
        });
      },
    );
    quotesModelFont = QuotesModel.toList(iList: fontList);
    quotesModelImage = QuotesModel.toList(iList: imagesList);
    quotesModelText = QuotesModel.toList(iList: quotesListGroup);
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
              itemCount: quotesModelText!.quotesModelList.length,
              options:
                  CarouselOptions(height: h, scrollDirection: Axis.vertical),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                selectIndexCopy = index - 1;
                return Stack(
                  children: [
                    fullUsingColumn(w, index),
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
                               selectIndexCopy=quotesModelText!.quotesModelList.length-1;
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
                            Icons.now_widgets_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          alignmentFind: const Alignment(0.62, 0.88),
                          onPass: () {}),
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
                                    ? quotesModelText!
                                        .quotesModelList[selectIndexCopy]
                                        .quotes!
                                    : quotesModelText!
                                        .quotesModelList[quotesModelText!
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


class ScreenShort extends StatefulWidget {
  const ScreenShort({super.key});

  @override
  State<ScreenShort> createState() => _ScreenShortState();
}

class _ScreenShortState extends State<ScreenShort> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      Navigator.of(context).pop();
      if(imageBool==true){
      RenderRepaintBoundary boundary = imageKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image imageUi = await boundary.toImage();
      ByteData? byteData =
          await imageUi.toByteData(format: ui.ImageByteFormat.png);
        ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
        }else{
        // XFile xFile=await XFile();
        // final result = await Share.shareXFiles([XFile(imageUi.path)], text: 'Great picture');
        //
        // if (result.status == ShareResultStatus.success) {
        //   print('Thank you for sharing the picture!');
        // }
        // Share.shareXFiles([XFile('assets/images/d1.jpg')], text: 'Great picture');
      }

    },);
        // Share.share('check out my website https://example.com');
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RepaintBoundary(
      key: imageKey,
      child: Scaffold(
          body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: quotesModelImage!.quotesModelList[selectImageIndex].image!,
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            fullUsingColumn(width, selectIndexCopy),
          ],
        ),
      ),),
    );
  }
}
