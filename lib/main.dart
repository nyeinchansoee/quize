import 'package:flutter/material.dart';
// import 'package:quize/questions.dart';
import 'package:quize/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// import 'questions.dart';

void main() {
  runApp(MyApp());
}

Quizbrain quizbrain = Quizbrain();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'Manchester City'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Icon> scorekeeper = [];
  // int questionnum = 0;
  void addscore(bool scoretype) {
    if (quizbrain.getAnswer() == scoretype) {
      scorekeeper.add(
        Icon(Icons.check, color: Colors.white),
      );
    } else {
      scorekeeper.add(
        Icon(Icons.close, color: Colors.black),
      );
    }
    setState(() {
      // quizbrain.next();

      if (questionnum < quizbrain.questions.length - 1) {
        questionnum++;
      } else {
        questionnum = 0;
        scorekeeper.clear();
        Alert(
          context: context,
          // style: alertStyle,
          type: AlertType.info,
          title: "Quiz Complete",
          desc: "Ready to Re-start Quiz.",
          buttons: [
            DialogButton(
              child: Text(
                "COOL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Color.fromRGBO(0, 179, 134, 1.0),
              radius: BorderRadius.circular(0.0),
            ),
          ],
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Man City Quiz',
          style: TextStyle(backgroundColor: Colors.blue),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(quizbrain.getQuestion(),
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                          textAlign: TextAlign.center),
                    ),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  // textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    addscore(true);
                  },
                  child: Text('Yes',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                      textAlign: TextAlign.center),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                    // textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      addscore(false);
                    },
                    child: Text('No',
                        style: TextStyle(color: Colors.white, fontSize: 20.0))),
              )),
              Row(
                children: scorekeeper,
              )
            ],
          ),
        ),
      ),
    );
  }
}
