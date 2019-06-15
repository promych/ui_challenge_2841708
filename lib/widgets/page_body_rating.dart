import 'package:challenge_appconf/bloc/answer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageBodyRating extends StatefulWidget {
  final int numPage;

  const PageBodyRating({Key key, @required this.numPage}) : super(key: key);

  @override
  _PageBodyRatingState createState() => _PageBodyRatingState();
}

class _PageBodyRatingState extends State<PageBodyRating> {
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    List<IconData> values = [
      FontAwesomeIcons.frown,
      FontAwesomeIcons.meh,
      FontAwesomeIcons.smile
    ];

    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(values.length, (int index) {
          return GestureDetector(
            child: Container(
              child: Icon(
                values[index],
                size: 80.0,
                color: selectedIndex == index
                    ? Theme.of(context).primaryColor
                    : null,
              ),
            ),
            onTap: () {
              setState(() {
                selectedIndex = index;
                Provider.of<AnswerBloc>(context)
                    .markAnswered(widget.numPage, true);
              });
            },
          );
        }),
      ),
    );
  }
}
