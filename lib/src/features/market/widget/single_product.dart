import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:giftforyou/src/features/market/widget/product_shop_main_detail.dart';

import '../model/product.dart';
import 'custom_text.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel? product;

  const SingleProductWidget({Key? key, this.product}) : super(key: key);

  void onTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => ProductShopMainDeatil(item: product)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  offset: Offset(3, 2),
                  blurRadius: 7)
            ]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Hero(
                      tag: product.hashCode,
                      child: Image.memory(
                        Base64Decoder().convert(product!.image.toString()),
                        width: double.infinity,
                      ))
                  //  Image.network(
                  //   product!.image.toString(),
                  //   width: double.infinity,
                  // ),
                  ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  product!.name!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                )),

            CustomText(
              size: 13,
              text: product!.size,
              color: Colors.grey,
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CustomText(
                    text: "\฿${product!.price}",
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                // IconButton(
                //     icon: Icon(Icons.add_shopping_cart), onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
