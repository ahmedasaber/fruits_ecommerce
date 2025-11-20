import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/core/entities/review_entity.dart';
import 'package:fruits_ecommerce/core/helper_function/get_avg_rating.dart';
import 'package:fruits_ecommerce/core/models/review_model.dart';

class ProductModel extends ProductEntity {

  ProductModel({
    required super.name,
    required super.code,
    required super.description,
    required super.price,
    required super.image,
    required super.isFeatured,
    required super.isFav,
    required super.imageUrl,
    required super.expirationsMonth,
    required super.numOfCalories,
    required super.unitAmount,
    required super.isOrganic,
    required super.reviews,
    required super.avgRating,
    required super.sellingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData){
    return ProductModel(
        name: jsonData['name'],
        code: jsonData['code'],
        description: jsonData['description'],
        price: jsonData['price'],
        image: jsonData['image'],
        avgRating: getAvgRating(
            toReviewModels(jsonData['reviews'])
        ),
        isFeatured: jsonData['isFeatured'],
        isFav: jsonData['isFav'],
        imageUrl: jsonData['imageUrl'] ?? 'https://www.svgrepo.com/show/508699/landscape-placeholder.svg',
        expirationsMonth: jsonData['expirationsMonth'],
        numOfCalories: jsonData['numOfCalories'],
        unitAmount: jsonData['unitAmount'],
        isOrganic: jsonData['isOrganic'],
        reviews: toReviewModels(jsonData['reviews']),
        sellingCount: jsonData['sellingCount']
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      image: entity.image,
      isFeatured: entity.isFeatured,
      isFav: entity.isFav,
      imageUrl: entity.imageUrl,
      expirationsMonth: entity.expirationsMonth,
      numOfCalories: entity.numOfCalories,
      unitAmount: entity.unitAmount,
      isOrganic: entity.isOrganic,
      reviews: entity.reviews,
      avgRating: entity.avgRating,
      sellingCount: entity.sellingCount,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      image: image,
      isFeatured: isFeatured,
      isFav: isFav,
      imageUrl: imageUrl,
      expirationsMonth: expirationsMonth,
      numOfCalories: numOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      reviews: reviews,
      avgRating: avgRating,
      sellingCount: sellingCount,
    );
  }

  toMap() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'isFav': isFav,
      'imageUrl': imageUrl,
      'expirationsMonth': expirationsMonth,
      'isOrganic': isOrganic,
      'numOfCalories': numOfCalories,
      'unitAmount': unitAmount,
      'reviews': reviews.map((e) => ReviewModel.fromEntity(e).toMap()).toList(),
      'avgRating': avgRating,
      'sellingCount': sellingCount,
    };
  }
}

List<ReviewEntity> toReviewModels(List<dynamic>? jsonData) {
  return jsonData != null
    ? (jsonData)
    .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>) as ReviewEntity,).toList()
    : <ReviewEntity>[];
}