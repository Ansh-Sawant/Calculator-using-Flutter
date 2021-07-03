import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late int firstnum;
  late int secondnum;
  String texttodisplay = "";
  String res = "";
  String operatortoperform = "";
  void btnclicked(String btnval){
    if(btnval == "C"){
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    }
    else if(btnval == "+" || btnval == "-" || btnval == "*" || btnval == "/"){
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnval;
    }
    else if(btnval == "="){
      secondnum = int.parse(texttodisplay);
      if(operatortoperform == "+"){
        res = (firstnum + secondnum).toString();
      }
      if(operatortoperform == "-"){
        res = (firstnum - secondnum).toString();
      }
      if(operatortoperform == "*"){
        res = (firstnum * secondnum).toString();
      }
      if(operatortoperform == "/"){
        res = (firstnum / secondnum).toString();
      }
    }
    else{
      res = int.parse(texttodisplay + btnval).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  Widget customButton(String btnval) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnclicked(btnval),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "$btnval",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("Made By Ansh Sawant"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(                  
                    "$texttodisplay",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
