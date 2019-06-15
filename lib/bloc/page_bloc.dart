import 'dart:async';

import 'package:challenge_appconf/data/data.dart';

class PageBloc {
  int _page = 0;
  StreamController _streamController = StreamController<int>();

  Stream<int> get currentPage => _streamController.stream;

  void nextPage() {
    if (_page < Data.numPages) {
      _page++;
      _streamController.add(_page);
    }
  }
}
