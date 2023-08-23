import 'package:calculator_app/util/colors.dart';
import 'package:calculator_app/util/dimention.dart';
import 'package:calculator_app/widget/button.dart';
import 'package:calculator_app/widget/display_screen.dart';
import 'package:calculator_app/widget/equalButton.dart';
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
        backgroundColor: AppColor
            .BackgroundColor, // Customize the app bar color
      ),
      body: Padding(
        padding: EdgeInsets.only(
          // You can uncomment the padding values if needed
          // top: Dimenstions.height10,
          // bottom: Dimenstions.height10,
          // left: Dimenstions.width20,
          // right: Dimenstions.width20,
        ),
        child: Column(
          children: [
            DisplayScreen(
              nameAlg: allAlg,
              numDisplay: textDisplay,
              numHistory: numHistory,
            ),
            // SizedBox(
            //   height: Dimenstions.height25,
            // ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Column for V, (, 1, 4, 7, 0
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(text: 'V', callBack: btnOnClick),
                        Button(text: '(', callBack: btnOnClick),
                        Button(text: '1', callBack: btnOnClick),
                        Button(text: '4', callBack: btnOnClick),
                        Button(text: '7', callBack: btnOnClick),
                        Button(text: '0', callBack: btnOnClick),
                      ],
                    ),
                  ),

                  // Column for C, ), 2, 5, 8, 00
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(text: 'C',
                            callBack: btnOnClick,
                            TextColor: Colors.white),
                        Button(text: ')',
                            callBack: btnOnClick,
                            TextColor: Colors.white),
                        Button(text: '2',
                            callBack: btnOnClick,
                            TextColor: Colors.white),
                        Button(text: '5',
                            callBack: btnOnClick,
                            TextColor: Colors.white),
                        Button(text: '8',
                            callBack: btnOnClick,
                            TextColor: Colors.white),
                        Button(text: '00',
                            callBack: btnOnClick,
                            TextColor: Colors.white),
                      ],
                    ),
                  ),

                  // Column for X, %, 3, 6, 9, .
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(text: 'X', callBack: btnOnClick),
                        Button(text: '%', callBack: btnOnClick),
                        Button(text: '3', callBack: btnOnClick),
                        Button(text: '6', callBack: btnOnClick),
                        Button(text: '9', callBack: btnOnClick),
                        Button(text: '.',
                            callBack: btnOnClick,
                            TextColor: Colors.white),
                      ],
                    ),
                  ),

                  // Column for /, *, -, +, =
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: Dimenstions.height10,
                        ),
                        Button(text: '/',
                            callBack: btnOnClick,
                            TextColor: Colors.white),
                        SizedBox(
                          height: Dimenstions.height30,
                        ),
                        Button(text: '*',
                            callBack: btnOnClick,
                            TextColor: Colors.white),
                        SizedBox(
                          height: Dimenstions.height10,
                        ),
                        Button(text: '-',
                            callBack: btnOnClick,
                            TextColor: Colors.white),
                        SizedBox(
                          height: Dimenstions.height15,
                        ),
                        Button(text: '+',
                            callBack: btnOnClick,
                            TextColor: Colors.white,
                            textSize: Dimenstions.height25),
                        SizedBox(
                          height: Dimenstions.height15,
                        ),
                        EqualButton(text: '=',
                            callBack: btnOnClick,
                            TextColor: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }



  void btnOnClick(String btnVal) {
    print(btnVal);

    double evaluateInsideParentheses(String expression) {
      // Assuming our expression is like "5+10", "10*3", "15/5" etc.
      if (expression.contains("+")) {
        var operands = expression.split("+");
        return double.parse(operands[0]) + double.parse(operands[1]);
      } else if (expression.contains("-")) {
        var operands = expression.split("-");
        return double.parse(operands[0]) - double.parse(operands[1]);
      } else if (expression.contains("*")) {
        var operands = expression.split("*");
        return double.parse(operands[0]) * double.parse(operands[1]);
      } else if (expression.contains("/")) {
        var operands = expression.split("/");
        return double.parse(operands[0]) / double.parse(operands[1]);
      }
      return double.parse(expression);  // If no operator is found, return the number itself(same number return korbe)
    }

    if (btnVal == 'C') {
      numHistory = "";

      textDisplay = '0';
      firstNum = '0';
      secondNum = '0';
      res = "";

      ArithName = '';
      allAlg = '';
    } else if (btnVal == 'V' || btnVal == 'X') {
      numHistory = "";

      textDisplay = '0';
      firstNum = '0';
      secondNum = '0';
      res = "";

      ArithName = 'CLEAR';
      allAlg = '';
    } else if (btnVal == '(' || btnVal == ')' || (textDisplay.contains("(") && !textDisplay.contains(")"))) {
      res = textDisplay + btnVal;
    } else if (btnVal == '00') {
      res = textDisplay + '00';
    } else if (btnVal == '.') {
      if (!textDisplay.contains('.')) {
        res = textDisplay + '.';
      } else {
        res = textDisplay; //here we are  keeping  the textDisplay unchanged if dot already exists
      }
    } else if (btnVal == '/' || btnVal == "*" || btnVal == "+" || btnVal == "-" || btnVal == "%") {
      if (btnVal == '/') {
        ArithName = "DIVIDE";
      } else if (btnVal == "*") {
        ArithName = "Multiply";
      } else if (btnVal == "+") {
        ArithName = "ADDITION";
      } else if (btnVal == "-") {
        ArithName = "Subtract";
      } else if (btnVal == "%") {
        ArithName = "Percentage";
      } else {
        ArithName = "";
      }
      firstNum = double.parse(textDisplay);
      res = '';
      operator = btnVal;
    } else if (btnVal == '=') {
      if (textDisplay.contains("(") && textDisplay.contains(")")) {
        String insideExpression = textDisplay.substring(textDisplay.indexOf("(")+1, textDisplay.indexOf(")"));
        double resultInsideParentheses = evaluateInsideParentheses(insideExpression);
        textDisplay = textDisplay.replaceFirst(insideExpression, resultInsideParentheses.toString());
        textDisplay = textDisplay.replaceAll("(", "").replaceAll(")", "");  // Remove the parentheses
        res = textDisplay;  // Now, textDisplay will have the evaluated result.
      } else {
        ArithName = 'EQUAL';
        secondNum = double.parse(textDisplay);
        if (operator == "+") {
          res = (firstNum + secondNum).toString();
        } else if (operator == "-") {
          res = (firstNum - secondNum).toString();
        } else if (operator == "*") {
          res = (firstNum * secondNum).toString();
        } else if (operator == "/") {
          res = (firstNum / secondNum).toStringAsFixed(2); // Round off to 2 decimal places
        } else if (operator == "%") {
          res = (firstNum * secondNum / 100).toStringAsFixed(2); // Percentage calculation
        }
        numHistory = firstNum.toString() + operator + secondNum.toString();
      }
    } else {
      res = textDisplay + btnVal;
    }

    setState(() {
      textDisplay = res;
      allAlg = ArithName;
    });
  }

}


