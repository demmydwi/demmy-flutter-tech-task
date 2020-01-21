import 'package:flutter/material.dart';
import 'package:home_credit_flutter_task/model/item_model.dart';
import 'package:home_credit_flutter_task/util/dialog.dart';
import 'package:home_credit_flutter_task/util/shimmer_view.dart';
import 'package:home_credit_flutter_task/util/url_launchers.dart';

class ArticleItem extends StatelessWidget {
  final ItemModel itemModel;

  ArticleItem({this.itemModel});

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
      child: Card(
        elevation: 2,
        color: Colors.white,
        margin: const EdgeInsets.only(top: 4, left: 2, right: 2, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            itemModel == null
                ? ShimmerView(
                    h: 135,
                  )
                : Image.network(
                    itemModel.articleImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 135,
                  ),
            Container(
              margin: EdgeInsets.all(16),
              child: itemModel == null
                  ? ShimmerView(
                      h: 20,
                    )
                  : Text(
                      itemModel.articleTitle,
                      style: Theme.of(context).textTheme.body2,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
