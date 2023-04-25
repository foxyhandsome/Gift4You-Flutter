import 'dart:developer';

import 'package:flutter/material.dart';

import '../../widget/custom_radio.dart';
import 'deatil_gift.dart';

class AddGrit extends StatefulWidget {
  const AddGrit({super.key});

  @override
  State<AddGrit> createState() => _AddGritState();
}

class _AddGritState extends State<AddGrit> {
  int category = 1;
  int gender = 1;
  int specialday = 1;

  onGoToDeatil(BuildContext context, int category, int gender, int specialday) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => DeatilGift(
              category: category,
              gender: gender,
              specialday: specialday,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Color.fromARGB(241, 211, 145, 255),
                    Color.fromARGB(241, 211, 145, 255),
                  ]),
            ),
          ),
          // backgroundColor: colorBar,
          title: const Text(
            'แนะนำของขวัญ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[],
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "วันพิเศษ",
                  style: TextStyle(
                      fontFamily: 'donut',
                      fontSize: 20,
                      color: Color.fromARGB(255, 65, 63, 63)),
                ),
              ],
            ),
            CustomRadio(
              name: 'วันฮาโลวีน',
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
              name: 'วันเเห่งความรัก',
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
              name: 'วันเด็ก',
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
              name: 'วันเกิด',
              value: 4,
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
              value: 5,
              groupValue: specialday,
              onChanged: (value, name) {
                setState(() {
                  specialday = value;
                });
              },
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Text(
                  "เพศ",
                  style: TextStyle(
                      fontFamily: 'donut',
                      fontSize: 20,
                      color: Color.fromARGB(255, 65, 63, 63)),
                ),
              ],
            ),
            CustomRadio(
              name: 'ชาย',
              value: 1,
              groupValue: gender,
              onChanged: (value, name) {
                setState(() {
                  gender = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomRadio(
              name: 'หญิง',
              value: 2,
              groupValue: gender,
              onChanged: (value, name) {
                setState(() {
                  gender = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "หมวดหมู่",
                  style: TextStyle(
                      fontFamily: 'donut',
                      fontSize: 20,
                      color: Color.fromARGB(255, 65, 63, 63)),
                ),
              ],
            ),
            CustomRadio(
              name: 'ไอที',
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
              name: 'เสื้อผ้า',
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
              name: 'เครื่องประดับ',
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
              name: 'ของเล่น',
              value: 4,
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
              value: 5,
              groupValue: category,
              onChanged: (value, name) {
                setState(() {
                  category = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () =>
                  {onGoToDeatil(context, category, gender, specialday)},
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(241, 211, 145, 255),
                          Color.fromARGB(241, 211, 145, 255),
                        ])),
                height: 40,
                width: double.infinity,
                child: Text(
                  'ค้นหา',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        )),
      ),
    );
  }
}
