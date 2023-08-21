import 'package:calculator_app/util/colors.dart';
import 'package:flutter/material.dart';
import '../util/dimention.dart';

class DisplayScreen extends StatelessWidget {
  final nameAlg;
  final numDisplay;
  final numHistory;
  const DisplayScreen({super.key, this.nameAlg, this.numDisplay, this.numHistory});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.zero, // Remove any margin
      height: Dimenstions.height270,
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.BackgroundColor,
          width: Dimenstions.BorderWidth5,
        ),
        color: AppColor.BackgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          right: Dimenstions.width50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10), // Add some extra space here
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                numHistory,
                style: TextStyle(
                  fontFamily: 'digital',
                  fontSize: Dimenstions.fontSize30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10), // Adjust the value as needed
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                numDisplay,
                style: TextStyle(
                  fontFamily: 'digital',
                  fontSize: Dimenstions.fontSize50,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                /*Icon(
                  Icons.arrow_right,
                  size: Dimenstions.IconSize40,
                  color: Colors.white,
                ),*/
                /*Container(
                  //margin: EdgeInsets.only(bottom: Dimenstions.height10),
                  child: Text(
                    nameAlg,
                    style: TextStyle(
                      fontFamily: 'digital',
                      fontSize: Dimenstions.fontSize30,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                )*/
              ],
            )
          ],
        ),
      ),
    );
  }
}
