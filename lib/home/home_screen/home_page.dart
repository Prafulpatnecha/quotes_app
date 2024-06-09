import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/utils/imagelist.dart';
import 'package:quotes_app/utils/quoteslist.dart';
import 'package:quotes_app/utils/quotes_model.dart';

import '../../utils/globle_values.dart';

QuotesModel? quotesModelImage;
QuotesModel? quotesModelText;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    quotesModelImage=QuotesModel.toList(iList: imagesList);
    quotesModelText=QuotesModel.toList(iList: quotesListGroup);
  double h=MediaQuery.of(context).size.height;
  double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: quotesModelImage!.quotesModelList[10].image!,
            fit: BoxFit.cover
          ),
        ),
        child: Stack(
          children: [
            CarouselSlider.builder(itemCount: quotesModelText!.quotesModelList.length, options: CarouselOptions(height: h,scrollDirection: Axis.vertical), itemBuilder: (BuildContext context, int index, int realIndex) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: w*0.9,child: Text(quotesModelText!.quotesModelList[index].quotes!.toString(),textAlign: TextAlign.center,style: TextStyle(color: colorFilled,fontSize: 25,fontWeight: FontWeight.bold),)),
                  const SizedBox(height: 50,),
                  Text(quotesModelText!.quotesModelList[index].author!,textAlign: TextAlign.center,style: TextStyle(color: colorFilled,fontSize: 20),),
                ],
              );
            },),
            (optionAdd)?Container(
              alignment: const Alignment(0,0.8),
                child: IconButton(
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white12)),
                onPressed: () {
                    setState(() {
                      optionAdd=false;
                    });
                },
                icon:const Icon(Icons.add,color: Colors.white,size: 40,),),)
                :
            Stack(
              children: [
                containerButton(iconfind: const Icon(Icons.share,color: Colors.white,size: 40,),alignmentFind: const Alignment(0,0.55), onPass: () {  }),
                containerButton(iconfind: const Icon(Icons.download_for_offline_outlined,color: Colors.white,size: 40,),alignmentFind: const Alignment(0.5,0.66), onPass: () {  }),
                containerButton(iconfind: const Icon(Icons.format_paint_outlined,color: Colors.white,size: 40,),alignmentFind: const Alignment(-0.5,0.66), onPass: () {  }),
                containerButton(iconfind: const Icon(Icons.settings_outlined,color: Colors.white,size: 40,),alignmentFind: const Alignment(-0.62,0.88), onPass: () {  }),
                containerButton(iconfind: const Icon(Icons.now_widgets_outlined,color: Colors.white,size: 40,),alignmentFind: const Alignment(0.62,0.88), onPass: () {  }),
                containerButton(iconfind: const Icon(Icons.cancel_outlined,color: Colors.white,size: 40,), alignmentFind: const Alignment(0,0.8),onPass: () {
                  setState(() {
                    optionAdd=true;
                  });
                },),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container containerButton({required Icon iconfind,required Alignment alignmentFind,required VoidCallback onPass}) {
    return Container(
            alignment: alignmentFind,
            child: IconButton(
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white12)),
              onPressed: onPass,
              icon: iconfind,),);
  }
}

