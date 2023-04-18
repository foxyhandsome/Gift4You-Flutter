import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../widget/custom_radio.dart';
import '../../widget/image_picker_custom.dart';
import '../auth/model/user_info.dart';
import '../routing/navigate.dart';

class MarketAdd extends StatefulWidget {
  const MarketAdd({super.key});

  @override
  State<MarketAdd> createState() => _MarketAddState();
}

class _MarketAddState extends State<MarketAdd> {
  TextEditingController productprice = new TextEditingController();
  TextEditingController productname = new TextEditingController();
  TextEditingController productdetail = new TextEditingController();
  int sex = 0;
  int category = 0;
  int specialday = 0;
  final dio = Dio();
  List<UserInfo>? userData = [];
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  insertproduct() async {
    final marketId = await storageToken.read(key: 'marketId');
    final response =
        await dio.post('http://192.168.1.38:5000/insert-product', data: {
      "picture": picture,
      "product_price": productprice.text,
      "product_name": productname.text,
      "product_detail": productdetail.text,
      "market_id": marketId,
      "category": checkCategory(category),
      "gender": sex == 0 ? "ชาย" : "หญิง",
      "specialday": checkSpecialDay(category),
    });
    if (response.statusCode == 200) {
      Navigator.of(context).pop();
    }

    // print(response);
  }

  checkSpecialDay(int data) {
    if (data == 0) {
      return "วันฮาโลวีน";
    }
    if (data == 1) {
      return "วันเเห่งความรัก";
    }
    if (data == 2) {
      return "วันเด็ก";
    }
    if (data == 3) {
      return "วันเกิด";
    }
    if (data == 4) {
      return "วันสงกรานต์";
    }
    return "อื่นๆ";
  }

  checkCategory(int data) {
    if (data == 0) {
      return "ไอที";
    }
    if (data == 1) {
      return "เสื้อผ้า";
    }
    if (data == 2) {
      return "เครื่องประดับ";
    }
    if (data == 3) {
      return "ของเล่น";
    }
    if (data == 4) {
      return "ดอกไม้";
    }
    return "อื่นๆ";
  }

