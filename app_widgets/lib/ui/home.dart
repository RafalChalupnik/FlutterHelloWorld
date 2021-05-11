import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      alignment: Alignment.center,
      color: Colors.deepOrangeAccent,
      child: Text("Pizza",
        style: TextStyle(
          fontSize: 80,
          decoration: TextDecoration.none,
          fontFamily: 'Oxygen',
          fontWeight: FontWeight.normal
        )
      ),
    ));
  }
}
