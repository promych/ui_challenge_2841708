import 'package:challenge_appconf/bloc/answer_bloc.dart';
import 'package:challenge_appconf/data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageBodyField extends StatefulWidget {
  final int numPage;

  const PageBodyField({
    Key key,
    @required this.numPage,
  }) : super(key: key);

  @override
  _PageBodyFieldState createState() => _PageBodyFieldState();
}

class _PageBodyFieldState extends State<PageBodyField> {
  int selectedIndex;

  String dropdownValue = 'USD';
  bool isAnswered1 = false, isAnswered2 = false;

  _readyToMove(bool isReady) {
    Provider.of<AnswerBloc>(context).markAnswered(widget.numPage, isReady);
  }

  @override
  Widget build(BuildContext context) {
    final valueList = Data.choiceTitles[widget.numPage];

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(
            valueList.first,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: TextField(
                  onChanged: (newValue) {
                    isAnswered1 = newValue.trim() != '';
                    _readyToMove(isAnswered1 && isAnswered2);
                  },
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                        value: 'USD', child: Icon(FontAwesomeIcons.dollarSign)),
                    DropdownMenuItem(
                        value: 'EUR', child: Icon(FontAwesomeIcons.euroSign)),
                    DropdownMenuItem(
                        value: 'RUB', child: Icon(FontAwesomeIcons.rubleSign)),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 40.0),
          Text(
            valueList.last,
            textAlign: TextAlign.center,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              child: TextField(
                onChanged: (newValue) {
                  isAnswered2 = newValue.trim() != '';
                  _readyToMove(isAnswered1 && isAnswered2);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
