import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constant/constants.dart';
import '../../model/market.dart';
import '../../utils/CustomBorder.dart';
import '../../utils/CustomColors.dart';
import '../../utils/CustomTextStyle.dart';
import '../../utils/CustomUtils.dart';
import '../auth/model/product_list.dart';
import '../market/model/product.dart';
import '../market/widget/product_shop_main_detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dio = Dio();
  List<ProductList>? productData = [];
  List<Market>? marketData = [];
  List<Market> marketDataList = [];
  List<ProductList> data = [];

  productload() async {
    final response =
        await dio.post('${host}/list-product', data: {"username": "TonUser"});
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        data.add(ProductList.fromJson(element));
      });
      setState(() {
        productData = data;
      });
      for (var i = 0; i < productData!.length; i++) {
        listShoesImage.add(productData![i].picture.toString());
      }
    }
    // print(response);
  }

  market() async {
    final response =
        await dio.post('${host}/list-market', data: {"username": "TonUser"});
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        marketDataList.add(Market.fromJson(element));
      });
      setState(() {
        marketData = marketDataList;
      });
      for (var i = 0; i < marketData!.length; i++) {
        listShoesImageMarket.add(marketData![i].marketPicture.toString());
      }
    }
    // print(response);
  }

  double? doubleFormatCheckZero(String number) {
    if (number == 'null' || number.isEmpty) return 0;
    List<String> splitted = number.split('.');
    if (splitted.length == 1) return double.parse(splitted[0]);
    return double.parse(number);
  }

  onTap(BuildContext context, ProductList data) {
    ProductModel req = new ProductModel();
    req.image = data.picture;
    req.name = data.productName;
    req.price = doubleFormatCheckZero(data.productPrice!);
    // Navigator.of(context).push(
    //     MaterialPageRoute(builder: (_) => ProductShopMainDeatil(item: req)));
    print("1");
  }

  List<String> listImage = [];
  List<String> listShoesImage = [];
  List<String> listShoesImageMarket = [];
  int selectedSliderPosition = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliderImage();
    productload();
    market();
  }

  void sliderImage() {
    listImage.add("assets/images/gift4you.png");
  }

  void shoesImage() {
    // for(var i=0; i<data.length; i++){
    // Uint8List pictureShow = BASE64.decode(productData[0].picture);
    // }
    // String base64=base64Decode(productData[0].picture);
    // listShoesImage.add(base64Decode(productData[0].picture));
    for (var i = 0; i < productData!.length; i++) {
      listShoesImage.add(productData![i].picture.toString());
    }
    // listShoesImage.add("assets/images/gift4you.png");
    // listShoesImage.add("assets/images/gift4you.png");
    // listShoesImage.add("assets/images/gift4you.png");
    // listShoesImage.add("assets/images/gift4you.png");
    // listShoesImage.add("assets/images/gift4you.png");
    // listShoesImage.add("assets/images/gift4you.png");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 245, 168, 255),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      color: CustomColors.COLOR_GREEN,
                      height: height / 4,
                    ),
                    /*Search Section*/

                    /*Slider Section*/
                    Container(
                        height: (height / 4) + 75,
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: height / 5,
                          child: PageView.builder(
                            itemBuilder: (context, position) {
                              return createSlider(listImage[position]);
                            },
                            controller: PageController(viewportFraction: .8),
                            itemCount: listImage.length,
                            onPageChanged: (position) {
                              /*setState(() {
                              selectedSliderPosition = position;
                            });*/
                            },
                          ),
                        ))
                  ],
                ),
                Utils.getSizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(new MaterialPageRoute(
                    //     builder: (context) => SeeAllProductPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: Text(
                          "สินค้าแนะนำ",
                          style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'donut',
                              fontSize: 23),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text("ดูทั้งหมด",
                                style: CustomTextStyle.textFormFieldSemiBold
                                    .copyWith(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: 'donut',
                                        fontSize: 18)),
                            Icon(Icons.arrow_forward),
                            Utils.getSizedBox(width: 16),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Utils.getSizedBox(height: 10),
                /*Group By Product Listing*/
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 240),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: onTap(context, productData![index]),
                        child: createGroupBuyListItem(
                            productData![index], listShoesImage[index], index),
                      );
                    },
                    itemCount: listShoesImage.length,
                  ),
                ),

                /*Most Big Product Listing*/
                Utils.getSizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16),
                      child: Text(
                        "ร้านค้า",
                        style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: 'donut',
                            fontSize: 23),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: <Widget>[
                          Text("ดูทั้งหมด",
                              style: CustomTextStyle.textFormFieldSemiBold
                                  .copyWith(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontFamily: 'donut',
                                      fontSize: 18)),
                          Icon(Icons.arrow_forward),
                          Utils.getSizedBox(width: 16),
                        ],
                      ),
                    )
                  ],
                ),
                Utils.getSizedBox(height: 10),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 240),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return createMostBigListItem(marketData![index],
                          listShoesImageMarket[index], index, context);
                    },
                    itemCount: listShoesImageMarket.length,
                  ),
                ),
                Utils.getSizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }

  createSlider(String image) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      ),
    );
  }

  createGroupBuyListItem(ProductList data, String image, int index) {
    double leftMargin = 0;
    double rightMargin = 0;
    if (index != listShoesImage.length - 1) {
      leftMargin = 10;
    } else {
      leftMargin = 10;
      rightMargin = 10;
    }
    return InkWell(
      onDoubleTap: () => {print("Ddddd")},
      child: Container(
        margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(Base64Decoder().convert(image)),
                    ),
                    color: Color.fromARGB(255, 225, 255, 154),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
              ),
              flex: 75,
            ),
            Expanded(
              flex: 25,
              child: Container(
                padding: EdgeInsets.only(left: leftMargin, right: rightMargin),
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Utils.getSizedBox(height: 8),
                    Text(
                      '${data.productName}',
                      style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                          color: Colors.black.withOpacity(.7), fontSize: 12),
                    ),
                    Utils.getSizedBox(height: 4),
                    Text(
                      'ราคา ${data.productPrice}',
                      style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                          color: Colors.black.withOpacity(.7), fontSize: 10),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
              ),
            )
          ],
        ),
      ),
    );
  }

  createMostBigListItem(
      Market data, String image, int index, BuildContext context) {
    double leftMargin = 0;
    double rightMargin = 0;
    double radius = 16;
    if (index != listShoesImage.length - 1) {
      leftMargin = 10;
    } else {
      leftMargin = 10;
      rightMargin = 10;
    }
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: "$image,$index",
                child: Container(
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(Base64Decoder().convert(image)),
                      ),
                      color: Color.fromARGB(255, 168, 255, 127),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(radius),
                          topRight: Radius.circular(radius))),
                ),
                transitionOnUserGestures: true,
              ),
              flex: 75,
            ),
            Expanded(
              flex: 25,
              child: Container(
                padding: EdgeInsets.only(left: leftMargin, right: rightMargin),
                width: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Utils.getSizedBox(height: 8),
                    Text(
                      '${data.marketName}',
                      style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                          color: Colors.black.withOpacity(.7), fontSize: 12),
                    ),
                    Utils.getSizedBox(height: 4),
                    Text(
                      '${data.marketDetail}',
                      style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                          color: Colors.black.withOpacity(.7), fontSize: 10),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius))),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        // Navigator.of(context).push(new MaterialPageRoute(
        //     builder: (context) => ProductDetailsPage("$image,$index")));
      },
    );
  }
}
