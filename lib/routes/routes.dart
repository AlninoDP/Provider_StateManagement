import 'package:flutter/material.dart';
import 'package:learnflutter/views/expandable_text/expandable_text.dart';
import 'package:learnflutter/views/main_menu/main_menu.dart';

Map<String, WidgetBuilder> routes = {
  '/root': (context) => const MainMenu(),
  '/expandableTextScreen': (context) => const ExpandableTextScreen(),
};
