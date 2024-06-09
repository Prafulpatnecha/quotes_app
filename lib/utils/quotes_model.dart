// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'package:flutter/material.dart';

class QuotesModel
{
  AssetImage? image;
  String? quotes;
  String? author;
  List<QuotesModel> quotesModelList=[];
  QuotesModel({this.image,this.author,this.quotes});
  factory QuotesModel.fromQuotes(Map m1)
  {
    return QuotesModel(image: m1['image'],author: m1['author'],quotes: m1['quote']);
  }
  QuotesModel.toList({required List iList,})
  {
    for(int i=0;i<iList.length;i++)
    {
      quotesModelList.add(QuotesModel.fromQuotes(iList[i]));
    }
  }
}