import 'questionHome.dart';

class Questions{
  int _questionNumber=0;
List<QuestionHome> _questionList =[
  QuestionHome('Cyclones spin in a clockwise direction in the southern hemisphere', true),
  QuestionHome('Goldfish only have a memory of three seconds',false),
  QuestionHome('An octopus has five hearts',false),
  QuestionHome('Olivia Newton-John represented the UK in the Eurovision Song Contest in 1974, the year ABBA won with \“Waterloo\"',true),
  QuestionHome('Stephen Hawking declined a knighthood from the Queen',true),
  QuestionHome('Michael Keaton’s real name is Michael Douglas',true),
  QuestionHome('Charlie Chaplin came first in a Charlie Chaplin look-alike contest',false),
 QuestionHome('Napoleon was of below-average height',false),
 QuestionHome('Donald Duck’s middle name is Fauntelroy',true),
 QuestionHome('The Statue of Liberty was a gift from France',true),

];
void next(){
  if(_questionNumber<_questionList.length-1){
    _questionNumber++;
  }
}
  int number(){
    return _questionNumber;
  }

String getQuestion(){
  return _questionList[_questionNumber].questionText;
}
bool getCorrectAnswer(){
  return _questionList[_questionNumber].answer;

}
void reset(){
  _questionNumber=-1;
}
}


