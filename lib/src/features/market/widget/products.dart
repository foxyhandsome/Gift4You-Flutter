import 'package:flutter/material.dart';
import 'package:giftforyou/src/features/market/widget/single_product.dart';

import '../../auth/model/product_list.dart';
import '../model/product.dart';

class ProductsWidget extends StatelessWidget {
  final List<ProductModel>? data;

  const ProductsWidget({Key? key, this.data}) : super(key: key);
  // List<ProductModel> listMenu = [
  //   ProductModel(
  //       size: "1 กิโลกรัม",
  //       id: "1",
  //       image: "https://www.salana.co.th/img/shop/rice-green.png",
  //       name: "ข้าวหอมอินทรีย์ 5 สายพันธุ์",
  //       price: 90.00),
  //   ProductModel(
  //       size: "1 กิโลกรัม",
  //       id: "1",
  //       image: "https://www.salana.co.th/img/shop/rice-red.png",
  //       name: "ข้าวหอมมะลิแดงอินทรีย์",
  //       price: 110.00),
  //   ProductModel(
  //       size: "1 กิโลกรัม",
  //       id: "1",
  //       image: "https://www.salana.co.th/img/shop/rice-gray.png",
  //       name: "ข้าวหอมมะลิ 105 อินทรีย์",
  //       price: 90.00),
  //   ProductModel(
  //       size: "2 กิโลกรัม",
  //       id: "1",
  //       image: "https://www.salana.co.th/img/shop/rice-green.png",
  //       name: "Giftset ข้าวหอมอินทรีย์ 5 สายพันธุ์",
  //       price: 380.00),
  // ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .66,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 9.0,
        crossAxisSpacing: 10,
        children: data!.map((ProductModel product) {
          return SingleProductWidget(
            product: product,
          );
        }).toList());
  }
}
