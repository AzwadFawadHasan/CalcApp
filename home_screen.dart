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
      backgroundColor: AppColor.BackgroundColorLighter,
        appBar: AppBar(
          title: Text(
            'Calculator', // App title
            style: TextStyle(
              fontSize: 20, // Adjust the font size as needed
            ),
          ),
          centerTitle: true, // Center-align the title horizontally
          backgroundColor: AppColor.BackgroundColor, // Customize the app bar color
        ),

      body:Padding(
        padding: EdgeInsets.only(

          //top: Dimenstions.height10,
          //bottom: Dimenstions.height10,
          //left: Dimenstions.width20,
          //right: Dimenstions.width20,


        ),
        child: Column(
          children: [
            DisplayScreen(
              nameAlg:allAlg,
                numDisplay:textDisplay,
                numHistory:numHistory,
            ),
            SizedBox(
              height: Dimenstions.height25,

            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(text: 'V',
                          callBack: btnOnClick,

                    ),
                    Button(text: 'C',
                      callBack: btnOnClick,
                      TextColor: Colors.white,

                    ),Button(text: 'X',
                      callBack: btnOnClick,

                    ),
                    Button(text: '/',
                      callBack: btnOnClick,
                      TextColor: Colors.white,

                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(text: '(',
                      callBack: btnOnClick,

                    ),
                    Button(text: ')',
                      callBack: btnOnClick,
                      TextColor: Colors.white,

                    ),Button(text: '%',
                      callBack: btnOnClick,

                    ),
                    Button(text: '*',
                      callBack: btnOnClick,
                      TextColor: Colors.white,

                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(text: '1',
                      callBack: btnOnClick,

                    ),
                    Button(text: '2',
                      callBack: btnOnClick,
                      TextColor: Colors.white,

                    ),Button(text: '3',
                      callBack: btnOnClick,

                    ),
                    Button(text: '-',
                      callBack: btnOnClick,
                      TextColor: Colors.white,

                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(text: '4',
                      callBack: btnOnClick,

                    ),
                    Button(text: '5',
                      callBack: btnOnClick,
                      TextColor: Colors.white,

                    ),Button(text: '6',
                      callBack: btnOnClick,

                    ),
                    Button(text: '+',
                      callBack: btnOnClick,
                      TextColor: Colors.white,
                      textSize: Dimenstions.height25,

                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(text: '7',
                      callBack: btnOnClick,

                    ),
                    Button(text: '8',
                      callBack: btnOnClick,
                      TextColor: Colors.white,

                    ),Button(text: '9',
                      callBack: btnOnClick,

                    ),
                    Button(text: '=',
                      callBack: btnOnClick,
                      TextColor: Colors.white,

                    ),
                  ],
                ),
                //SizedBox(
                //  width: Dimenstions.width20,
                //),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(text: '0',
                      callBack: btnOnClick,

                    ),
                    //SizedBox(
                    //  width: Dimenstions.width20,
                    //),
                    Button(text: '00',
                      callBack: btnOnClick,
                      TextColor: Colors.white,

                    ),
                    Button(text: '.',
                      callBack: btnOnClick,
                      TextColor: Colors.white,

                    ),
                    //SizedBox(
                    //  width: Dimenstions.width20,
                    //),
                    Button(text: '=',
                      callBack: btnOnClick,
                      TextColor: Colors.white,

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
    btnVal=='/' || btnVal =="X" || btnVal=="+" || btnVal == "-"
        || btnVal == "%"
    ){
      if (btnVal=='/'){
        ArithName= "DIVIDE";
      }else if (btnVal=="X"){
        ArithName = "Multiply";
      }else if (btnVal=="+"){
        ArithName = "ADDITION";
      }else if (btnVal=="-"){
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
      if(operator == "-"){
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
    setState(() {
      textDisplay= res;
      allAlg= ArithName;

    });
  }
}
