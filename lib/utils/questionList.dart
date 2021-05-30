import 'question.dart';

class QuestionList {
  final List<Question> _quizQuestionList;
  int _currentQuestionIndex = -1;

  QuestionList(this._quizQuestionList) {
    _quizQuestionList.shuffle();
  }

  int get length => _quizQuestionList.length;
  int get questionNumber => _currentQuestionIndex + 1;

  Question get nextQuestion {
    _currentQuestionIndex++;

    if (_currentQuestionIndex > length) {
      return null;
    }

    return _quizQuestionList[_currentQuestionIndex];
  }
}
