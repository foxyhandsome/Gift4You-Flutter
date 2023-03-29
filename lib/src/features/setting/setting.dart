import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:settings_ui/settings_ui.dart';

import '../auth/login.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  void initState() {
    super.initState();
  }

  logout() async {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Login();
        },
      ),
      (_) => false,
    );
  }

  bool faceID = false;
  @override
  Widget build(BuildContext context) {
    var colorBar = Color.fromARGB(240, 170, 98, 218);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 235, 240, 244),
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
            'การตั้งค่า',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[],
        ),
      ),
      body: SettingsList(
        platform: DevicePlatform.android,
        sections: [
          SettingsSection(
            margin: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
            title: Text(''),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(
                  Icons.book,
                  color: colorBar,
                ),
                title: Text(
                  'ข้อตกลงและเงื่อนไข',
                  style: TextStyle(
                    fontFamily: 'donut',
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
                value: Text(''),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: colorBar,
                  size: 16,
                ),
                onPressed: (context) => {},
              ),
              SettingsTile.navigation(
                leading: Icon(
                  Icons.library_books_outlined,
                  color: colorBar,
                ),
                title: Text(
                  'คู่มือการใช้งาน',
                  style: TextStyle(
                    fontFamily: 'donut',
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
                value: Text(''),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: colorBar,
                  size: 16,
                ),
                onPressed: (context) => {},
              ),
              SettingsTile.navigation(
                leading: Icon(
                  Icons.contact_page,
                  color: colorBar,
                ),
                title: Text(
                  'ติดต่อเรา',
                  style: TextStyle(
                    fontFamily: 'donut',
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
                value: Text(''),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: colorBar,
                  size: 16,
                ),
                onPressed: (context) => {},
              ),
              SettingsTile.navigation(
                leading: Icon(
                  Icons.verified_user_outlined,
                  color: colorBar,
                ),
                title: Text(
                  'เวอร์ชันแอปพลิเคชัน',
                  style: TextStyle(
                    fontFamily: 'donut',
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
                trailing: Text(
                  '1.0.0',
                  style: TextStyle(
                    fontFamily: 'donut',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: colorBar,
                  ),
                ),
              ),
            ],
          ),
          SettingsSection(
            margin: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            title: Text(''),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                onPressed: (context) => {logout()},
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text(
                  'ออกจากระบบ',
                  style: TextStyle(
                      fontFamily: 'donut',
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Colors.red),
                ),
                trailing: Text(
                  '',
                  style: TextStyle(fontFamily: 'prompt', fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
