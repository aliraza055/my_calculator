import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController inputController=TextEditingController();
  TextEditingController resultController=TextEditingController();
 void  calculate(value){
    try{
    switch(value){
      case 'AC':
      inputController.clear();
      resultController.clear();
      break;
      case 'DEL':
      if(inputController.text.isNotEmpty){
       inputController.text= inputController.text.substring(0,inputController.text.length-1);
      }
      break;
      case 'X':
      inputController.text +='*';
      break;
      case '=':
    if(inputController.text.isNotEmpty){
        Parser perser=Parser();
      Expression expression=perser.parse(inputController.text);
      ContextModel context=ContextModel();
     var  total=expression.evaluate(EvaluationType.REAL, context);
     resultController.text=total.toString();
    }
      break;
      default:
      inputController.text+=value;  
    }
    }
    catch(e){
    print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200], 
      body: Padding(
        padding:const EdgeInsets.all(26),
        child: Column(
          children: [
          const  SizedBox(height: 140,),
           Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
            controller: inputController,
            style:const TextStyle(fontSize: 60),
            textAlign: TextAlign.right,
            readOnly: true,
            showCursor: true,
            cursorWidth: 3,
            cursorHeight: 50,
            decoration:const InputDecoration(
              border: InputBorder.none
            ),
           ),
            TextFormField(
              controller: resultController,
              textAlign: TextAlign.right,
              style:const TextStyle(fontSize: 50,),
              readOnly: true,
               decoration:const InputDecoration(
              border: InputBorder.none
            ),
            ),
            ],
           ),
            const  SizedBox(height:20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(text: 'AC',bColor: Colors.orange.shade700, tColor: Colors.white),
                button(text: 'DEL',bColor: Colors.orange.shade700, tColor: Colors.white),
                button(text: '%',bColor: Colors.orange.shade700, tColor: Colors.white),
                button(text: '/',bColor: Colors.orange.shade700, tColor: Colors.white), 
                 
              ],
            ),
              const  SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(text: '1'),
                button(text: '2'),
                button(text: '3'),
                button(text: '*',bColor: Colors.orange.shade700, tColor: Colors.white), 
                 
              ],
            ),           
            const  SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(text: '4'),
                button(text: '5'),
                button(text: '6'),
                button(text: '+',bColor: Colors.orange.shade700, tColor: Colors.white), 
                 
              ],
            ),
           const  SizedBox(height: 16,),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(text: '1'),
                button(text: '2'),
                button(text: '3'),
                button(text: '-',bColor: Colors.orange.shade700, tColor: Colors.white), 
                 
              ],
            ),
           const  SizedBox(height: 16,),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(text: '.'),
                button(text: '0'),
                button(text: '00'),
                button(text: '=',bColor: Colors.orange.shade700, tColor: Colors.white),          
              ],
            ),
         
          ],
        ),
      ),
    );
  }
  Widget button({text, Color bColor = Colors.white, Color tColor = Colors.black, double fsize = 20}) {
  return InkWell(
    onTap: () {
      calculate(text);
    },
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bColor,  
        boxShadow: [BoxShadow(color: Colors.grey.shade400, spreadRadius: 1, blurRadius: 5)],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: tColor, fontSize: fsize, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}


}

