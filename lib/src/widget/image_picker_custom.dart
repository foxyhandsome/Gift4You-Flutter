import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCustom extends StatefulWidget {
  final Function(String base64, String fileNAme) onSelected;
  late bool validate;
  final String imageFile;
  late String? base64File;
  ImagePickerCustom(
      {Key? key,
      this.imageFile = 'กรุณาเลือก',
      required this.onSelected,
      this.base64File,
      this.validate = false})
      : super(key: key);

  @override
  State<ImagePickerCustom> createState() => _ImagePickerCustomState();
}

class _ImagePickerCustomState extends State<ImagePickerCustom> {
  Uint8List? bytes;
  String? img64;
  @override
  void initState() {
    if (widget.base64File != null) {
      img64 = widget.base64File;
    }
    super.initState();
  }

  late String imageFile = "SELECT";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            _showImageSourceActionSheet(context);
          },
          child: Container(
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    width: 1,
                    color: widget.validate != true
                        ? Color(0xffE2E8F0)
                        : Colors.red)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   "assets/images/icon-add.svg",
                  //   width: 40,
                  //   height: 40,
                  //   color: widget.validate != true
                  //       ? Color(0xff536830)
                  //       : Colors.red,
                  // ),
                  SizedBox(height: 10),
                  Text(
                    imageFile != "SELECT"
                        ? "ถ่ายภาพหรือเลือกรูปภาพใหม่"
                        : "กดเพื่อแนบหรือถ่ายภาพ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: widget.validate != true
                            ? Color(0xff695D55)
                            : Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.validate == true,
          child: Text("กรุณาเเนบรูปภาพ",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.red)),
        ),
        if (img64 != null)
          Container(
              margin: EdgeInsets.only(top: 16),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.memory(Base64Decoder().convert(img64!)))),
      ],
    );
  }

  Future<void> chooseFile(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: source,
      maxWidth: 400,
      imageQuality: 80,
    );
    if (pickedFile == null) return;
    final bytes = await pickedFile.readAsBytes();
    final String base64String = base64Encode(bytes);
    setState(() {
      imageFile = pickedFile.path;
      img64 = base64String;
    });
    widget.onSelected.call(img64!, pickedFile.name);
  }

  void _showImageSourceActionSheet(BuildContext context) {
    Function(ImageSource) selectImageSource = (imageSource) {
      print(imageSource);
      chooseFile(imageSource);
    };

    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text(
              'ถ่ายภาพ',
              style: TextStyle(
                fontFamily: 'anupark',
              ),
            ),
            onPressed: () {
              widget.validate = false;
              Navigator.pop(context);
              selectImageSource(ImageSource.camera);
            },
          ),
          CupertinoActionSheetAction(
            child: Text(
              'เลือกภาพถ่าย',
              style: TextStyle(
                fontFamily: 'anupark',
              ),
            ),
            onPressed: () {
              widget.validate = false;
              Navigator.pop(context);
              selectImageSource(ImageSource.gallery);
            },
          )
        ],
      ),
    );
  }
}
