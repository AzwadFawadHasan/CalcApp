import 'package:calculator_app/util/colors.dart';
import 'package:calculator_app/util/dimention.dart';
import 'package:calculator_app/widget/button.dart';
import 'package:calculator_app/widget/display_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BackgroundColor,
      body:Padding(
        padding: EdgeInsets.only(
          top: Dimenstions.height20,
          bottom: Dimenstions.height20,
          left: Dimenstions.width20,
          right: Dimenstions.width20,


        ),
        child: Column(
          children: [
            const DisplayScreen(),
            SizedBox(
              height: Dimenstions.height25,

            ),
            Expanded(child: Column(
              children: [
                Button(),
                Button()
              ],
            ))
          ],
        ),
      )
    );
  }
}
