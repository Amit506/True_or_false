import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


Questions ques = new Questions();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Question Bank',
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: QuestionBank(),
      ),
    );
  }
}

class QuestionBank extends StatefulWidget {
  @override
  _QuestionBankState createState() => _QuestionBankState();
}

class _QuestionBankState extends State<QuestionBank> {

List<Icon> printIcon =[];
var count=0;
String result;


void iconsAnswer(bool choicedAnswer){
   bool correctanswer = ques.getCorrectAnswer();
  setState(() {
 
     
   if(ques.number()==9){
Alert(context: context,title: 'Done', desc:passed()).show();
    ques.reset();
    printIcon.clear();
    count=0;
    print(ques.number());
   }
   
   else if (choicedAnswer==correctanswer) {
     
      printIcon.add(
        Icon(
          Icons.check,
          color: Colors.green,
        )
      );
     
      count++;
       ques.next();
      
        
    }
   else {
     
      printIcon.add(
        Icon(Icons.close,
        color: Colors.red,
        )
      );
       ques.next();
       
    }
      
   
   
    
  });
}
String passed(){
  if(count>6){
    result='you have passed';
    print(count);
  }
  else{
    result='you have failed';
  }
  return result;
}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                ques.getQuestion(),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.orangeAccent,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                onPressed: (){
                  iconsAnswer(true);
                  },
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            color: Colors.orangeAccent,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                onPressed:  (){
                  iconsAnswer(false);
                  },
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
         SizedBox(
          height: 25,
        ),
        Expanded(
 
          child: Container(
            padding:EdgeInsets.all(15.0) ,
            margin: EdgeInsets.only(bottom: 20.0),
            
            child: Row(
               
              children: printIcon,
            ),
          ),
        ),
      ],
    );
  }
}
