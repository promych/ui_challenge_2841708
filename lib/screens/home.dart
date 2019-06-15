import 'dart:async';

import 'package:challenge_appconf/bloc/answer_bloc.dart';
import 'package:challenge_appconf/bloc/page_bloc.dart';
import 'package:challenge_appconf/data/data.dart';
import 'package:challenge_appconf/screens/page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller;
  double currentPageValue;
  static PageBloc pageBloc;
  static AnswerBloc answerBloc;
  StreamSubscription streamSubscription;

  @override
  void initState() {
    pageBloc = PageBloc();
    answerBloc = AnswerBloc();
    controller = PageController(initialPage: 0);
    currentPageValue = 0.0;
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });
    streamSubscription = pageBloc.currentPage.listen((int value) {
      _moveToNextPage(value);
    });
    super.initState();
  }

  _moveToNextPage(int numPage) {
    setState(() {
      controller
          .animateToPage(numPage,
              duration: Duration(seconds: 1), curve: Curves.easeIn)
          .then((_) {
        FocusScope.of(context).detach();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 15.0,
              child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                  value: (currentPageValue + 1) / Data.numPages),
            ),
            Expanded(
              child: MultiProvider(
                providers: [
                  Provider<PageBloc>.value(value: pageBloc),
                  Provider<AnswerBloc>.value(value: answerBloc),
                ],
                child: StreamBuilder<List<bool>>(
                    initialData:
                        List<bool>.filled(Data.titleText.length, false),
                    stream: answerBloc.answers,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return PageView.builder(
                          controller: controller,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Data.numPages,
                          itemBuilder: (BuildContext context, int position) {
                            return Page(
                              numPage: position,
                              isAnswered: snapshot.data[position],
                            );
                          });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    controller.dispose();
    super.dispose();
  }
}
