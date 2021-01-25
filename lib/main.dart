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
      title: 'Quize',
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Icon> scorekeeper = [];
  // List<String> questions = [
  //   'ဆာဂ်ီယိုအဂြယ္႐ို၏ မန္စီးတီးကလပ္စံခ်ိန္တင္ဂိုးေပါင္းမွာ (၁၇၈)ဂိုးျဖစ္သည္။(ZawGyi) /  \n \n ဆာဂျီယိုအဂွယ်ရို၏ မန်စီးတီးကလပ်စံချိန်တင်ဂိုးပေါင်းမှာ (၁၇၈)ဂိုးဖြစ်သည်။ (Unicode)',
  //   'မန္စီးတီးအသင္း၏ ပထဆုံး Football League/Premier League ဖလားရသည့္ႏွစ္မွာ 1936/37 ျဖစ္သည္။(ZawGyi)/ \n \n  မန်စီးတီးအသင်း၏ ပထဆုံး Football League/ Premier League ဖလားရသည့်နှစ်မှာ 1936/37 ဖြစ်သည်။ (Unicode)',
  //   'အီဒါဆင္၏ ေမြးေန႔မွာ 17 AUGUST 1991 ျဖစ္သည္။ (ZawGyi)/  \n အီဒါဆင်၏ မွေးနေ့မှာ 17 AUGUST 1991 ဖြစ်သည်။ (Unicode)',
  //   '1 JULY 2016 တြင္ ဖီးလ္ဖိုဒန္၏ ကစားသမားဘဝကို မန္စီးတီးအသင္းတြင္ စတင္ခဲ့သည္။ (ZawGyi)/ \n \n  1 JULY 2016 တွင် ဖီးလ်ဖိုဒန်၏ ကစားသမားဘဝကို မန်စီးတီးအသင်းတွင် စတင်ခဲ့သည်။ (Unicode)',
  //   'မန္စီးတီးအသင္းသည္  ၁၉၀၃ခုႏွစ္မွ ၂၀၁၈အထိိ FA Cup (၇) ႀကိမ္ရရွိခဲ့ၿပီးျဖစ္သည္။ (ZawGyi)/ \n \n မန်စီးတီးအသင်းသည်  ၁၉၀၃ခုနှစ်မှ ၂၀၁၈အထိိ FA Cup (၇) ကြိမ်ရရှိခဲ့ပြီးဖြစ်သည်။ (Unicode)',
  //   'မန္စီးတီးအသင္းသည္  ၃ႏွစ္ဆက္ ခ်န္ပီယံရာသီမ်ားမွာ 2016/17, 2017/18, 2018/19 ျဖစ္သည္။ (ZawGyi)/ \n \n  မန်စီးတီးအသင်းသည်  ၃နှစ်ဆက် ချန်ပီယံရာသီများမှာ 2016/17, 2017/18, 2018/19 ဖြစ်သည်။ (Unicode)',
  //   'PEP GUARDIOLA သည္ ဒိန္းမတ္ ႏိုင္ငံသားျဖစ္သည္။ (ZawGyi)/ \n \n  PEP GUARDIOLA သည် ဒိန်းမတ် နိုင်ငံသားဖြစ်သည်။ (Unicode)',
  //   'တစ္ရာသီတြင္း clean sheets အမ်ားဆုံးရာသီမွာ 33 (61 matches, 2018/19) ျဖစ္သည္။ (ZawGyi)/ \n \n  တစ်ရာသီတွင်း clean sheets အများဆုံးရာသီမှာ 33 (61 matches, 2018/19) ဖြစ်သည်။ (Unicode)',
  //   '1 JULY 2017 တြင္ ဘာနာဒိုေဆးဗားသည္ စီီးတီးႏွင့္ စာခ်ဳပ္စတင္ခဲ့သည္။ (ZawGyi)/ \n \n  1 JULY 2017 တွင် ဘာနာဒိုဆေးဗားသည် စီီးတီးနှင့် စာချုပ်စတင်ခဲ့သည်။ (Unicode)',
  //   'ကီီီီီီီီီီီီီဗင္ဒီဗ႐ိုင္း၏ေမြးေန႔မွာ 28 JUNE 1991 ျဖစ္သည္။(ZawGyi)/ \n \n  ကီီီီီီီီီီီီီဗင်ဒီဗရိုင်း၏မွေးနေ့မှာ 28 JUNE 1991 ဖြစ်သည်။ (Unicode)',
  //   ' ေမးခြန္းအားလုံး ေျဖဆိုၿပီးပါၿပီ။(ZawGyi)  / \n \n  မေးခွန်းအားလုံး ဖြေဆိုပြီးပါပြီ။ (Unicode)'
  // ];
  // List<bool> answers = [
  //   true,
  //   true,
  //   false,
  //   true,
  //   false,
  //   false,
  //   false,
  //   true,
  //   true,
  //   true,
  //   true
  // ];
  // List<Questions> questions = [
  //   Questions(
  //       q: 'ဆာဂ်ီယိုအဂြယ္႐ို၏ မန္စီးတီးကလပ္စံခ်ိန္တင္ဂိုးေပါင္းမွာ (၁၇၈)ဂိုးျဖစ္သည္။(ZawGyi)   \n \n ဆာဂျီယိုအဂွယ်ရို၏ မန်စီးတီးကလပ်စံချိန်တင်ဂိုးပေါင်းမှာ (၁၇၈)ဂိုးဖြစ်သည်။ (Unicode)',
  //       a: true),
  //   Questions(
  //       q: 'မန္စီးတီးအသင္း၏ ပထဆုံး Football League/Premier League ဖလားရသည့္ႏွစ္မွာ 1936/37 ျဖစ္သည္။(ZawGyi) \n \n  မန်စီးတီးအသင်း၏ ပထဆုံး Football League/ Premier League ဖလားရသည့်နှစ်မှာ 1936/37 ဖြစ်သည်။ (Unicode)',
  //       a: true),
  //   Questions(
  //       q: 'အီဒါဆင္၏ ေမြးေန႔မွာ 17 AUGUST 1991 ျဖစ္သည္။ (ZawGyi)  \n အီဒါဆင်၏ မွေးနေ့မှာ 17 AUGUST 1991 ဖြစ်သည်။ (Unicode)',
  //       a: false),
  //   Questions(
  //       q: '1 JULY 2016 တြင္ ဖီးလ္ဖိုဒန္၏ ကစားသမားဘဝကို မန္စီးတီးအသင္းတြင္ စတင္ခဲ့သည္။ (ZawGyi) \n \n  1 JULY 2016 တွင် ဖီးလ်ဖိုဒန်၏ ကစားသမားဘဝကို မန်စီးတီးအသင်းတွင် စတင်ခဲ့သည်။ (Unicode)',
  //       a: true),
  //   Questions(
  //       q: 'မန္စီးတီးအသင္းသည္  ၁၉၀၃ခုႏွစ္မွ ၂၀၁၈အထိိ FA Cup (၇) ႀကိမ္ရရွိခဲ့ၿပီးျဖစ္သည္။ (ZawGyi) \n \n မန်စီးတီးအသင်းသည်  ၁၉၀၃ခုနှစ်မှ ၂၀၁၈အထိိ FA Cup (၇) ကြိမ်ရရှိခဲ့ပြီးဖြစ်သည်။ (Unicode)',
  //       a: false),
  //   Questions(
  //       q: 'မန္စီးတီးအသင္းသည္  ၃ႏွစ္ဆက္ ခ်န္ပီယံရာသီမ်ားမွာ 2016/17, 2017/18, 2018/19 ျဖစ္သည္။ (ZawGyi) \n \n  မန်စီးတီးအသင်းသည်  ၃နှစ်ဆက် ချန်ပီယံရာသီများမှာ 2016/17, 2017/18, 2018/19 ဖြစ်သည်။ (Unicode)',
  //       a: false),
  //   Questions(
  //       q: 'PEP GUARDIOLA သည္ ဒိန္းမတ္ ႏိုင္ငံသားျဖစ္သည္။ (ZawGyi) \n \n  PEP GUARDIOLA သည် ဒိန်းမတ် နိုင်ငံသားဖြစ်သည်။ (Unicode)',
  //       a: false),
  //   Questions(
  //       q: 'တစ္ရာသီတြင္း clean sheets အမ်ားဆုံးရာသီမွာ 33 (61 matches, 2018/19) ျဖစ္သည္။ (ZawGyi) \n \n  တစ်ရာသီတွင်း clean sheets အများဆုံးရာသီမှာ 33 (61 matches, 2018/19) ဖြစ်သည်။ (Unicode)',
  //       a: true),
  //   Questions(
  //       q: '1 JULY 2017 တြင္ ဘာနာဒိုေဆးဗားသည္ စီီးတီးႏွင့္ စာခ်ဳပ္စတင္ခဲ့သည္။ (ZawGyi) \n \n  1 JULY 2017 တွင် ဘာနာဒိုဆေးဗားသည် စီီးတီးနှင့် စာချုပ်စတင်ခဲ့သည်။ (Unicode)',
  //       a: true),
  //   Questions(
  //       q: 'ကီီီီီီီီီီီီီဗင္ဒီဗ႐ိုင္း၏ေမြးေန႔မွာ 28 JUNE 1991 ျဖစ္သည္။(ZawGyi) \n \n  ကီီီီီီီီီီီီီဗင်ဒီဗရိုင်း၏မွေးနေ့မှာ 28 JUNE 1991 ဖြစ်သည်။ (Unicode)',
  //       a: true),
  //   Questions(
  //       q: ' ေမးခြန္းအားလုံး ေျဖဆိုၿပီးပါၿပီ။(ZawGyi)   \n \n  မေးခွန်းအားလုံး ဖြေဆိုပြီးပါပြီ။ (Unicode)',
  //       a: true),
  // ];

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
      quizbrain.next();
    });
    if (quizbrain.getAnswer() != scoretype) {
      setState(() {
        return Alert(
                context: context,
                title: "RFLUTTER",
                desc: "Flutter is awesome.")
            .show();
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Man City Quizes'),
      ),
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        quizbrain.getQuestion(),
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
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
                        style: TextStyle(color: Colors.white, fontSize: 20.0))),
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
