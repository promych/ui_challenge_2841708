import 'package:flutter/material.dart';

class PageBodyResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '5 600 \u0024',
          style: Theme.of(context).textTheme.title,
        ),
        Expanded(
          child: Center(
            child: Text(
              'Because you can\'t put the project into a portfolio the price should not fall below \u0024 5000.',
              style: Theme.of(context).textTheme.body1,
            ),
          ),
        )
      ],
    );
  }
}
