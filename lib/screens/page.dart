import 'package:challenge_appconf/data/data.dart';
import 'package:challenge_appconf/widgets/page_body_button.dart';
import 'package:challenge_appconf/widgets/next_button.dart';
import 'package:challenge_appconf/widgets/page_body_checkbox.dart';
import 'package:challenge_appconf/widgets/page_body_field.dart';
import 'package:challenge_appconf/widgets/page_body_rating.dart';
import 'package:challenge_appconf/widgets/page_body_result.dart';
import 'package:challenge_appconf/widgets/page_body_text.dart';
import 'package:challenge_appconf/widgets/page_title.dart';
import 'package:challenge_appconf/widgets/share_section.dart';
import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final int numPage;
  final bool isAnswered;

  const Page({Key key, @required this.numPage, this.isAnswered = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: PageTitle(titleText: Data.titleText[numPage]),
              flex: 2,
            ),
            Expanded(
              child: Center(child: _bodyByPageNum(numPage)),
              flex: 5,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: (numPage != 7)
                    ? NextButton(
                        numPage: numPage,
                        isEnabled: numPage == 0 || isAnswered,
                      )
                    : ShareSection(),
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyByPageNum(int numPage) {
    if (numPage == 0) {
      return PageBodyText(
          text:
              'Sometimes it is difficult to prize a new project. This app will help you. No longer thinking about price.');
    } else if (numPage == 1 || numPage == 2 || numPage == 5) {
      return PageBodyButton(numPage: numPage);
    } else if (numPage == 3) {
      return PageBodyCheckbox(numPage: numPage);
    } else if (numPage == 4) {
      return PageBodyField(numPage: numPage);
    } else if (numPage == 6) {
      return PageBodyRating(numPage: numPage);
    } else if (numPage == 7) {
      return PageBodyResult();
    } else {
      return Container();
    }
  }
}