  void noti(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: Text(
              'ระบบเเจ้งเตือน',
              style: TextStyle(
                  color: Color.fromARGB(255, 65, 57, 52),
                  fontFamily: 'donut',
                  fontSize: 21),
            ),
            content: Text(
              "ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง",
              style: TextStyle(
                  color: Color.fromARGB(255, 55, 48, 43),
                  fontFamily: 'donut',
                  fontSize: 17),
            ),
            actions: [
              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
                child: const Text(
                  'ตกลง',
                  style:
                      TextStyle(color: Color(0xff536830), fontFamily: 'donut'),
                ),
                isDefaultAction: true,
                isDestructiveAction: true,
              ),
              // The "No" button
            ],
          );
        });
  }

  goToMain() {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        settings: RouteSettings(name: "/MenuBar"),
        builder: (BuildContext context) {
          return NavigationMenuBar();
        },
      ),
      (_) => false,
    );
  }

  Widget _entryFieldProductName(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'donut',
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: productname,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff6E8786)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E8F0)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryFieldPrice(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'donut',
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: productprice,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff6E8786)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E8F0)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryFieldDetail(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'donut',
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: productdetail,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff6E8786)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E8F0)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  filled: true))
        ],
      ),
    );
  }

  // Widget _entryFieldFullname(String title, {bool isPassword = false}) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           title,
  //           style: TextStyle(
  //               fontFamily: 'donut',
  //               fontSize: 20,
  //               color: Color.fromARGB(255, 255, 255, 255)),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         TextField(
  //             controller: fullname,
  //             decoration: InputDecoration(
  //                 contentPadding: EdgeInsets.only(left: 10),
  //                 border: InputBorder.none,
  //                 fillColor: Colors.white,
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color(0xff6E8786)),
  //                   borderRadius: BorderRadius.all(Radius.circular(6)),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(color: Color(0xffE2E8F0)),
  //                   borderRadius: BorderRadius.all(Radius.circular(6)),
  //                 ),
  //                 filled: true))
  //       ],
  //     ),
  //   );
  // }

  // Widget _entryFieldEmail(String title, {bool isPassword = false}) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           title,
  //           style: TextStyle(
  //               fontFamily: 'donut',
  //               fontSize: 20,
  //               color: Color.fromARGB(255, 255, 255, 255)),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         TextField(
  //             controller: email,
  //             decoration: InputDecoration(
  //                 contentPadding: EdgeInsets.only(left: 10),
  //                 border: InputBorder.none,
  //                 fillColor: Colors.white,
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color(0xff6E8786)),
  //                   borderRadius: BorderRadius.all(Radius.circular(6)),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(color: Color(0xffE2E8F0)),
  //                   borderRadius: BorderRadius.all(Radius.circular(6)),
  //                 ),
  //                 filled: true))
  //       ],
  //     ),
  //   );
  // }

  // Widget _entryFieldTel(String title, {bool isPassword = false}) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           title,
  //           style: TextStyle(
  //               fontFamily: 'donut',
  //               fontSize: 20,
  //               color: Color.fromARGB(255, 255, 255, 255)),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         TextField(
  //             controller: tel,
  //             decoration: InputDecoration(
  //                 contentPadding: EdgeInsets.only(left: 10),
  //                 border: InputBorder.none,
  //                 fillColor: Colors.white,
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color(0xff6E8786)),
  //                   borderRadius: BorderRadius.all(Radius.circular(6)),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(color: Color(0xffE2E8F0)),
  //                   borderRadius: BorderRadius.all(Radius.circular(6)),
  //                 ),
  //                 filled: true))
  //       ],
  //     ),
  //   );
  // }

  // Widget _entryFieldRole_id(String title, {bool isPassword = false}) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           title,
  //           style: TextStyle(
  //               fontFamily: 'donut',
  //               fontSize: 20,
  //               color: Color.fromARGB(255, 255, 255, 255)),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         TextField(
  //             controller: role_id,
  //             decoration: InputDecoration(
  //                 contentPadding: EdgeInsets.only(left: 10),
  //                 border: InputBorder.none,
  //                 fillColor: Colors.white,
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color(0xff6E8786)),
  //                   borderRadius: BorderRadius.all(Radius.circular(6)),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(color: Color(0xffE2E8F0)),
  //                   borderRadius: BorderRadius.all(Radius.circular(6)),
  //                 ),
  //                 filled: true))
  //       ],
  //     ),
  //   );
  // }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        insertproduct();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 221, 65, 169),
                  Color.fromARGB(255, 220, 47, 255)
                ])),
        child: Text(
          'เพิ่มสินค้า',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'donut',
          ),
        ),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 221, 65, 169),
                  Color.fromARGB(255, 220, 47, 255),
                ])),
        child: Text(
          'ยกเลิก',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'donut',
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'เพิ่มสินค้า',
        style: TextStyle(
            fontFamily: 'donut',
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }

  String picture = "";

  Widget _widget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "เลือกรูปภาพ",
            style: TextStyle(
                fontFamily: 'donut',
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        ImagePickerCustom(
          validate: false,
          onSelected: (base64, fileName) async {
            picture = base64;
            // log(base64);
          },
        ),
        _entryFieldProductName("ชื่อสินค้า"),
        _entryFieldPrice("ราคา", isPassword: true),
        SizedBox(
          height: 1,
        ),
        _entryFieldDetail("รายละเอียดสินค้า"),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "เหมาะสำหรับเพศ",
            style: TextStyle(
                fontFamily: 'donut',
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        CustomRadio(
          name: 'ชาย',
          value: 0,
          groupValue: sex,
          onChanged: (value, name) {
            setState(() {
              sex = value;
            });
          },
        ),
        SizedBox(
          height: 20,
        ),
        CustomRadio(
          name: 'หญิง',
          value: 1,
          groupValue: sex,
          onChanged: (value, name) {
            setState(() {
              sex = value;
            });
          },
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "หมวดหมู่",
            style: TextStyle(
                fontFamily: 'donut',
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        CustomRadio(
          name: 'ไอที',
          value: 0,
          groupValue: category,
          onChanged: (value, name) {
            setState(() {
              category = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        CustomRadio(
          name: 'เสื้อผ้า',
          value: 1,
          groupValue: category,
          onChanged: (value, name) {
            setState(() {
              category = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        CustomRadio(
          name: 'เครื่องประดับ',
          value: 2,
          groupValue: category,
          onChanged: (value, name) {
            setState(() {
              category = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        CustomRadio(
          name: 'ของเล่น',
          value: 3,
          groupValue: category,
          onChanged: (value, name) {
            setState(() {
              category = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        CustomRadio(
          name: 'ดอกไม้',
          value: 4,
          groupValue: category,
          onChanged: (value, name) {
            setState(() {
              category = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "วันพิเศษ",
            style: TextStyle(
                fontFamily: 'donut',
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        CustomRadio(
          name: 'วันฮาโลวีน',
          value: 0,
          groupValue: specialday,
          onChanged: (value, name) {
            setState(() {
              specialday = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        CustomRadio(
          name: 'วันเเห่งความรัก',
          value: 1,
          groupValue: specialday,
          onChanged: (value, name) {
            setState(() {
              specialday = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        CustomRadio(
          name: 'วันเด็ก',
          value: 2,
          groupValue: specialday,
          onChanged: (value, name) {
            setState(() {
              specialday = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        CustomRadio(
          name: 'วันเกิด',
          value: 3,
          groupValue: specialday,
          onChanged: (value, name) {
            setState(() {
              specialday = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        CustomRadio(
          name: 'วันสงกรานต์',
          value: 4,
          groupValue: specialday,
          onChanged: (value, name) {
            setState(() {
              specialday = value;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Gift4YouBG.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: height * .1),
                _title(),
                SizedBox(height: 30),
                _widget(),
                SizedBox(height: 30),
                _submitButton(),
                SizedBox(height: 10),
                _backButton(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
