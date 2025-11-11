class Category {
  final int? id;
  final String? categoryName;
  final int? productsUnder;
  final List<int>? productsId;

  Category({
    this.id,
    this.categoryName,
    this.productsUnder,
    this.productsId,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      categoryName: json['categoryName'],
      productsUnder: json['productsUnder'],
      productsId: (json['productsId'] as List?)?.map((e) => e as int).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryName': categoryName,
      'productsUnder': productsUnder,
      'productsId': productsId,
    };
  }
}