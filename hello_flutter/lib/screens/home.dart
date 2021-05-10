import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color:  Colors.deepPurple,
      child: Center(
        child: Text(
          sayHello(),
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white, fontSize: 36.0),
        )
      ),
    );
  }

  String sayHello() {
    var now = DateTime.now();
    String hello;

    if (now.hour < 12) {
      hello = "Good Morning!";
    } else if (now.hour < 18) {
      hello = "Good Afternoon!";
    } else {
      hello = "Good Evening!";
    }

    var minutes = now.minute < 10
      ? "0" + now.minute.toString()
      : now.minute.toString();

    return "It's now " + now.hour.toString() + ":" + minutes + ".\n" + hello;
  }
}
