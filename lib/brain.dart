import 'QuesAns.dart';

class QuizBrain {
  int _quescnt = 0;
  List<QuesAns> _qa = [
    QuesAns("lagest mountain peek is Mount Everest?", true),
    QuesAns("Indias fastest train is local train?", false),
    QuesAns("India won 2022 fifa wc", false),
    QuesAns("India leads G20 summit?", true),
    QuesAns("Shiva is a good boy?", true),
    QuesAns("Shiva is Smart?", true),
    QuesAns('Some cats are actually allergic to humans', true),
    QuesAns('You can lead a cow down stairs but not up stairs.', false),
    QuesAns('Approximately one quarter of human bones are in the feet.', true),
    QuesAns('A slug\'s blood is green.', true),
    QuesAns('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    QuesAns('It is illegal to pee in the Ocean in Portugal.', true),
  ];
  int qn() {
    return _quescnt;
  }

  bool isfinished() {
    if (_quescnt >= _qa.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int totalques() {
    return _qa.length;
  }

  void setStart() {
    _quescnt = 0;
  }

  void nextques() {
    if (_quescnt < _qa.length - 1) {
      _quescnt++;
    } else {
      print('end of questions');
    }
  }

  String getQues() {
    return _qa[_quescnt].ques;
  }

  bool getAns() {
    return _qa[_quescnt].ans;
  }
}
