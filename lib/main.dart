import 'package:daily_quotes/Screens/SplashScreen.dart';
import 'package:daily_quotes/Screens/catagory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: Brightness.light,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder> {
        '/HomeScreen' : (BuildContext context) => MyHomePage()
      },
    );
  }
}

