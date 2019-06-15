import 'package:flutter/material.dart';

class PageBodyText extends StatelessWidget {
  final String text;

  const PageBodyText({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.body1,
    );
  }
}
