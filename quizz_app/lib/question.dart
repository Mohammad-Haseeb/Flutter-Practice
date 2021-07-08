class Question{
  late String _question;
  late bool _answer;
  Question(String question,bool answer){
    this.answer=answer;
    this.question=question;
  }

  String get question => _question;

  set question(String value) => _question = value;




  bool get answer => _answer;

  set answer(bool value) {
    _answer = value;
  }
}