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
  String _currency = 'Dollars';
  TextEditingController distanceController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: distanceController,
              decoration: InputDecoration(
                labelText: 'Distance',
                hintText: 'e.g. 124',
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ),
              keyboardType: TextInputType.number
            ),
            DropdownButton(
              items: _currencies.map(
                (value) => DropdownMenuItem(
                  value: value,
                  child: Text(value))
              ).toList(),
              value: _currency,
              onChanged: (value) {
                _onDropdownChanged(value);
              }
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),
                foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight)
              ),
              onPressed: () {
                setState(() {
                  result = distanceController.text;
                });
              },
              child: Text(
                'Submit',
                textScaleFactor: 1.5,
              )
            ),
            Text('Hello ' + result + '!')
          ]
        )
      )
    );
  }

  _onDropdownChanged(String value) {
      setState(() {
        this._currency = value;
      });
    }
}
