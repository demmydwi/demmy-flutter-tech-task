import 'package:flutter/material.dart';
import 'package:home_credit_flutter_task/provider/home_provider.dart';
import 'package:home_credit_flutter_task/util/colors.dart';
import 'package:home_credit_flutter_task/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      ChangeNotifierProvider(
        create: (_) => HomeProvider(),
      ),
    ],
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Credit Flutter Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: BaseColor.primary,
        primaryColorDark: BaseColor.primaryDark,
        primaryColorLight: BaseColor.primaryLight,
        backgroundColor: Colors.white,
        accentColor: BaseColor.secondary,
        accentColorBrightness: Brightness.light,
        primaryColorBrightness: Brightness.dark,
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        primaryTextTheme: TextTheme(),
        accentTextTheme: TextTheme(),
      ),
      home: SplashScreen(),
    );
  }
}
