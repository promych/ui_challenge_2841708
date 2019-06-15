import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String titleText;

  const PageTitle({Key key, @required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.title,
        textAlign: TextAlign.center,
      ),
    );
  }
}
