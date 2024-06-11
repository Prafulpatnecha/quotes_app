// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';

class QuotesModel
{
  AssetImage? image;
  String? quotes;
  String? author;
  String? font;
  String? fName;
  Color? color;
  List<QuotesModel> quotesModelList=[];
  QuotesModel({this.color,this.font,this.image,this.author,this.quotes,this.fName});
  factory QuotesModel.fromQuotes(Map m1)
  {
    return QuotesModel(color: m1['color'],image: m1['image'],author: m1['author'],quotes: m1['quote'],font: m1['font'],fName: m1['fName']);
  }
  QuotesModel.toList({required List iList,})
  {
    for(int i=0;i<iList.length;i++)
    {
      quotesModelList.add(QuotesModel.fromQuotes(iList[i]));
    }
  }
}