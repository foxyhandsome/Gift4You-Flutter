import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftforyou/src/features/auth/register.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../home/home.dart';


class NavigationMenuBar extends StatefulWidget {
  final String? selectPage;
  const NavigationMenuBar({Key? key, this.selectPage}) : super(key: key);

  @override
  State<NavigationMenuBar> createState() => _NavigationMenuBarState();
}

class _NavigationMenuBarState extends State<NavigationMenuBar> {
  PersistentTabController? _controller =
      PersistentTabController(initialIndex: 0);
  @override
  void initState() {
    super.initState();

    // Map the selected page string to its corresponding index
    final pageMap = {'home': 0, 'list': 1, 'setting': 2};
    final selectedPageIndex = pageMap[widget.selectPage] ?? 0;

  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        contentPadding: 0.0,
        inactiveColorSecondary: CupertinoColors.black,
        icon: Icon(CupertinoIcons.house, size: 25),
        title: ("หน้าเเรก"),
        iconSize: 50,
        activeColorPrimary: Color.fromARGB(255, 247, 247, 247),
        inactiveColorPrimary: Color.fromARGB(255, 0, 0, 0),
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0.0,
        icon: Icon(CupertinoIcons.search , size: 25),
        title: ("ดูหมวดหมู่สินค้า"),
        activeColorPrimary: Color.fromARGB(255, 248, 248, 248),
        inactiveColorPrimary: Color.fromARGB(255, 0, 0, 0),
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0.0,
        // icon: Icon(CupertinoIcons.clear_circled),
        icon: Icon(CupertinoIcons.cart_fill, size: 25),
        title: ("เเนะนำของขวัญ"),
        activeColorPrimary: Color.fromARGB(255, 249, 250, 250),
        inactiveColorPrimary: Color.fromARGB(255, 2, 0, 0),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person, size: 25),
        contentPadding: 0.0,
        title: ("โปรไฟล์"),
        activeColorPrimary: Color.fromARGB(255, 255, 255, 255),
        inactiveColorPrimary: Color.fromARGB(255, 7, 0, 0),
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      Home(), Home(), Home(), Home()
      // MainList(),
      // Test()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      hideNavigationBar: false,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255)
            ],
          )),

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.once,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeOutQuad,
        duration: Duration(milliseconds: 250),
      ),
      navBarStyle:
          NavBarStyle.style7, // Choose the nav bar style with this property.
    );
  }
}
