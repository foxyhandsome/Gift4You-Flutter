import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:giftforyou/src/features/auth/register.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../market/market_list.dart';
import '../routing/navigate.dart';
import 'model/user_info.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final dio = Dio();
  List<UserInfo>? userData = [];
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  login() async {
    final response = await dio.post('http://192.168.1.38:5000/login', data: {
      "username": username.text,
      "password": password.text,
    });
    if (response.statusCode == 200) {
      List<UserInfo> data = [];
      response.data.forEach((element) {
        data.add(UserInfo.fromJson(element));
      });
      setState(() {
        userData = data;
      });
      await storageToken.write(
        key: 'username',
        value: userData![0].username,
      );
      await storageToken.write(
        key: 'marketId',
        value: userData![0].marketId.toString(),
      );
    }
    if (userData != null && userData!.isNotEmpty) {
      if (userData![0].userType == "USER") {
        goToMainUSER();
      } else if (userData![0].userType == "ADMIN") {
        goToMainUSER();
      } else {
        goToMainMARKET();
      }
    } else {
      noti(context);
    }

    print(response);
  }

  goToMainUSER() {
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

  goToMainMARKET() {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        settings: RouteSettings(name: "/MenuBar"),
        builder: (BuildContext context) {
          return MarketList();
        },
      ),
      (_) => false,
    );
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
                  Color.fromARGB(193, 255, 113, 243),
                  Color.fromARGB(255, 220, 47, 255)
                ])),
        child: Text(
          'เข้าสู่ระบบ',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'donut',
          ),
        ),
      ),
    );
  }

  gotoregister() {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: Register(),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    ).then((value) => {});
  }

  Widget _RegisterButton() {
    return InkWell(
      onTap: () {
        gotoregister();
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
                  Color.fromARGB(193, 255, 113, 243),
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
        text: 'เข้าสู่ระบบสมาชิก',
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
                SizedBox(height: height * .3),
                _title(),
                SizedBox(height: 30),
                _emailPasswordWidget(),
                SizedBox(height: 30),
                _submitButton(),
                SizedBox(height: 30),
                _RegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
