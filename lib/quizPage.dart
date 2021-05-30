import 'package:flutter/material.dart';
import 'dart:async';
import 'utils/questionList.dart';
import 'utils/question.dart';
import 'ui/questionBox.dart';
import 'ui/overlay.dart';
import 'scorepage.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  _QuizPageState() {
    init();
  }

  Question _currentQuestion;
  QuestionList _quizQuestions = new QuestionList(
    [
      Question(
          '"A-K-E-R-M-E" harfleriyle aşağıdaki sözcüklerden hangisini oluşturamayız?',
          'merak',
          'kerem',
          'kemer',
          'akrep',
          'D'),
      Question(
          '(1) Çocuklar karın yağışını izliyordu. (2) Kar tanelerinin tek arzusu yavaş yavaş süzülmekti.  (3) Çocuklar, tanecikleri havada yakalamaya çalışıyorlardı. (4) Kar taneleri bu duruma çok şaşırdı.'
              'Bu parçada numaralanmış cümlelerin hangilerinde hayal ürünü bir durum söz konusudur?',
          '1. ve 2.',
          '2. ve 3.',
          '1. ve 3.',
          '2. ve 4.',
          'A'),
      Question(
          'Aşağıdaki cümlelerden hangisi amaç-sonuç cümlesidir?',
          'Çocukluğumuzun en güzel eğlencesiydi.',
          'İp koptuğu için yere düştü.',
          'Kardeşim de oynamak için yanımıza gelirdi. ',
          'Tuhaf tuhaf bakardı bize.',
          'A'),
      Question(
          '"A-K-E-R-M-E" harfleriyle aşağıdaki sözcüklerden hangisini oluşturamayız?',
          'merak',
          'kerem',
          'kemer',
          'akrep',
          'D'),
      Question(
          '(1) Çocuklar karın yağışını izliyordu. (2) Kar tanelerinin tek arzusu yavaş yavaş süzülmekti.  (3) Çocuklar, tanecikleri havada yakalamaya çalışıyorlardı. (4) Kar taneleri bu duruma çok şaşırdı.'
              'Bu parçada numaralanmış cümlelerin hangilerinde hayal ürünü bir durum söz konusudur?',
          '1. ve 2.',
          '2. ve 3.',
          '1. ve 3.',
          '2. ve 4.',
          'A'),
    ],
  );

  int _questionNumber = 0;
  int _score = 0;
  bool _isCorrect;
  bool _overlayVisible;

  void init() {
    _overlayVisible = false;
    _currentQuestion = _quizQuestions.nextQuestion;
    _questionNumber = _quizQuestions.questionNumber;
  }

  void choiceHandler(String choice) {
    if (_questionNumber == _quizQuestions.length) {
      Timer(
          Duration(seconds: 3),
          () => this.setState(() {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new ScorePage(_score, _quizQuestions.length)));
              }));
    }

    _isCorrect = (choice == _currentQuestion.correctChoice);
    _score = _isCorrect ? _score + 1 : _score;

    this.setState(() {
      _overlayVisible = true;
    });
    Timer(
        Duration(seconds: 3),
        () => this.setState(() {
              init();
            }));
  }

  Column createQuizQuestion(Question obj) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            new QuestionBox(Colors.red, "A", obj.choiceA, () {
              choiceHandler("A");
            }),
            new QuestionBox(Colors.green, "B", obj.choiceB, () {
              choiceHandler("B");
            })
          ],
        ),
        Row(
          children: <Widget>[
            new QuestionBox(Colors.blue, "C", obj.choiceC, () {
              choiceHandler("C");
            }),
            new QuestionBox(Colors.orange, "D", obj.choiceD, () {
              choiceHandler("D");
            })
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
                image: AssetImage('assets/arkaplan.jpg'), fit: BoxFit.fill),
          ),
        ),
        new Column(
          children: <Widget>[
            Center(
              child: Container(
                color: new Color(0x476879ff),
                width: double.infinity,
                padding: new EdgeInsets.all(6.0),
                child: Center(
                  child: Text(
                    "SORULAR " + _questionNumber.toString(),
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Center(
              child: new Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(color: Colors.black54),
                  padding: new EdgeInsets.only(
                      top: 10.0, left: 15.0, right: 15.0, bottom: 10.0),
                  child: new Center(
                      child: Text(
                    _currentQuestion.questionText,
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            createQuizQuestion(_currentQuestion),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            _overlayVisible ? new CustomOverlay(_isCorrect) : new Container(),
          ],
        )
      ],
    );
  }
}
