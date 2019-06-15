import 'package:challenge_appconf/bloc/page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NextButton extends StatelessWidget {
  final int numPage;
  final bool isEnabled;

  const NextButton({Key key, @required this.numPage, this.isEnabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250.0,
          height: 75.0,
          child: isEnabled
              ? FlatButton(
                  shape: StadiumBorder(),
                  splashColor: Colors.transparent,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    numPage == 0 ? 'GO' : 'NEXT',
                    style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => Provider.of<PageBloc>(context).nextPage(),
                )
              : OutlineButton(
                  shape: StadiumBorder(),
                  splashColor: Colors.transparent,
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  child: Text(
                    'NEXT',
                    style: TextStyle(fontSize: 32.0),
                  ),
                  onPressed: () {},
                ),
        ),
      ],
    );
  }
}
