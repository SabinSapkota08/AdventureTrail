// 1st you need to add an enumaration to represent your menus in the drawer
import 'package:es_drawer_controller/main.dart';
import 'package:flutter/material.dart';
import 'package:fyp/view/aboutUs_page.dart';
import 'package:fyp/view/changePassword_page.dart';
import 'package:fyp/view/favourite_page.dart';
import 'package:fyp/view/homepage.dart';
import 'package:fyp/view/order_page.dart';
import 'package:fyp/view/profile_page.dart';
import 'package:fyp/view/splash_screen_page.dart';
import 'package:get/get.dart';

import 'cart_page.dart';

enum eDrawerIndex {
  diDivider, // This is to be used when ever you need a divider
  diHome,
  diProfile,
  diCart,
  diFavourite,
  diOrder,
  diChangePassword,
  diRateApp,
  diAboutUS,
  diLogout,
}

// Now create a class for Navigation Drawer as below
class MainNavigation extends StatefulWidget {
  // This field is where you need to add your menu items { Ajmal }
  final List<ESDrawerItem<eDrawerIndex>> _cDrawerList =
      <ESDrawerItem<eDrawerIndex>>[
    const ESDrawerItem(
        type: eDrawerItemType.ditMenu,
        index: eDrawerIndex.diHome,
        labelName: 'Home',
        iconData: Icons.home),
    const ESDrawerItem(
        type: eDrawerItemType.ditMenu,
        index: eDrawerIndex.diProfile,
        labelName: 'My Profile',
        iconData: Icons.person),

    const ESDrawerItem(
        type: eDrawerItemType.ditMenu,
        index: eDrawerIndex.diCart,
        labelName: 'Cart',
        iconData: Icons.add_shopping_cart_outlined),

    const ESDrawerItem(
        type: eDrawerItemType.ditMenu,
        index: eDrawerIndex.diFavourite,
        labelName: 'Favourite',
        iconData: Icons.favorite_border_outlined),
    const ESDrawerItem(
        type: eDrawerItemType.ditMenu,
        index: eDrawerIndex.diOrder,
        labelName: 'Order',
        iconData: Icons.shopping_cart_sharp),

    const ESDrawerItem(
        type: eDrawerItemType.ditDivider,
        index: eDrawerIndex.diDivider), // Add a divider here
    const ESDrawerItem(
        type: eDrawerItemType.ditLink,
        index: eDrawerIndex.diChangePassword,
        labelName: 'Change Password',
        iconData: Icons.password_outlined),
    const ESDrawerItem(
      type: eDrawerItemType.ditLink,
      index: eDrawerIndex.diAboutUS,
      labelName: 'About US',
      iconData: Icons.group,
    ),

    const ESDrawerItem(
      type: eDrawerItemType.ditLink,
      index: eDrawerIndex.diLogout,
      labelName: 'Log out',
      iconData: Icons.logout,
    ),
  ];

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  Widget screenView = HomePage();
  eDrawerIndex drawerIndex = eDrawerIndex.diHome;

  DateTime lastBackPressTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ESDrawerController<eDrawerIndex>(
      title: 'Adventrail Trail',
      subTitle: 'Customer',
      screenView: screenView,
      screenIndex: drawerIndex,
      assetLogo: "assets/images/pn.png",
      drawerList: widget._cDrawerList,
      drawerWidth: MediaQuery.of(context).size.width * 0.5,
      // When user click on the menu, onDrawerCall is triggered
      onDrawerCall: (ESDrawerItem drawerItem) => _changeIndex(drawerItem),
    );
  }

  void _changeIndex(ESDrawerItem drawerItem) {
    // If user click on the same menu which is not marked as link/share then no need to create the same class again
    if (drawerItem.type == eDrawerItemType.ditMenu &&
        (drawerIndex == drawerItem.index || !mounted)) return;

    // Update new drawer index
    drawerIndex = drawerItem.index;
    switch (drawerIndex) {
      case eDrawerIndex.diHome:
        setState(() => screenView = HomePage());
        break;
      case eDrawerIndex.diProfile:
        setState(() => screenView = ProfilePage());
        break;
      case eDrawerIndex.diCart:
        setState(() => screenView = CartPage());
        break;

      case eDrawerIndex.diFavourite:
        setState(() => screenView = FavouritePage());
        break;

      case eDrawerIndex.diOrder:
        setState(() => screenView = MyOrdersPage());
        break;
      case eDrawerIndex.diChangePassword:
        setState(() => screenView = ChangePasswordPage());
        break;
      case eDrawerIndex.diAboutUS:
        setState(() => screenView = AboutUsPage());
        break;
      case eDrawerIndex.diLogout:
        Get.offAll(SplashScreen());
        break;

      default:
        break;
    }
  }
}
