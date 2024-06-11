import 'package:flutter/material.dart';

import '../utils/globle_values.dart';
import 'home_screen/home_page.dart';

Column fullUsingColumn(double w, int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: w * 0.9,
              child: Text(
                quotesModelText!
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
        quotesModelText!.quotesModelList[index].author!,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: colorFilled,
            fontSize: 20,
            fontFamily: quotesModelFont!
                .quotesModelList[selectFont].font),
      ),
    ],
  );
}