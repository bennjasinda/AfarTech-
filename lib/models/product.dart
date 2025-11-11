import 'category.dart';
import 'comment.dart';

class Product {
  final int? id;
  final String? productTitle;
  final double? price;
  final double? originalPrice;
  final Category? category;
  final String? description;
  final List<String>? album;
  final List<int>? similarProductsIds;
  final List<Comment>? comments;
  final String? status;
  final bool? available;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? inPromotion;
  final int? promotion;
  final int? quantity;
  final double? rating;
  final int? reviewsCount;

  Product({
    this.id,
    this.productTitle,
    this.price,
    this.originalPrice,
    this.category,
    this.description,
    this.album,
    this.similarProductsIds,
    this.comments,
    this.status,
    this.available,
    this.createdAt,
    this.updatedAt,
    this.inPromotion,
    this.promotion,
    this.quantity,
    this.rating,
    this.reviewsCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      productTitle: json['productTitle'],
      price: json['price'] != null ? json['price'].toDouble() : null,
      originalPrice: json['originalPrice'] != null ? json['originalPrice'].toDouble() : null,
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      description: json['description'],
      album: (json['album'] as List?)?.map((e) => e.toString()).toList(),
      similarProductsIds: (json['similarProductsIds'] as List?)?.map((e) => e as int).toList(),
      comments: (json['comments'] as List?)
          ?.map((e) => Comment.fromJson(e))
          .toList(),
      status: json['status'],
      available: json['available'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      inPromotion: json['inPromotion'],
      promotion: json['promotion'],
      quantity: json['quantity'],
      rating: json['rating'] != null ? json['rating'].toDouble() : null,
      reviewsCount: json['reviewsCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productTitle': productTitle,
      'price': price,
      'originalPrice': originalPrice,
      'category': category?.toJson(),
      'description': description,
      'album': album,
      'similarProductsIds': similarProductsIds,
      'comments': comments?.map((e) => e.toJson()).toList(),
      'status': status,
      'available': available,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'inPromotion': inPromotion,
      'promotion': promotion,
      'quantity': quantity,
      'rating': rating,
      'reviewsCount': reviewsCount,
    };
  }
}