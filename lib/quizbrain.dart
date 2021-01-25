// import 'questions.dart';

import 'dart:html';

import 'package:flutter/cupertino.dart';

class Questions {
  String questionText;
  bool answerText;

  Questions({this.questionText, this.answerText});
}

int questionnum = 0;

class Quizbrain {
  List<Questions> questions = [
    Questions(
        questionText:
            '(1/10) \n\n ဆာဂ်ီယိုအဂြယ္႐ို၏ မန္စီးတီးကလပ္စံခ်ိန္တင္ဂိုးေပါင္းမွာ (၁၇၈)ဂိုးျဖစ္သည္။(ZawGyi)   \n \n ဆာဂျီယိုအဂွယ်ရို၏ မန်စီးတီးကလပ်စံချိန်တင်ဂိုးပေါင်းမှာ (၁၇၈)ဂိုးဖြစ်သည်။ (Unicode)',
        answerText: true),
    Questions(
        questionText:
            '(2/10) \n\n မန္စီးတီးအသင္း၏ ပထဆုံး Football League/Premier League ဖလားရသည့္ႏွစ္မွာ 1936/37 ျဖစ္သည္။(ZawGyi) \n \n  မန်စီးတီးအသင်း၏ ပထဆုံး Football League/ Premier League ဖလားရသည့်နှစ်မှာ 1936/37 ဖြစ်သည်။ (Unicode)',
        answerText: true),
    Questions(
        questionText:
            '(3/10) \n\n အီဒါဆင္၏ ေမြးေန႔မွာ 17 AUGUST 1991 ျဖစ္သည္။ (ZawGyi)  \n အီဒါဆင်၏ မွေးနေ့မှာ 17 AUGUST 1991 ဖြစ်သည်။ (Unicode)',
        answerText: false),
    Questions(
        questionText:
            '(4/10) \n\n 1 JULY 2016 တြင္ ဖီးလ္ဖိုဒန္၏ ကစားသမားဘဝကို မန္စီးတီးအသင္းတြင္ စတင္ခဲ့သည္။ (ZawGyi) \n \n  1 JULY 2016 တွင် ဖီးလ်ဖိုဒန်၏ ကစားသမားဘဝကို မန်စီးတီးအသင်းတွင် စတင်ခဲ့သည်။ (Unicode)',
        answerText: true),
    Questions(
        questionText:
            '(5/10) \n\n မန္စီးတီးအသင္းသည္  ၁၉၀၃ခုႏွစ္မွ ၂၀၁၈အထိိ FA Cup (၇) ႀကိမ္ရရွိခဲ့ၿပီးျဖစ္သည္။ (ZawGyi) \n \n မန်စီးတီးအသင်းသည်  ၁၉၀၃ခုနှစ်မှ ၂၀၁၈အထိိ FA Cup (၇) ကြိမ်ရရှိခဲ့ပြီးဖြစ်သည်။ (Unicode)',
        answerText: false),
    Questions(
        questionText:
            '(6/10) \n\n မန္စီးတီးအသင္းသည္  ၃ႏွစ္ဆက္ ခ်န္ပီယံရာသီမ်ားမွာ 2016/17, 2017/18, 2018/19 ျဖစ္သည္။ (ZawGyi) \n \n  မန်စီးတီးအသင်းသည်  ၃နှစ်ဆက် ချန်ပီယံရာသီများမှာ 2016/17, 2017/18, 2018/19 ဖြစ်သည်။ (Unicode)',
        answerText: false),
    Questions(
        questionText:
            '(7/10) \n\n PEP GUARDIOLA သည္ ဒိန္းမတ္ ႏိုင္ငံသားျဖစ္သည္။ (ZawGyi) \n \n  PEP GUARDIOLA သည် ဒိန်းမတ် နိုင်ငံသားဖြစ်သည်။ (Unicode)',
        answerText: false),
    Questions(
        questionText:
            '(8/10) \n\n တစ္ရာသီတြင္း clean sheets အမ်ားဆုံးရာသီမွာ 33 (61 matches, 2018/19) ျဖစ္သည္။ (ZawGyi) \n \n  တစ်ရာသီတွင်း clean sheets အများဆုံးရာသီမှာ 33 (61 matches, 2018/19) ဖြစ်သည်။ (Unicode)',
        answerText: true),
    Questions(
        questionText:
            '(9/10) \n\n 1 JULY 2017 တြင္ ဘာနာဒိုေဆးဗားသည္ စီီးတီးႏွင့္ စာခ်ဳပ္စတင္ခဲ့သည္။ (ZawGyi) \n \n  1 JULY 2017 တွင် ဘာနာဒိုဆေးဗားသည် စီီးတီးနှင့် စာချုပ်စတင်ခဲ့သည်။ (Unicode)',
        answerText: true),
    Questions(
        questionText:
            '(10/10) \n\n ကီီီီီီီီီီီီီဗင္ဒီဗ႐ိုင္း၏ေမြးေန႔မွာ 28 JUNE 1991 ျဖစ္သည္။(ZawGyi) \n \n  ကီီီီီီီီီီီီီဗင်ဒီဗရိုင်း၏မွေးနေ့မှာ 28 JUNE 1991 ဖြစ်သည်။ (Unicode)',
        answerText: true),
    Questions(
        questionText:
            'Thank You! \n\n ေမးခြန္းအားလုံး ေျဖဆိုၿပီးပါၿပီ။(ZawGyi)   \n \n  မေးခွန်းအားလုံး ဖြေဆိုပြီးပါပြီ။ (Unicode)',
        answerText: true),
  ];

  String getQuestion() {
    return questions[questionnum].questionText;
  }

  bool getAnswer() {
    return questions[questionnum].answerText;
  }
}
