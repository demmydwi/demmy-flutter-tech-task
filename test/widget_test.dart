// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_credit_flutter_task/model/item_model.dart';

import 'package:home_credit_flutter_task/provider/home_provider.dart';
import 'package:home_credit_flutter_task/util/colors.dart';
import 'package:home_credit_flutter_task/view/home_screen.dart';
import 'package:home_credit_flutter_task/view/splash_screen.dart';
import 'package:provider/provider.dart';
import 'dart:io' as io;

void main() {
  testWidgets("Splash screen has logo image", (tester) async {
    await tester.pumpWidget(MaterialApp(
        title: 'Home Credit Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: BaseColor.primary,
        ),
        home: SplashScreen(
          forcePush: false,
        )));

    final logo = find.byKey(ValueKey("logo"));

    expect(logo, findsOneWidget);
  });

  group("Home Screen", () {
    testWidgets("has appBar with image",
        (WidgetTester tester) async {
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) {
              return HomeProvider();
            },
          ),
        ],
        child: MaterialApp(
          title: 'Home Credit Flutter Task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: BaseColor.primary,
          ),
          home: HomeScreen(
            isTest: true,
          ),
        ),
      ));

      final appBar = find.byKey(ValueKey("appBar"));
      final logo = find.byKey(ValueKey("logo"));

      expect(appBar, findsOneWidget);
      expect(logo, findsOneWidget);
    });

    testWidgets("on loading state", (WidgetTester tester) async {
      var provider = HomeProvider(state: HomeState.onLoading);
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) {
              return provider;
            },
          ),
        ],
        child: MaterialApp(
          title: 'Home Credit Flutter Task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: BaseColor.primary,
          ),
          home: HomeScreen(
            isTest: true,
          ),
        ),
      ));
      final contentView = find.byKey(ValueKey("contentView"));
      expect(contentView, findsOneWidget);
    });

    testWidgets("on no internet state",
        (WidgetTester tester) async {
      var provider = HomeProvider(state: HomeState.onNoInternet);

      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) {
              return provider;
            },
          ),
        ],
        child: MaterialApp(
          title: 'Home Credit Flutter Task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: BaseColor.primary,
          ),
          home: HomeScreen(
            isTest: true,
          ),
        ),
      ));

      final noInetView = find.byKey(ValueKey("noInetView"));

      expect(noInetView, findsOneWidget);
    });

    testWidgets("on error state",
        (WidgetTester tester) async {
      var provider = HomeProvider(
          state: HomeState.onError, errMessage: "Dummy Error Message");

      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) {
              return provider;
            },
          ),
        ],
        child: MaterialApp(
          title: 'Home Credit Flutter Task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: BaseColor.primary,
          ),
          home: HomeScreen(
            isTest: true,
          ),
        ),
      ));

      final errorView = find.byKey(ValueKey("errorView"));

      expect(errorView, findsOneWidget);
    });
  });
}
