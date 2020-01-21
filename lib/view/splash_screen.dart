import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_credit_flutter_task/util/colors.dart';
import 'package:home_credit_flutter_task/view/home_screen.dart';

class SplashScreen extends StatefulWidget {

  final bool forcePush; // disable push for testing purpose

  SplashScreen({this.forcePush = true});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.forcePush) {
      Future.delayed(Duration(seconds: 2)).then((_) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor.primary,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: BaseColor.primary,
      ),
      body: Center(
        child: Container(
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 8),
          child: SvgPicture.asset(
            "asset/hc_red.svg",
            key: ValueKey("logo"),
            width: MediaQuery.of(context).size.width / 2,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
