import 'package:flutter/material.dart';
import '../util/colors.dart';
import '../util/dimention.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("button has been tapped");
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
        child: const Center(
          child: Text(
            '1',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white
            ),
            
          ),
        ),
      ),
    );
  }
}
