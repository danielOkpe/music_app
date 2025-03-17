import 'package:flutter/material.dart';


class Tabs {
  String name;
  Widget widget;
  IconData icon;

  Tabs({required this.name, required this.icon, required this.widget });

  BottomNavigationBarItem get item => BottomNavigationBarItem(icon: Icon(icon), label: name);

}