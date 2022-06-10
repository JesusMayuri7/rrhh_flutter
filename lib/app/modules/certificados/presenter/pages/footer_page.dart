import 'package:flutter/material.dart';

class FooterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 30,
        child: Container(
          color: Colors.lightBlue[800],
          child: Row(
              //crossAxisAlignment: CrossAxisAlignment.end,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )
              ]),
        ),
      ),
    );
  }
}
