import 'package:challenge_appconf/bloc/answer_bloc.dart';
import 'package:challenge_appconf/data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageBodyCheckbox extends StatefulWidget {
  final int numPage;

  const PageBodyCheckbox({Key key, @required this.numPage}) : super(key: key);

  @override
  _PageBodyCheckboxState createState() => _PageBodyCheckboxState();
}

class _PageBodyCheckboxState extends State<PageBodyCheckbox> {
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final valueList = Data.choiceTitles[widget.numPage];

    return ListView(
      children: List.generate(valueList.length, (int index) {
        bool isSelected = (selectedIndex == index);

        return ListTile(
          leading: Container(
              decoration: BoxDecoration(
                color: Colors.grey[700],
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10.0)],
              ),
              height: 50.0,
              width: 50.0,
              child: isSelected
                  ? Align(
                      child: Text(
                        'X',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    )
                  : Container()),
          title: Text(
            valueList[index],
            style: Theme.of(context).textTheme.body2,
          ),
          subtitle: Text(
            'Generic subtitle text',
            style: Theme.of(context).textTheme.subtitle,
          ),
          onTap: () {
            setState(() {
              if (selectedIndex != index) {
                selectedIndex = index;
                Provider.of<AnswerBloc>(context)
                    .markAnswered(widget.numPage, true);
              } else {
                selectedIndex = null;
                Provider.of<AnswerBloc>(context)
                    .markAnswered(widget.numPage, false);
              }
            });
          },
        );
      }),
    );
  }
}