/* puran code/ old simple logic code

//
//
//   void btnOnClick(String btnVal){
//     print(btnVal);
//     if(btnVal == 'C'){
//
//       numHistory = "";
//
//       textDisplay = '0';
//       firstNum= '0';
//       secondNum= '0';
//       res = "";
//
//       ArithName = '';
//       allAlg = '';
//     }else if (btnVal ==  'V' || btnVal == 'X'){
//       numHistory = "";
//
//       textDisplay = '0';
//       firstNum= '0';
//       secondNum= '0';
//       res = "";
//
//       ArithName = 'CLEAR';
//       allAlg = '';
//     }else if (btnVal == '(' || btnVal == ')') {
//       // Simply append '(' or ')' to the display
//       res = textDisplay + btnVal;
//     } else if (btnVal == '00') {
//       // Append '00' to the current number
//       res = textDisplay + '00';
//     } else if (btnVal == '.') {
//       // Ensure only one dot is present in the current number
//       if (!textDisplay.contains('.')) {
//         res = textDisplay + '.';
//       } else {
//         res = textDisplay + btnVal;
//       }}
//
//
//
//
//
//     else if(
//     btnVal=='/' || btnVal =="*" || btnVal=="+" || btnVal == "-"
//         || btnVal == "%"
//     ){
//       if (btnVal=='/'){
//         ArithName= "DIVIDE";
//       }else if (btnVal=="*"){
//         ArithName = "Multiply";
//       }else if (btnVal=="+"){
//         ArithName = "ADDITION";
//       }else if (btnVal=="-"){
//         ArithName = "Subtract";
//       }else if (btnVal=="%"){
//         ArithName = "Percentage";
//       }else{
//         ArithName="";
//       }
//       firstNum = int.parse(textDisplay);
//       res = '';
//       operator=btnVal;
//
//     }
//     else if (btnVal == '='){
//       ArithName = 'EQUAL';
//       secondNum  = int.parse(textDisplay);
//       if(operator == "+"){
//         res = (firstNum+secondNum).toString();
//         numHistory = firstNum.toString()+operator.toString()+secondNum.toString();
//
//       }
//       if(operator == "-"){
//         res = (firstNum-secondNum).toString();
//         numHistory = firstNum.toString()+operator.toString()+secondNum.toString();
//
//       }
//       if(operator == "X"){
//         res = (firstNum*secondNum).toString();
//         numHistory = firstNum.toString()+operator.toString()+secondNum.toString();
//
//       }
//       if(operator == "/"){
//         res = (firstNum/secondNum).toString();
//         numHistory = firstNum.toString()+operator.toString()+secondNum.toString();
//
//       }
//       if(operator == "%"){
//         res = (firstNum+secondNum).toString();
//         numHistory = firstNum.toString()+operator.toString()+secondNum.toString();
//
//       }
//     }else{
//       res = int.parse(textDisplay+btnVal).toString();
//     }
//     setState(() {
//       textDisplay= res;
//       allAlg= ArithName;
//
//     });
//   }
// }
//   bool insideParenthesis = false;
//   bool lastPressedOperatorInsideParenthesis = false;
//   void btnOnClick(String btnVal) {
//
//     print(btnVal);
//     if (btnVal == 'C') {
//       numHistory = "";
//
//       textDisplay = '0';
//       firstNum = '0';
//       secondNum = '0';
//       res = "";
//
//       ArithName = '';
//       allAlg = '';
//     } else if (btnVal == 'V' || btnVal == 'X') {
//       numHistory = "";
//
//       textDisplay = '0';
//       firstNum = '0';
//       secondNum = '0';
//       res = "";
//
//       ArithName = 'CLEAR';
//       allAlg = '';
//     }  else if (btnVal == '(') {
//       insideParenthesis = true;
//       res = textDisplay + btnVal;
//     } else if (btnVal == ')') {
//       if (insideParenthesis && !lastPressedOperatorInsideParenthesis) {
//         res = textDisplay + btnVal;
//         insideParenthesis = false;
//       }
//     } else if (btnVal == '00') {
//       res = textDisplay + '00';
//     } else if (btnVal == '.') {
//       if (!textDisplay.contains('.')) {
//         res = textDisplay + '.';
//       } else {
//         res =
//             textDisplay; // keep the textDisplay unchanged if dot already exists
//       }
//     }
//     else if (btnVal == '/' || btnVal == "*" || btnVal == "+" || btnVal == "-"
//         || btnVal == "%") {
//       if (insideParenthesis) {
//         if (!lastPressedOperatorInsideParenthesis) {
//           lastPressedOperatorInsideParenthesis = true;
//           res = textDisplay + btnVal;
//         }
//       }
//       if (btnVal == '/') {
//         ArithName = "DIVIDE";
//       } else if (btnVal == "*") {
//         ArithName = "Multiply";
//       } else if (btnVal == "+") {
//         ArithName = "ADDITION";
//       } else if (btnVal == "-") {
//         ArithName = "Subtract";
//       } else if (btnVal == "%") {
//         ArithName = "Percentage";
//       } else {
//         ArithName = "";
//       }
//       firstNum =
//           double.parse(textDisplay); // Convert to double for better precision
//       res = '';
//       operator = btnVal;
//     } else if (btnVal == '=') {
//       ArithName = 'EQUAL';
//       secondNum = double.parse(textDisplay);
//       if (operator == "+") {
//         res = (firstNum + secondNum).toString();
//       }
//       if (operator == "-") {
//         res = (firstNum - secondNum).toString();
//       }
//       if (operator == "*") {
//         res = (firstNum * secondNum).toString();
//       }
//       if (operator == "/") {
//         res = (firstNum / secondNum).toStringAsFixed(
//             2); // Round off to 2 decimal places
//       }
//       if (operator == "%") {
//         res = (firstNum * secondNum / 100).toStringAsFixed(
//             2); // Percentage calculation
//       }
//       numHistory = firstNum.toString() + operator + secondNum.toString();
//     } else {
//       // Append numbers after the dot or any other number
//       res = textDisplay + btnVal;
//     }
//
//     setState(() {
//       textDisplay = res;
//       allAlg = ArithName;
//     });
//   }
// }

  // bool insideParenthesis = false;
  // bool lastPressedOperatorInsideParenthesis = false;
  //
  // void btnOnClick(String btnVal) {
  //   print(btnVal);
  //
  //   if (btnVal == 'C') {
  //     numHistory = "";
  //
  //     textDisplay = '0';
  //     firstNum = '0';
  //     secondNum = '0';
  //     res = "";
  //
  //     ArithName = '';
  //     allAlg = '';
  //   } else if (btnVal == 'V' || btnVal == 'X') {
  //     numHistory = "";
  //
  //     textDisplay = '0';
  //     firstNum = '0';
  //     secondNum = '0';
  //     res = "";
  //
  //     ArithName = 'CLEAR';
  //     allAlg = '';
  //   } else if (btnVal == '(') {
  //     insideParenthesis = true;
  //     res = textDisplay + btnVal;
  //   } else if (btnVal == ')') {
  //     if (insideParenthesis && !lastPressedOperatorInsideParenthesis) {
  //       res = textDisplay + btnVal;
  //       insideParenthesis = false;
  //     }
  //   } else if (btnVal == '00') {
  //     res = textDisplay + '00';
  //   } else if (btnVal == '.') {
  //     if (!textDisplay.contains('.')) {
  //       res = textDisplay + '.';
  //     } else {
  //       res = textDisplay; // keep unchanged if dot already exists
  //     }
  //   } else if (btnVal == '/' || btnVal == "*" || btnVal == "+" || btnVal == "-"
  //       || btnVal == "%") {
  //     if (insideParenthesis) {
  //       if (!lastPressedOperatorInsideParenthesis) {
  //         lastPressedOperatorInsideParenthesis = true;
  //         res = textDisplay + btnVal;
  //       }
  //     } else {
  //       if (btnVal == '/') {
  //         ArithName = "DIVIDE";
  //       } else if (btnVal == "*") {
  //         ArithName = "Multiply";
  //       } else if (btnVal == "+") {
  //         ArithName = "ADDITION";
  //       } else if (btnVal == "-") {
  //         ArithName = "Subtract";
  //       } else if (btnVal == "%") {
  //         ArithName = "Percentage";
  //       } else {
  //         ArithName = "";
  //       }
  //       firstNum = double.parse(textDisplay);
  //       res = '';
  //       operator = btnVal;
  //     }
  //   } else if (btnVal == '=') {
  //     ArithName = 'EQUAL';
  //     secondNum = double.parse(textDisplay);
  //     if (operator == "+") {
  //       res = (firstNum + secondNum).toString();
  //     } else if (operator == "-") {
  //       res = (firstNum - secondNum).toString();
  //     } else if (operator == "*") {
  //       res = (firstNum * secondNum).toString();
  //     } else if (operator == "/") {
  //       res = (firstNum / secondNum).toStringAsFixed(2);
  //     } else if (operator == "%") {
  //       res = (firstNum * secondNum / 100).toStringAsFixed(2);
  //     }
  //     numHistory = firstNum.toString() + operator + secondNum.toString();
  //   } else {
  //     if (insideParenthesis && lastPressedOperatorInsideParenthesis) {
  //       lastPressedOperatorInsideParenthesis = false;
  //     }
  //     res = textDisplay + btnVal;
  //   }
  //
  //   setState(() {
  //     textDisplay = res;
  //     allAlg = ArithName;
  //   });
  // }
 */