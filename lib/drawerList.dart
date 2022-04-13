import 'package:flutter/material.dart';
class DrawerItem{
  final String icon;
  final String title;
  final List<String> submenus;

  DrawerItem(this.icon, this.title, this.submenus);
}


List<DrawerItem> drawerLists = [
  DrawerItem("assets/drawer1.png", "Modest Dress", ["Men","Women","Kids","Men","Women","Kids"]),
  DrawerItem("assets/drawer2.png", "Popular", ["Panjabi", "Borka","Cosmetics"]),
  DrawerItem("assets/drawer3.png", "Flash Sales", ["Add", "Edit", "Delete"]),
  DrawerItem("assets/drawer4.png", "Halal Cosmetics & Fragrance", ["Men Fragrance","Women Fragrance"]),

  DrawerItem("assets/drawer5.png", "Decorative Items", ["Islamic Showpiece"]),
   DrawerItem("assets/drawer6.png", "Food", ["Dry Fruits", "Daily Food"]),
];