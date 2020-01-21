import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home_credit_flutter_task/model/section_model.dart';
import 'package:home_credit_flutter_task/provider/home_provider.dart';
import 'package:home_credit_flutter_task/view/product/product_item.dart';
import 'package:provider/provider.dart';

class ProductSection extends StatelessWidget {
  SectionModel sectionModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (_context, _provider, _child) {
      var responseApi = _provider.responseApi;
      if (responseApi != null) {
        this.sectionModel = responseApi.productSections.first;
      }
      return buildContent(isLoading: sectionModel == null);
    });
  }

  Widget buildContent({bool isLoading}) {
    var length = isLoading ? 6 : sectionModel.items.length;
    var children = isLoading
        ? List.generate(
            length,
            (_) => ProductItem(
                  itemModel: null,
                ))
        : sectionModel.items
            .map((item) => ProductItem(
                  itemModel: item,
                ))
            .toList();
    var height = (length ~/ 3) * 100 + ((length ~/ 3) - 1) * 10 + 24.toDouble();
    return Card(
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          height: height,
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: children,
          ),
        ));
  }
}
