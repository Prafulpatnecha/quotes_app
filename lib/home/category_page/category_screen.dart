import 'package:flutter/material.dart';
import 'package:quotes_app/utils/imagelist.dart';
import 'package:quotes_app/utils/quotes_model.dart';
import '../../utils/globle_values.dart';
import '../../utils/quoteslist.dart';
import '../home_screen/home_page.dart';
QuotesModel? quotesModelCategory;
class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    quotesModelCategory=QuotesModel.toList(iList: imageCategory);
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
        title: const Text('Category',style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: quotesModelImage!.quotesModelList[selectImageIndex].image!
          ),
        ),
        child: Stack(
          children:
          [
            GridView.builder(itemCount: quotesModelCategory!.quotesModelList.length,gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 16/8), itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      emptyList.clear();
                      setState(() {
                      for(int i=0;i<quotesModelText!.quotesModelList.length;i++)
                        {
                          if(quotesModelCategory!.quotesModelList[index].category==quotesModelText!.quotesModelList[i].category)
                          {
                            emptyList.add(quotesListGroup[i]);
                          }
                        }

                      });
                      Navigator.of(context).pushNamed('/view-category');
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      image: DecorationImage(
                        image: quotesModelCategory!.quotesModelList[index].image!,
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Text(quotesModelCategory!.quotesModelList[index].category!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: quotesModelFont!.quotesModelList[selectFont].font),),
                  ),
                ),
              );
            },),
          ],
        ),
      ),
    );
  }
}
