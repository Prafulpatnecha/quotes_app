import 'package:flutter/material.dart';
import 'package:quotes_app/utils/quotes_model.dart';
import '../../utils/globle_values.dart';
import '../home_screen/home_page.dart';
QuotesModel? quotesModelBook;
class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    quotesModelBook=QuotesModel.toList(iList: favEmpty);
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
        body:Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: quotesModelImage!.quotesModelList[selectImageIndex].image!,
                fit: BoxFit.cover),
          ),
          child: ListView.builder(itemCount: favEmpty.length,itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              emptyList.clear();
              emptyList.add(favEmpty[index]);
              Navigator.of(context).pushNamed('/view-category');
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white)),
              ),
              child: ListTile(
                title: Text(quotesModelBook!.quotesModelList[index].quotes!),
                subtitle: Text(quotesModelBook!.quotesModelList[index].author!),
                trailing: IconButton(onPressed: () {
                  setState(() {
                    favEmpty[index]['fav']=false;
                    favEmpty.removeAt(index);
                  });
                },icon: Icon(Icons.bookmark,color: Colors.red,),),
              ),
            ),
          ),),
        ),
    );
  }
}
