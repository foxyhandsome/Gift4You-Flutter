import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftforyou/src/features/auth/model/user_register.dart';

import '../routing/navigate.dart';
import 'model/user_info.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController fullname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController tel = new TextEditingController();
  TextEditingController role_id = new TextEditingController();

  final dio = Dio();
  List<UserInfo>? userData = [];

  login() async {
    print(username.text);
    print(password.text);

    final response = await dio.post('http://192.168.1.38:5000/register', data: {
      "username": username.text,
      "password": password.text,
      "gender": gender.text,
      "fullname": fullname.text,
      "email": email.text,
      "tel": tel.text,
      "role_id": role_id.text,
    });
    if (response.statusCode == 200) {
      goToMain();
    }

    print(response);
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

  Widget _entryFieldUsername(String title, {bool isPassword = false}) {
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
              controller: username,
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

  Widget _entryFieldPassword(String title, {bool isPassword = false}) {
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
              controller: password,
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

  Widget _entryFieldGender(String title, {bool isPassword = false}) {
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
              controller: gender,
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

  Widget _entryFieldFullname(String title, {bool isPassword = false}) {
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
              controller: fullname,
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

  Widget _entryFieldEmail(String title, {bool isPassword = false}) {
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
              controller: email,
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

  Widget _entryFieldTel(String title, {bool isPassword = false}) {
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
              controller: tel,
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

  Widget _entryFieldRole_id(String title, {bool isPassword = false}) {
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
              controller: role_id,
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

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        login();
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
          'สมัครสมาชิก',
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
        text: 'สมัครสมาชิก',
        style: TextStyle(
            fontFamily: 'donut',
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryFieldUsername("ชื่อผู้ใช้งาน"),
        _entryFieldPassword("รหัสผ่าน", isPassword: true),
        _entryFieldGender("เพศ"),
        _entryFieldFullname("ชื่อ-นามสกุล"),
        _entryFieldEmail("อีเมล"),
        _entryFieldTel("เบอร์โทรศัพท์"),
        _entryFieldRole_id("สมัครเป็น"),
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
              image: AssetImage("asset/images/Gift4YouBG.jpg"),
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
                _emailPasswordWidget(),
                SizedBox(height: 30),
                _submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
