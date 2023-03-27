import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widget/image_picker_custom.dart';

class AddGrit extends StatefulWidget {
  const AddGrit({super.key});

  @override
  State<AddGrit> createState() => _AddGritState();
}

class _AddGritState extends State<AddGrit> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImagePickerCustom(
                  validate: false,
                  onSelected: (base64, fileName) async {
                    log(base64);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // child: Scaffold(
      //   body: ImagePickerCustom(
      //     validate: false,
      //     onSelected: (base64, fileName) async {
      //       log(base64);
      //     },
      //   ),
      // ),
    );
  }
}
