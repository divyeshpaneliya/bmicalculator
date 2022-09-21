import 'dart:async';
import 'package:bmicalculator/Screens/utils/colors/colors.dart';
import 'package:flutter/material.dart';


class s_screen extends StatefulWidget {
  const s_screen({Key? key}) : super(key: key);

  @override
  _s_screenState createState() => _s_screenState();
}

class _s_screenState extends State<s_screen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: pri,
        body: Container(
          alignment: Alignment.center,
          child:

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(

                      child: Icon(Icons.local_hospital_outlined),
                    ),
                    Text(
                      "BMI CALCULATOR",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      "Check your BMI",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
