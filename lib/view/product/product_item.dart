import 'package:flutter/material.dart';
import 'package:home_credit_flutter_task/model/item_model.dart';
import 'package:home_credit_flutter_task/util/dialog.dart';
import 'package:home_credit_flutter_task/util/shimmer_view.dart';
import 'package:home_credit_flutter_task/util/url_launchers.dart';

class ProductItem extends StatelessWidget {
  final ItemModel itemModel;

  ProductItem({this.itemModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: itemModel == null
          ? null
          : () {
              try {
                launchURL(url: itemModel.link);
              } catch (err) {
                showDialogue(
                    context: context, title: "Sorry", desc: err.toString());
              }
            },
      child: Container(
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            itemModel == null
                ? ShimmerView(
                    h: 40,
                    w: 40,
                  )
                : Image.network(
                    itemModel.productImage,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
            Padding(padding: const EdgeInsets.only(top: 12)),
            itemModel == null
                ? ShimmerView(
                    h: 20,
                    w: 60,
                  )
                : Text(
                    itemModel.productName,
                    style: Theme.of(context).textTheme.body1,
                    textAlign: TextAlign.center,
                  )
          ],
        ),
      ),
    );
  }
}
