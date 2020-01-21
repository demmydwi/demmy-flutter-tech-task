import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_credit_flutter_task/provider/home_provider.dart';
import 'package:home_credit_flutter_task/util/no_inet_view.dart';
import 'package:home_credit_flutter_task/view/article/article_section.dart';
import 'package:home_credit_flutter_task/view/product/product_section.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  final bool isTest;

  HomeScreen({this.isTest = false});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!widget.isTest) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getContent();
      });
    }
  }

  void getContent() {
    Provider.of<HomeProvider>(context, listen: false).getContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: ValueKey("appBar"),
        title: SvgPicture.asset(
          "asset/hc_red.svg",
          key: ValueKey("logo"),
          height: 48,
          fit: BoxFit.fitHeight,
        ),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: contentByState(),
      ),
    );
  }

  Widget contentByState() {
    return Consumer<HomeProvider>(builder: (_context, _provider, _child) {
      Widget widgetReturn = Container();
      switch (_provider.state) {
        case HomeState.onError:
          widgetReturn = Container(
            key: ValueKey("errorView"),
            child: ErrorView(
              desc: _provider.errMessage,
              onTap: () {
                _provider.getContent();
              },
            ),
          );
          break;
        case HomeState.onNoInternet:
          widgetReturn = Container(
            key: ValueKey("noInetView"),
            child: NoInternetView(
              onTap: () {
                _provider.getContent();
              },
            ),
          );
          break;
        default:
          widgetReturn = ListView(
            key: ValueKey("contentView"),
            children: <Widget>[ProductSection(), ArticleSections()],
          );
          break;
      }
      return widgetReturn;
    });
  }
}
