import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback onTap;

  final String title;
  final String desc;

  final String assetPath;

  ErrorView(
      {this.title = "Sorry",
      this.desc,
      this.onTap,
      this.assetPath = "asset/error.png"});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            assetPath,
            height: MediaQuery.of(context).size.width / 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Text(
              title,
              style: Theme.of(context).textTheme.body2,
              textAlign: TextAlign.center,
              textScaleFactor: 1.4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              desc,
              style: Theme.of(context).textTheme.body1,
              textAlign: TextAlign.center,
              textScaleFactor: 1.2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: MaterialButton(
              onPressed: onTap,
              child: Text(
                "Try Again",
                style: Theme.of(context)
                    .textTheme
                    .body2
                    .copyWith(color: Colors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NoInternetView extends StatelessWidget {
  final VoidCallback onTap;

  NoInternetView({this.onTap});

  @override
  Widget build(BuildContext context) {
    return ErrorView(
      title: "No Internet",
      desc: "Please check your internet connection",
      onTap: onTap,
      assetPath: "asset/no_internet.png",
    );
  }
}
