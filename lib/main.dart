import 'dart:io';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:do_weather/models/Astro.dart';
import 'package:do_weather/models/Current.dart';
import 'package:do_weather/models/Forecast.dart';
import 'package:do_weather/models/Forecastday.dart';
import 'package:do_weather/models/Hour.dart';
import 'package:do_weather/models/weatherForecast.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      title: 'Flutter Demo',
      navigatorObservers: [BotToastNavigatorObserver()],
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
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  weatherForecast weather;
  AnimationController controller;
  AnimationController headerController;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3000))
          ..repeat()
          ..addListener(() {
            setState(() {});
          });
    headerController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    super.initState();
    fetchWeather("shanghai");
  }

  @override
  void dispose() {
    controller.dispose();
    headerController.dispose();
    super.dispose();
  }

  Future<void> fetchWeather(String city) async {
    BotToast.showLoading();
    Response response = await Dio().get(
        "http://api.weatherapi.com/v1/forecast.json?key=0009bee6bf324d1a94885641202610&days=10&q=shanghai");
    if (response.statusCode == HttpStatus.ok) {
      setState(() {
        weather = weatherForecast.fromJson(response.data);
      });
      Future.delayed(Duration(milliseconds: 6000), () {
        headerController.forward(from: 0);
      });
      BotToast.closeAllLoading();
    } else {
      BotToast.showText(text: "error!");
    }
  }

  GlobalKey weatherNowKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return weather == null
        ? Scaffold()
        : Scaffold(
            body: Stack(
            children: <Widget>[
              FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:
                      "https://picsum.photos/${MediaQuery.of(context).size.width.toInt()}/${MediaQuery.of(context).size.height.toInt()}"),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: headerController,
                      builder: (BuildContext context, Widget child) {
                        return SizedBox(
                          height: headerController.value *
                              (MediaQuery.of(context).size.height - 140),
                        );
                      },
                    ),
                    Align(
                      key: weatherNowKey,
                      alignment: Alignment.topLeft,
                      child: weatherNow(weather.current),
                    ),
                    weather24Hours(weather.forecast),
                    weatherWeek(weather.forecast),
                    weatherDetail(weather.current),
                    weatherSun(weather.forecast.forecastday.first.astro,
                        weather.current),
                  ],
                ),
              ),
              Container(
                  margin:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.black26,
                          onPressed: () {},
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.black26,
                          onPressed: () {},
                        ),
                      )
                    ],
                  ))
            ],
          ) // This trailing comma makes auto-formatting nicer for build methods.
            );
  }

  Widget weatherNow(Current current) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: "http:${current.condition.icon}",
                  width: 60,
                  height: 60,
                ),
                Text(
                  current.condition.text,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
            Row(
              children: <Widget>[
                ImageIcon(
                  AssetImage("images/up.png"),
                  color: Colors.white,
                ),
                Text(
                  weather.forecast.forecastday.first.day.maxtemp_c.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 15,
                  height: 1,
                ),
                Text(
                  weather.forecast.forecastday.first.day.mintemp_c.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                ImageIcon(AssetImage("images/down.png"), color: Colors.white)
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "${current.temp_c}℃",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget weather24Hours(Forecast forecast) {
    List<Widget> ws = [];
    forecast.forecastday.first.hour.forEach((element) {
      ws.add(weather24HoursItem(element));
    });
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15, right: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ws,
      ),
    );
  }

  Widget weather24HoursItem(Hour hour) {
    return Container(
      width: 50,
      height: 75,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Color(0x40000000), borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: "http:${hour.condition.icon}",
            width: 30,
            height: 30,
          ),
          Text(
            "${hour.temp_c}℃",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "${hour.time.split(" ").last}",
            style: TextStyle(fontSize: 14, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget weatherWeek(Forecast forecast) {
    List<Widget> ws = [];
    forecast.forecastday.forEach((element) {
      ws.add(weatherWeekItem(element));
    });
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0x40000000), borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "最强",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "最弱",
                style: TextStyle(color: Colors.white, fontSize: 10),
              )
            ],
          ),
          Column(
            children: ws,
          )
        ],
      ),
    );
  }

  Widget weatherWeekItem(Forecastday forecastday) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          date2week(forecastday.date),
          style: TextStyle(color: Colors.white),
        ),
        CachedNetworkImage(
          imageUrl: "http:${forecastday.day.condition.icon}",
          width: 30,
          height: 30,
        ),
        Row(
          children: <Widget>[
            Text(
              "${forecastday.day.maxtemp_c}℃",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "${forecastday.day.mintemp_c}℃",
              style: TextStyle(color: Colors.white),
            )
          ],
        )
      ],
    );
  }

  String date2week(String date) {
    int weekday = DateTime.parse(date).weekday;
    String weekdayChinese;
    switch (weekday) {
      case 1:
        weekdayChinese = "一";
        break;
      case 2:
        weekdayChinese = "二";
        break;
      case 3:
        weekdayChinese = "三";
        break;
      case 4:
        weekdayChinese = "四";
        break;
      case 5:
        weekdayChinese = "五";
        break;
      case 6:
        weekdayChinese = "六";
        break;
      case 7:
        weekdayChinese = "日";
        break;
    }
    return "星期$weekdayChinese";
  }

  Widget weatherDetail(Current current) {
    return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0x40000000), borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "详细信息",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: "http:${current.condition.icon}",
                  width: 80,
                  height: 80,
                ),
                Container(
                  width: 100,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "体感温度",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          Text(
                            "${current.feelslike_c}℃",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "湿度",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          Text(
                            "${current.humidity}%",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "能见度",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          Text(
                            "${current.vis_km}公里",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "UV Index",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          Text(
                            "${current.uv}",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "露点",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          Text(
                            "${current.uv}",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget weatherSun(Astro astro, Current current) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 190,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0x40000000),
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              image: AssetImage("images/fengche2.gif"), fit: BoxFit.cover)),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text("太阳和风速",
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ),
          CustomPaint(
            painter: MyCustomPainter(-pi, controller.value * pi),
            size: Size(MediaQuery.of(context).size.width, 155),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(astro.sunrise,
                style: TextStyle(fontSize: 8, color: Colors.white)),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(astro.sunset,
                style: TextStyle(fontSize: 8, color: Colors.white)),
          ),
          Positioned(
              top: 80,
              right: 60,
              child: Column(
                children: <Widget>[
                  Text("风速",
                      style: TextStyle(fontSize: 9, color: Colors.white)),
                  Text("${current.wind_mph}英里/小时",
                      style: TextStyle(fontSize: 10, color: Colors.white)),
                  Text("气压",
                      style: TextStyle(fontSize: 9, color: Colors.white)),
                  Text("${current.pressure_mb}毫巴",
                      style: TextStyle(fontSize: 10, color: Colors.white))
                ],
              ))
        ],
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final double start;
  final double sweep;

  MyCustomPainter(this.start, this.sweep);

  @override
  void paint(Canvas canvas, Size size) {
    //底画
    Paint paint1 = Paint()
      ..color = Colors.white
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height), radius: size.width / 2.5);
    canvas.drawArc(rect, -pi, pi, false, paint1);
    //sunrise
    Paint paint2 = Paint()
      ..color = Colors.yellow
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawArc(rect, start, sweep, false, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
