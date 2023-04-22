import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../constant/constants.dart';
import '../../../model/market.dart';
import '../../auth/model/product_list.dart';

class MArketDetail extends StatefulWidget {
  final Market? item;
  const MArketDetail({super.key, required this.item});

  @override
  State<MArketDetail> createState() => _MArketDetailState();
}

class _MArketDetailState extends State<MArketDetail> {
  final dio = Dio();
  List<ProductList> productData = [];
  int number = 0;
  productload() async {
    final response =
        await dio.get('${host}/get-product-id/${widget.item!.marketId}');
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        productData.add(ProductList.fromJson(element));
      });
    }
    setState(() {
      productData = productData;
      number = productData.length;
    });
    // print(response);
  }

  @override
  void initState() {
    productload();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'donut',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 23,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Color.fromARGB(248, 245, 168, 255),
                    Color.fromARGB(248, 245, 168, 255),
                  ]),
            ),
          ),
          title: Text(
            'รายละเอียดร้านค้า',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              fontFamily: 'donut',
            ),
          ),
        ),
        body: TabWorkList1(context, productData),
      ),
    );
  }

  Widget TabWorkList1(BuildContext context, List<ProductList> list) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(Base64Decoder()
                              .convert(widget.item!.marketPicture!)),
                        ),
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ร้าน ${widget.item!.marketName!}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'ที่อยู่ร้านค้า :  ${widget.item!.marketAddress!}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'รายละเอียดร้านค้า :  ${widget.item!.marketDetail!}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              )),
          if (productData.length > 0)
            Expanded(
              flex: 1,
              child: Container(
                child: Container(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.only(bottom: 25, top: 10),
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    crossAxisCount: 1,
                    childAspectRatio: 4,
                    children: [
                      ...List.generate(productData.length, (index) {
                        return Container(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                            child: Container(
                              width: double.infinity,
                              height: 110,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x320E151B),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: MemoryImage(Base64Decoder()
                                                .convert(productData[index]
                                                    .picture!)),
                                          ),
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8))),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Text(
                                                style: TextStyle(fontSize: 16),
                                                'ชื่อสินค้า : ${productData[index].productName!}'),
                                          ),
                                          Text(
                                            'ราคา : ${productData[index].productPrice!} บาท',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Text(
                                              style: TextStyle(fontSize: 16),
                                              'รายละเอียด : ${productData[index].productDetail!}',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
