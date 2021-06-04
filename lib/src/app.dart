import 'package:GetX/src/views/ShoppingPage.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter GetX',
        debugShowCheckedModeBanner: false,
        home: ShoppingPage());
  }
}
