import 'package:flutter/material.dart';
import 'package:home_credit_flutter_task/model/section_model.dart';
import 'package:home_credit_flutter_task/provider/home_provider.dart';
import 'package:home_credit_flutter_task/view/article/article_item.dart';
import 'package:provider/provider.dart';

class ArticleSections extends StatelessWidget {
  SectionModel sectionModel;

  List<SectionModel> sectionModels;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_context, _provider, _child) {
        var responseApi = _provider.responseApi;
        if (responseApi != null) {
          this.sectionModel = responseApi.articleSections.first;
          this.sectionModels = responseApi.articleSections;
        }
        return buildContent();
      },
    );
  }

  Widget buildContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: sectionModel == null
            ? List.generate(
                3, (_) => ArticleItem(
                      itemModel: null,
                    ))
            : sectionModels.map((item) => ArticleSection(item)).toList(),
      ),
    );
  }
}

class ArticleSection extends StatelessWidget {
  SectionModel sectionModel;
  ArticleSection(this.sectionModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 16),
            child: Text(
              sectionModel.sectionTitle,
              style: Theme.of(context).textTheme.body2.copyWith(fontSize: 24),
            ),
          )
        ]..addAll(sectionModel.items
            .map((item) => ArticleItem(
                  itemModel: item,
                ))
            .toList()),
      ),
    );
  }
}
