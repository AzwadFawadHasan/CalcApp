import 'package:flutter/material.dart';
import '../util/colors.dart';
import '../util/dimention.dart';

class Button extends StatelessWidget {

  final String text;
  final Color TextColor;
  final double textSize;
  final Function callBack;

  const Button({super.key, required this.text,  this.TextColor = Colors.white,  this.textSize=25, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        callBack(text);
        print("button has been tapped ${text}");
      },
      child: Container(
        height: Dimenstions.height75,
        width: Dimenstions.height75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimenstions.Radius25),
          color: AppColor.BackgroundColor,
          boxShadow: const[
            BoxShadow(
              color: Colors.white10,
              offset: Offset(-2, -2),
              blurRadius: 9,
              spreadRadius: 1,

            ),
            BoxShadow(
              color: Colors.black87,
              offset: Offset(2, 2),
              blurRadius: 9,
              spreadRadius: 1,

            )
          ],
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end:Alignment.bottomRight,
            colors: [
              Color(0xFF293126),
              Color(0xFF1A1C20),


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
