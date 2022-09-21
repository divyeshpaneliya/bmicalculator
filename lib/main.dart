import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/home/hprovider.dart';
import 'Screens/home/view.dart';
import 'Screens/result/r_view.dart';
import 'Screens/s_screen/s_screen.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => hprovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => s_screen(),
          'home': (context) => home(),
          're': (context) => result(),
        },
      ),
    ),
  );
}
