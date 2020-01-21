class ItemModel {
  String articleTitle;
  String articleImage;
  String link;
  String productName;
  String productImage;

  ItemModel(
      {this.articleTitle,
      this.articleImage,
      this.link,
      this.productName,
      this.productImage});

  ItemModel.fromJson(Map<String, dynamic> json) {
    articleTitle = json['article_title'];
    articleImage = json['article_image'];
    link = json['link'];
    productName = json['product_name'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_title'] = this.articleTitle;
    data['article_image'] = this.articleImage;
    data['link'] = this.link;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    return data;
  }
}
