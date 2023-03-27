import 'package:flutter/material.dart';

import 'navigation_drawer_widget.dart';

class MarketList extends StatefulWidget {
  const MarketList({super.key});

  @override
  State<MarketList> createState() => _MarketListState();
}

class _MarketListState extends State<MarketList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Builder(builder: (context) {
            return AppBar(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(1),
                ),
              ),
              leading: InkWell(
                onTap: () => {Scaffold.of(context).openDrawer()},
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 34,
                ),
              ),
              actions: [],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color.fromARGB(255, 67, 80, 3),
                        Color.fromARGB(255, 67, 80, 3),
                      ]),
                ),
              ),
              title: const Text(
                'ทดสอบบบบบ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            );
          }),
        ));
  }
}
