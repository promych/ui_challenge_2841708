import 'package:challenge_appconf/bloc/answer_bloc.dart';
import 'package:challenge_appconf/data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageBodyButton extends StatefulWidget {
  final int numPage;

  const PageBodyButton({Key key, @required this.numPage}) : super(key: key);

  @override
  _PageBodyButtonState createState() => _PageBodyButtonState();
}

class _PageBodyButtonState extends State<PageBodyButton> {
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    var valueList = Data.choiceTitles[widget.numPage];

    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? 3.0
              : 10.0,
      crossAxisSpacing: 14.0,
      mainAxisSpacing: 14.0,
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(valueList.length, (int index) {
        bool isSelected = (selectedIndex == index);

        return RaisedButton(
          color: isSelected ? Theme.of(context).primaryColor : Colors.grey[800],
          elevation: 4.0,
          child: Text(
            valueList[index],
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.0,
                color: isSelected ? Colors.grey[800] : Colors.white,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
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
