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
  var firstNum;
  var secondNum;
  String numHistory = "";
  String res = "";
  late String operator;
  String ArithName = '';
  String allAlg = '';
  String textDisplay = '0';


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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(text: 'A/C',
                          callBack: btnOnClick,

                    ),
                    Button(text: 'C',
                      callBack: btnOnClick,
                      TextColor: Colors.red,

                    ),Button(text: '%',
                      callBack: btnOnClick,

                    ),
                    Button(text: '/',
                      callBack: btnOnClick,
                      TextColor: AppColor.TextColorlight,

                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(text: '9',
                      callBack: btnOnClick,

                    ),
                    Button(text: '8',
                      callBack: btnOnClick,
                      TextColor: Colors.red,

                    ),Button(text: '7',
                      callBack: btnOnClick,

                    ),
                    Button(text: 'X',
                      callBack: btnOnClick,
                      TextColor: AppColor.TextColorlight,

                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(text: '6',
                      callBack: btnOnClick,

                    ),
                    Button(text: '5',
                      callBack: btnOnClick,
                      TextColor: Colors.red,

                    ),Button(text: '4',
                      callBack: btnOnClick,

                    ),
                    Button(text: '--',
                      callBack: btnOnClick,
                      TextColor: AppColor.TextColorlight,
                      textSize: Dimenstions.height25,

                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(text: '3',
                      callBack: btnOnClick,

                    ),
                    Button(text: '2',
                      callBack: btnOnClick,
                      TextColor: Colors.red,

                    ),Button(text: '1',
                      callBack: btnOnClick,

                    ),
                    Button(text: '+',
                      callBack: btnOnClick,
                      TextColor: AppColor.TextColorlight,

                    ),
                  ],
                ),
                SizedBox(
                  width: Dimenstions.width20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(text: '0',
                      callBack: btnOnClick,

                    ),
                    SizedBox(
                      width: Dimenstions.width20,
                    ),
                    Button(text: '.',
                      callBack: btnOnClick,
                      TextColor: Colors.red,

                    ),
                    SizedBox(
                      width: Dimenstions.width20,
                    ),Button(text: '=',
                      callBack: btnOnClick,

                    ),

                  ],
                ),


              ],
            ))
          ],
        ),
      )
    );
  }
  void btnOnClick(String btnVal){
    print(btnVal);
    if(btnVal == 'C'){

      numHistory = "";

      textDisplay = '0';
      firstNum= '0';
      secondNum= '0';
      res = "";

      ArithName = '';
      allAlg = '';
    }else if (btnVal ==  'A/C'){
      numHistory = "";

      textDisplay = '0';
      firstNum= '0';
      secondNum= '0';
      res = "";

      ArithName = 'CLEAR';
      allAlg = '';
    }else if(
    btnVal=='/' || btnVal =="X" || btnVal=="+" || btnVal == "--"
        || btnVal == "%"
    ){
      if (btnVal=='/'){
        ArithName= "DIVIDE";
      }else if (btnVal=="X"){
        ArithName = "Multiply";
      }else if (btnVal=="+"){
        ArithName = "ADDITION";
      }else if (btnVal=="--"){
        ArithName = "Subtract";
      }else if (btnVal=="%"){
        ArithName = "Percentage";
      }else{
        ArithName="";
      }
      firstNum = int.parse(textDisplay);
      res = '';
      operator=btnVal;

    }
    else if (btnVal == '='){
      ArithName = 'EQUAL';
      secondNum  = int.parse(textDisplay);
      if(operator == "+"){
        res = (firstNum+secondNum).toString();
        numHistory = firstNum.toString()+operator.toString()+secondNum.toString();

      }
      if(operator == "--"){
        res = (firstNum-secondNum).toString();
        numHistory = firstNum.toString()+operator.toString()+secondNum.toString();

      }
      if(operator == "X"){
        res = (firstNum*secondNum).toString();
        numHistory = firstNum.toString()+operator.toString()+secondNum.toString();

      }
      if(operator == "/"){
        res = (firstNum/secondNum).toString();
        numHistory = firstNum.toString()+operator.toString()+secondNum.toString();

      }
      if(operator == "%"){
        res = (firstNum+secondNum).toString();
        numHistory = firstNum.toString()+operator.toString()+secondNum.toString();

      }
    }else{
      res = int.parse(textDisplay+btnVal).toString();
    }
  }
}
