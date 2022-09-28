import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nutrimetrix/generated/codegen_loader.g.dart';
import 'package:nutrimetrix/home_screen.dart';
import 'package:nutrimetrix/utils/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ru')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutrimetrix',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
