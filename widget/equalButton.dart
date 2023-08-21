import 'package:flutter/material.dart';
import '../util/colors.dart';
import '../util/dimention.dart';

class EqualButton extends StatelessWidget {

  final String text;
  final Color TextColor;
  final double textSize;
  final Function callBack;

  const EqualButton({super.key, required this.text,  this.TextColor = Colors.white,  this.textSize=25, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        callBack(text);
        print("button has been tapped ${text}");
      },
      child: Container(
        height: Dimenstions.height120,
        width: Dimenstions.height75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.zero,
            color: AppColor.BackgroundColorLighter,
            boxShadow: const[
              BoxShadow(
                color: Color(0xFF2a6d98),
                //offset: Offset(-2, -2),
                //blurRadius: 9,
                //spreadRadius: 1,

              ),
              BoxShadow(
                color: Color(0xFF2a6d98),
                //offset: Offset(2, 2),
                //blurRadius: 9,
                // spreadRadius: 1,

              )
            ],
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end:Alignment.bottomRight,
                colors: [
                  Color(0xFF2a6d98),
                  Color(0xFF2a6d98),


                ]
            )
        ),
        child:  Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: textSize,
                color: TextColor
            ),

          ),
        ),
      ),
    );
  }
}
