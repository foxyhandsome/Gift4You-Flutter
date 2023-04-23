import 'dart:developer';

import 'package:flutter/material.dart';

import '../../widget/custom_radio.dart';
import 'check_box.dart';

class AddGrit extends StatefulWidget {
  const AddGrit({super.key});

  @override
  State<AddGrit> createState() => _AddGritState();
}

class _AddGritState extends State<AddGrit> {
  List<CheckProduct>? listCheckbox1 = [
    CheckProduct(
      name: "วันฮาโลวีน",
      value: 0,
    ),
    CheckProduct(
      name: "วันเเห่งความรัก",
      value: 0,
    ),
    CheckProduct(
      name: "วันเด็ก",
      value: 0,
    ),
    CheckProduct(
      name: "วันเกิด",
      value: 0,
    ),
    CheckProduct(
      name: "วันสงกรานต์",
      value: 0,
    ),
  ];

  List<CheckProduct>? listCheckbox2 = [
    CheckProduct(
      name: "ไอที",
      value: 0,
    ),
    CheckProduct(
      name: "เสื้อผ้า",
      value: 0,
    ),
    CheckProduct(
      name: "เครื่องประดับ",
      value: 0,
    ),
    CheckProduct(
      name: "ของเล่น",
      value: 0,
    ),
    CheckProduct(
      name: "ดอกไม้",
      value: 0,
    ),
  ];
  int sex = 0;

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
            ...List.generate(listCheckbox1!.length, ((index) {
              return Column(
                children: [
                  CustomRadio(
                    type: 'checkbox',
                    name: listCheckbox1![index].name.toString(),
                    value: 1,
                    groupValue: listCheckbox1![index].value,
                    onChanged: (value, name) {
                      setState(() {
                        if (listCheckbox1![index].value == value) {
                          listCheckbox1![index].value =
                              listCheckbox1![index].value == 0 ? 1 : 0;
                        } else {
                          listCheckbox1![index].value = value;
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              );
            })),
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
              value: 0,
              groupValue: sex,
              onChanged: (value, name) {
                setState(() {
                  sex = value;
                });
              },
            ),
            SizedBox(
              height: 10,
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
            ...List.generate(listCheckbox2!.length, ((index) {
              return Column(
                children: [
                  CustomRadio(
                    type: 'checkbox',
                    name: listCheckbox2![index].name.toString(),
                    value: 1,
                    groupValue: listCheckbox2![index].value,
                    onChanged: (value, name) {
                      setState(() {
                        if (listCheckbox2![index].value == value) {
                          listCheckbox2![index].value =
                              listCheckbox2![index].value == 0 ? 1 : 0;
                        } else {
                          listCheckbox2![index].value = value;
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              );
            })),
            SizedBox(
              height: 20,
            ),
          ],
        )),
      ),
    );
  }
}
