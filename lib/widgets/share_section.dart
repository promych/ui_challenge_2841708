import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShareSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<IconData> values = [
      FontAwesomeIcons.facebook,
      FontAwesomeIcons.linkedin,
      FontAwesomeIcons.slack,
      FontAwesomeIcons.twitter,
      FontAwesomeIcons.vk,
      FontAwesomeIcons.skype,
      FontAwesomeIcons.whatsapp
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text('Share this'),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(values.length, (int index) {
              return Expanded(
                child: IconButton(
                  icon: Icon(values[index]),
                  onPressed: () {},
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
