import 'package:flutter/material.dart';
import 'package:nutrimetrix/home_screen.dart';
import 'package:nutrimetrix/utils/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutrimetrix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: kTextColor,
              fontFamily: "Roboto",
            ),
      ),
      home: HomeScreen(),
    );
  }
}
