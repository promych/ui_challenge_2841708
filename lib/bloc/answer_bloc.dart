import 'dart:async';

import 'package:challenge_appconf/data/data.dart';

class AnswerBloc {
  List<bool> _answer = List.filled(Data.titleText.length, false);

  StreamController _streamController = StreamController<List<bool>>();

  Stream<List<bool>> get answers => _streamController.stream;

  void markAnswered(int numPage, bool isAnswered) {
    _answer[numPage] = isAnswered;
    _streamController.add(_answer);
  }
}
