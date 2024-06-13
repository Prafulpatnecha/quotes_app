import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes_app/utils/quotes_model.dart';
import '../../utils/globle_values.dart';
import '../../utils/quoteslist.dart';
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
    Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        setState(() {
        });
      },
    );
    if(shareBool==true)
      {
    quotesModelEmpty = QuotesModel.toList(iList: emptyList);
      }
    else{
    quotesModelEmpty = QuotesModel.toList(iList: favEmpty);
    }
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
              itemCount: quotesModelEmpty!.quotesModelList.length,
              // options:
              // CarouselOptions(height: h, scrollDirection: Axis.vertical),
              itemBuilder: (context, index) {
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
                        ? (quotesModelEmpty!.quotesModelList[index].fav == false)
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
                          if(shareBool==true)
                          {
                            Navigator.of(context).pushNamed('/book');
                            // quotesModelEmpty = QuotesModel.toList(iList: emptyList);
                          }
                          else{
                            // quotesModelEmpty = QuotesModel.toList(iList: favEmpty);
                            Navigator.of(context).pop();
                          }
                          // Navigator.of(context).pushNamed('/book');
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
                                shareTextFind = quotesModelEmpty!
                                    .quotesModelList[
                                index]
                                    .quotes!;
                                shareTextFindTwo = quotesModelEmpty!
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
                                shareTextFind = quotesModelEmpty!
                                    .quotesModelList[index]
                                    .quotes!;
                                shareTextFindTwo = quotesModelEmpty!
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
                              Icons.navigate_before,
                              color: Colors.white,
                              size: 40,
                            ),
                            alignmentFind:
                            const Alignment(0.62, 0.88),
                            onPass: () {
                              Navigator.of(context).pop();
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
                                  text: quotesModelEmpty!
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
