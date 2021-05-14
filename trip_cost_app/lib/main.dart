import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Cost Calculator',
      home: FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  
  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  final double _formDistance = 5.0;
  String _currency = 'Dollars';
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Cost Calculator"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance
              ),
              child: TextField(
                controller: distanceController,
                decoration: InputDecoration(
                  labelText: 'Distance',
                  hintText: 'e.g. 124',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true)
              )
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance
              ),
              child: TextField(
                controller: avgController,
                decoration: InputDecoration(
                  labelText: 'Distance per Unit',
                  hintText: 'e.g. 17',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true)
              )
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance
              ),
              child: Row(
                children: [
                  Expanded(child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      hintText: 'e.g. 1.65',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true)
                  )),
                  Container(width: _formDistance * 5),
                  Expanded(child: DropdownButton(
                    items: _currencies.map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value))
                    ).toList(),
                    value: _currency,
                    onChanged: (value) {
                      _onDropdownChanged(value);
                    }
                  ))
                ],
              )
            ),
            Row(
              children: [
                Expanded(child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),
                    foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight)
                  ),
                  onPressed: () {
                    setState(() {
                      result = _calculate();
                    });
                  },
                  child: Text(
                    'Submit',
                    textScaleFactor: 1.5,
                  )
                )),
                Expanded(child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).buttonColor),
                    foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark)
                  ),
                  onPressed: () {
                    setState(() {
                      _reset();
                    });
                  },
                  child: Text(
                    'Reset',
                    textScaleFactor: 1.5,
                  )
                ))
              ]
            ),
            Text(result)
          ]
        )
      )
    );
  }

  void _onDropdownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  String _calculate() {
    var distance = double.parse(distanceController.text);
    var fuelCost = double.parse(priceController.text.replaceAll(',', '.'));
    var consumption = double.parse(avgController.text);
    var totalCost = distance / consumption * fuelCost;
    return 'The total cost for your trip is ' + totalCost.toStringAsFixed(2) + ' ' + _currency;
  }

  void _reset() {
    distanceController.text = '';
    avgController.text = '';
    priceController.text = '';
    setState(() {
      result = '';
    });
  }
}
