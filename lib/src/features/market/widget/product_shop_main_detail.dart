import 'package:flutter/material.dart';
import 'package:giftforyou/src/features/market/widget/product_details%20copy.dart';
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
            children: [
              ProductHeader(item: widget.item!),
              ProductDetails(item: widget.item),
              SizedBox(height: 15),
              Divider(color: kBorderColor),
              Expandable(title: 'รายละเอียดสินค้า', trailing: Container()),
              Divider(color: kBorderColor, indent: 15, endIndent: 15),
              // Expandable(
              //   title: 'Nutrition',
              //   trailing: Container(
              //     padding: const EdgeInsets.all(4),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: kSecondaryColor,
              //     ),
              //     child: Text('100gr'),
              //   ),
              // ),
              // Divider(color: kBorderColor, indent: 15, endIndent: 15),
              // Expandable(
              //   title: 'Reviews',
              //   trailing: Row(
              //     children: List.generate(
              //         5,
              //         (index) => Icon(
              //               Icons.star,
              //               color: Colors.amber,
              //               size: 20,
              //             )),
              //   ),
              // ),
              SizedBox(height: 30),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: CustomButton(
              //     text: 'Add To Cart',
              //     onTap: () => {},
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
