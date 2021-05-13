import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/constants.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var color;
  String answer = '';
  int value1, value2, score = 0, life = 3;
  bool trueAnswer = false;
  var _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = '';
    _generateExample();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _generateExample() {
    var random = new Random();
    setState(() {
      value1 = random.nextInt(10);
      value2 = random.nextInt(10);
      _controller.clear();
      answer = '';
    });
  }

  Future<void> _answerCheck(String str) async {
    setState(() {
      if (str != '') {
        bool check = value1 + value2 == int.parse(str);
        answer = str;
        if (check) {
          color = kTrueColor;
        } else {
          color = kFalseColor;
        }
        trueAnswer = true;
      } else {
        answer = '';
        color = kPrimaryColor;
      }
    });
    if (trueAnswer) {
      await Future.delayed(Duration(milliseconds: 800));
      color = kPrimaryColor;
      _generateExample();
      trueAnswer = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text(
          'Решаем примеры',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      drawer: Drawer(
        elevation: 10.0,
        child: Container(
          color: kPrimaryColor,
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                padding: EdgeInsets.all(28.0),
                child: Text('Menu',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 42.0)),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: ListTile(
                  leading: Icon(
                    Icons.add_circle,
                    color: kWhite,
                  ),
                  title: Text(
                    'Математика',
                    style: TextStyle(color: kWhite),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: ListTile(
                  leading: Icon(
                    Icons.chat_rounded,
                    color: kWhite,
                  ),
                  title: Text(
                    'Русский',
                    style: TextStyle(color: kWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20.0,
                      ),
                      Text(' $score',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontSize: 18.0, color: kPrimaryColor)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 18.0,
                      ),
                      Text(' $life',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontSize: 18.0, color: kPrimaryColor)),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              shadowColor: kSecondaryColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: kPrimaryColor, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              elevation: 15,
              child: Container(
                alignment: Alignment.center,
                width: 250,
                height: 100,
                child: Text(
                  '$value1 + $value2 = $answer',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: color,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 110.0,
              height: 60.0,
              child: TextField(
                controller: _controller,
                onSubmitted: _answerCheck,
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: 26.0,
                    ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0.0),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    iconSize: 18.0,
                    alignment: Alignment.center,
                    onPressed: () {
                      _controller.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            SizedBox(
              width: 175.0,
              height: 40.0,
              child: ElevatedButton.icon(
                onPressed: () {
                  _answerCheck(_controller.text);
                },
                label: Text(
                  'Ответить',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontSize: 18.0),
                ),
                icon: Icon(Icons.calculate),
              ),
            ),
          ],
        ),
      ),
    );
    return scaffold;
  }
}
