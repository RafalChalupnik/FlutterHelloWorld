import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 30, left: 10),
      color: Colors.deepOrangeAccent,
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Expanded(child: Text("Margherita",
            style: TextStyle(
              fontSize: 30,
              decoration: TextDecoration.none,
              fontFamily: 'Oxygen',
              fontWeight: FontWeight.normal
            )
          )),
          Expanded(child: Text("Tomato, Mozzarella, Basil",
            style: TextStyle(
              fontSize: 20,
              decoration: TextDecoration.none,
              fontFamily: 'Oxygen',
              fontWeight: FontWeight.normal
            )
          ))
        ]),
        Row(children: <Widget>[
          Expanded(child: Text("Marinara",
            style: TextStyle(
              fontSize: 30,
              decoration: TextDecoration.none,
              fontFamily: 'Oxygen',
              fontWeight: FontWeight.normal
            )
          )),
          Expanded(child: Text("Tomato, Garlic",
            style: TextStyle(
              fontSize: 20,
              decoration: TextDecoration.none,
              fontFamily: 'Oxygen',
              fontWeight: FontWeight.normal
            )
          ))
        ]),
        PizzaImageWidget()
      ])
    ));
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pizzaAsset = AssetImage('images/pizza.png');
    var image = Image(image: pizzaAsset, width: 400, height: 400);
    return Container(child: image);
  }
}
