import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giftforyou/src/features/shop/staggered_category_card.dart';

import '../../model/category.dart';

class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<Category> categories = [
    Category(Color(0xffFCE183), Color(0xffF68D7F), 'ไอที',
        'assets/images/it.png', 1),
    Category(Color(0xffF749A2), Color(0xffFF7375), 'เสื้อผ้า',
        'assets/images/Shirt.png', 2),
    Category(Color(0xff00E9DA), Color(0xff5189EA), 'เครื่องประดับ',
        'assets/images/jewelry.png', 3),
    Category(Color(0xffAF2D68), Color(0xff632376), 'ของเล่น',
        'assets/images/toy.png', 4),
    Category(Color(0xff36E892), Color(0xff33B2B9), 'ดอกไม้',
        'assets/images/flower.png', 5),
  ];

  List<Category> searchResults = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchResults = categories;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffF9F9F9),
      child: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment(-1, 0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'หมวดหมู่สินค้า',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (_, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.0,
                  ),
                  child: InkWell(
                    child: StaggeredCardCard(
                      type: searchResults[index].type,
                      begin: searchResults[index].begin,
                      end: searchResults[index].end,
                      categoryName: searchResults[index].category,
                      assetPath: searchResults[index].image,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
