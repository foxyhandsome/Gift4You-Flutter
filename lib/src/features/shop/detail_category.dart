import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constant/constants.dart';
import '../auth/model/product_list.dart';

class DetailCategory extends StatefulWidget {
  final int type;
  final String name;
  const DetailCategory({super.key, required this.type, required this.name});

  @override
  State<DetailCategory> createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {
  final dio = Dio();
  List<ProductList> productData = [];
  productload() async {
    final response = await dio.get('${host}/get-catgory/${widget.type}');
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        productData.add(ProductList.fromJson(element));
      });
    }
    setState(() {
      productData = productData;
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
            'หมวดหมู่${widget.name}',
            style: TextStyle(
              fontSize: 30,
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
          if (productData.length == 0)
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Container(
                height: 100,
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
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.multiply_circle,
                        size: 27,
                        color: Colors.red,
                      ),
                      Text(
                        " ยังไมมีสินค้าในหมวดหมู่นี้",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                    childAspectRatio: 2.4,
                    children: [
                      ...List.generate(productData.length, (index) {
                        return Container(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                            child: Container(
                              width: double.infinity,
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
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                                style: TextStyle(fontSize: 16),
                                                'ชื่อสินค้า : ${productData[index].productName!}'),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              style: TextStyle(fontSize: 16),
                                              'ชื่อร้านค้า : ${productData[index].marketName!}',
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              'ราคา : ${productData[index].productPrice!} บาท',
                                              style: TextStyle(fontSize: 16),
                                            ),
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
