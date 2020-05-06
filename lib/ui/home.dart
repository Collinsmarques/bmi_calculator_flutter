import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<MyHome> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  double result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          "BMI",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
          alignment: Alignment.topCenter,
          child: ListView(
            children: <Widget>[
              new Image.asset(
                "images/bmilogo.png",
                height: 85.0,
                width: 75.0,
              ),
              new Container(
                margin: EdgeInsets.all(3.0),
                height: 245.0,
                width: 290.0,
                color: Colors.grey.shade300,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Age',
                          hintText: 'eg 36',
                          icon: Icon(Icons.person_outline)),
                    ),
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Height in M',
                          hintText: 'Eg 1.3',
                          icon: Icon(Icons.assessment)),
                    ),
                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Weight in kg',
                          hintText: 'Eg 55.3',
                          icon: Icon(Icons.line_weight)),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    new FlatButton(
                        onPressed: _calculateBmi,
                        color: Colors.pinkAccent,
                        child: new Text(
                          'Calculate',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                  ),
                  new Text(
                    'BMI: $result',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontStyle: FontStyle.italic,
                        fontSize: 19.9),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                  ),
                  new Text(
                    'Overweight:',
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 19.9),
                  ),
                ],
              )
            ],
          )),
    );
  }

  void _calculateBmi() {
    setState(()  {

      if (_weightController.text.isNotEmpty && _heightController.text.isNotEmpty){
        double weight = double.parse(_weightController.text);
        double height = double.parse(_weightController.text);
        result = weight / (height * height);
      }

    });
  }
}
