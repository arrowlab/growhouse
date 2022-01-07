import 'package:flutter/material.dart';
import 'package:growhouse_dashboard/custom_data.dart';
import 'package:growhouse_dashboard/dashboard.dart';
import 'package:growhouse_dashboard/database.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      ),
      home: StreamProvider<CustomData>.value(
          initialData: CustomData(
            pH: null,
            humidity: null,
            temperature: null,
            redValue: null,
            greenValue: null,
            blueValue: null,
            redIntensity: null,
            greenIntensity: null,
            blueIntensity: null,
            redConcentration: null,
            greenConcentration: null,
            blueConcentration: null,
          ),
          value: Database().data,
          child: Dashboard()),
    );
  }
}
