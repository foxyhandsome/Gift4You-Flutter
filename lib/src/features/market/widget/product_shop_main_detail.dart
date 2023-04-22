import 'package:flutter/material.dart';
import 'package:giftforyou/src/features/market/widget/product_details.dart';
import 'package:giftforyou/src/features/market/widget/product_header.dart';
import '../../../constant/constants.dart';
import '../model/product.dart';
import 'expandable.dart';

class ProductShopMainDeatil extends StatefulWidget {
  static const routeName = 'item-details-screen/';
  final ProductModel? item;
  const ProductShopMainDeatil({Key? key, this.item}) : super(key: key);

  @override
  State<ProductShopMainDeatil> createState() => _ProductShopMainDeatilState();
}

class _ProductShopMainDeatilState extends State<ProductShopMainDeatil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductHeader(item: widget.item!),
              ProductDetails(item: widget.item),
              SizedBox(height: 15),
              Divider(color: kBorderColor),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  child: Text(
                    'ชื่อร้านค้า : ${widget.item!.marketName}',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  child: Text(
                    'สำหรับเพศ : ${widget.item!.genderName}',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  child: Text(
                    'หมวดหมู่ : ${widget.item!.categoryName}',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  child: Text(
                    'สำหรับวันพิเศษ : ${widget.item!.sdayName}',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Expandable(
                  title: 'รายละเอียดสินค้า',
                  trailing: Container(),
                  item: widget.item!),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
