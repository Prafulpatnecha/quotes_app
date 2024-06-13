import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:share_extend/share_extend.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/utils/font_list_globle.dart';
import 'package:quotes_app/utils/imagelist.dart';
import 'package:quotes_app/utils/quoteslist.dart';
import 'package:quotes_app/utils/quotes_model.dart';
import '../../utils/globle_values.dart';
import '../category_view/view_category.dart';
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
          imageBool = false;
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
            PageView.builder(
             scrollDirection: Axis.vertical,
              itemCount: quotesModelText!.quotesModelList.length,
              // options:
              //     CarouselOptions(height: double.infinity,scrollDirection: Axis.vertical),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    fullUsingColumn(w, index),
                    (optionAdd)
                        ? (quotesModelText!.quotesModelList[index].fav == false)
                            ? containerButton(
                                iconfind: const Icon(
                                  Icons.bookmark_border,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                alignmentFind: const Alignment(0, 0.66),
                                onPass: () {
                                  setState(() {
                                    favEmpty.add(quotesListGroup[index]);
                                    quotesListGroup[index]['fav'] = true;
                                  });
                                })
                            : containerButton(
                                iconfind: const Icon(
                                  Icons.bookmark,
                                  color: Colors.red,
                                  size: 40,
                                ),
                                alignmentFind: const Alignment(0, 0.66),
                                onPass: () {
                                  // setState(() {
                                  // quotesListGroup[index]['fav']=false;
                                  // });
                                  Navigator.of(context).pushNamed('/book');
                                })
                        : Container(),(optionAdd)
                            ? Container(
                                alignment: const Alignment(0, 0.88),
                                child: IconButton(
                                  style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                          Colors.white12)),
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
                                        setState(() {
                                          imageBool = false;
                                            shareTextFind = quotesModelText!
                                                .quotesModelList[
                                                    index]
                                                .quotes!;
                                            shareTextFindTwo = quotesModelText!
                                                .quotesModelList[
                                                    index]
                                                .author!;
                                        });
                                        // Share.share('check out my website https://example.com');
                                        Navigator.of(context)
                                            .pushNamed('/screen');
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
                                          imageBool = true;
                                            shareTextFind = quotesModelText!
                                                .quotesModelList[index]
                                                .quotes!;
                                            shareTextFindTwo = quotesModelText!
                                                .quotesModelList[
                                                    index]
                                                .author!;
                                          Navigator.of(context)
                                              .pushNamed('/screen');
                                        });
                                      }),
                                  containerButton(
                                      iconfind: const Icon(
                                        Icons.format_paint_outlined,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      alignmentFind:
                                          const Alignment(-0.5, 0.66),
                                      onPass: () {
                                        Navigator.of(context)
                                            .pushNamed('/backview');
                                      }),
                                  containerButton(
                                      iconfind: const Icon(
                                        Icons.now_widgets_outlined,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      alignmentFind:
                                          const Alignment(0.62, 0.88),
                                      onPass: () {
                                        Navigator.of(context)
                                            .pushNamed('/category');
                                      }),
                                  containerButton(
                                      iconfind: const Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      alignmentFind:
                                          const Alignment(-0.62, 0.88),
                                      onPass: () {
                                        Clipboard.setData(ClipboardData(
                                            text: quotesModelText!
                                                    .quotesModelList[
                                                        index]
                                                    .quotes!));
                                      }),
                                  containerButton(
                                    iconfind: const Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    alignmentFind: const Alignment(0, 0.88),
                                    onPass: () {
                                      setState(() {
                                        optionAdd = true;
                                      });
                                    },
                                  ),
                                ],
                              ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Container containerButton(
  //     {required Icon iconfind,
  //     required Alignment alignmentFind,
  //     required VoidCallback onPass}) {
  //   return Container(
  //     alignment: alignmentFind,
  //     child: IconButton(
  //       style: ButtonStyle(
  //           backgroundColor: WidgetStateProperty.all(Colors.white12)),
  //       onPressed: onPass,
  //       icon: iconfind,
  //     ),
  //   );
  // }
}

class ScreenShort extends StatefulWidget {
  const ScreenShort({super.key});

  @override
  State<ScreenShort> createState() => _ScreenShortState();
}

class _ScreenShortState extends State<ScreenShort> {
  @override
  Widget build(BuildContext context) {
    if (imageBool == true) {
      Timer.periodic(
        const Duration(seconds: 1),
        (timer) async {
          Navigator.of(context).pop();
          RenderRepaintBoundary boundary = imageKey.currentContext!
              .findRenderObject() as RenderRepaintBoundary;
          ui.Image imageUi = await boundary.toImage();
          ByteData? byteData =
              await imageUi.toByteData(format: ui.ImageByteFormat.png);
          Uint8List img = byteData!.buffer.asUint8List();
          ImageGallerySaver.saveImage(img);
        },
      );
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: RepaintBoundary(
        key: imageKey,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    quotesModelImage!.quotesModelList[selectImageIndex].image!,
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: width * 0.9,
                          child: Text(
                            shareTextFind.toString(),
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
                    shareTextFindTwo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colorFilled,
                        fontSize: 20,
                        fontFamily:
                            quotesModelFont!.quotesModelList[selectFont].font),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.white12),
                          iconSize: WidgetStateProperty.all(30)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.navigate_before)),
                ],
              ),
            ],
          ),
          Align(
            alignment: const Alignment(0.09, 0.7),
            child: IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white12),
                  iconSize: WidgetStateProperty.all(30),
                ),
                onPressed: () async {
                  RenderRepaintBoundary boundary = imageKey.currentContext!
                      .findRenderObject() as RenderRepaintBoundary;
                  ui.Image imageUi = await boundary.toImage();
                  ByteData? byteData =
                      await imageUi.toByteData(format: ui.ImageByteFormat.png);
                  Uint8List img = byteData!.buffer.asUint8List();
                  final path = await getApplicationCacheDirectory();
                  File file = File("${path.path}/img.png");
                  file.writeAsBytes(img);
                  // int location= WallpaperManager.HOME_SCREEN;
                  // bool result=await WallpaperManager.clearWallpaper();
                  // result=await WallpaperManager.setWallpaperFromFile(file.path, location);
                  ShareExtend.share(file.path, "image");
                },
                icon: const Icon(
                  Icons.share,
                )),
          ),
          Align(
            alignment: const Alignment(0.09, 0.88),
            child: IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white12),
                  iconSize: WidgetStateProperty.all(30),
                ),
                onPressed: () async {
                  RenderRepaintBoundary boundary = imageKey.currentContext!
                      .findRenderObject() as RenderRepaintBoundary;
                  ui.Image imageUi = await boundary.toImage();
                  ByteData? byteData =
                      await imageUi.toByteData(format: ui.ImageByteFormat.png);
                  Uint8List img = byteData!.buffer.asUint8List();
                  final path = await getApplicationCacheDirectory();
                  File file = File("${path.path}/img.png");
                  file.writeAsBytes(img);
                  int location= WallpaperManager.HOME_SCREEN;
                  bool result=await WallpaperManager.clearWallpaper();
                  result=await WallpaperManager.setWallpaperFromFile(file.path, location);
                  // ShareExtend.share(file.path, "image");
                },
                icon: const Icon(
                  Icons.wallpaper,
                )),
          ),
        ],
      ),
    );
  }
}
