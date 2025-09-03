import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/core/models/review_model.dart';

class ProductModel extends ProductEntity {
  final num sellingCount;

  ProductModel({
    required super.name,
    required super.code,
    required super.description,
    required super.price,
    required super.image,
    required super.isFeatured,
    required super.imageUrl,
    required super.expirationsMonth,
    required super.numOfCalories,
    required super.unitAmount,
    required super.isOrganic,
    required super.reviews,
    required this.sellingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData){
    return ProductModel(
        name: jsonData['name'],
        code: jsonData['code'],
        description: jsonData['description'],
        price: jsonData['price'],
        image: jsonData['image'],
        isFeatured: jsonData['isFeatured'],
        imageUrl: jsonData['imageUrl'] ?? 'https://www.svgrepo.com/show/508699/landscape-placeholder.svg',
        expirationsMonth: jsonData['expirationsMonth'],
        numOfCalories: jsonData['numOfCalories'],
        unitAmount: jsonData['unitAmount'],
        isOrganic: jsonData['isOrganic'],
        reviews: jsonData['reviews'] != null
            ? List<ReviewModel>.of(jsonData['reviews'].map((e)=>ReviewModel.fromJson(e))).toList()
            : [],
        sellingCount: jsonData['sellingCount']
    );
  }

  // factory ProductModel.fromEntity(ProductEntity entity) {
  //   return ProductModel(
  //     name: entity.name,
  //     code: entity.code,
  //     description: entity.description,
  //     price: entity.price,
  //     image: entity.image,
  //     isFeatured: entity.isFeatured,
  //     imageUrl: entity.imageUrl,
  //     expirationsMonth: entity.expirationsMonth,
  //     numOfCalories: entity.numOfCalories,
  //     unitAmount: entity.unitAmount,
  //     isOrganic: entity.isOrganic,
  //     reviews: entity.reviews,
  //   );
  // }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      image: image,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expirationsMonth: expirationsMonth,
      numOfCalories: numOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      reviews: reviews,
    );
  }

  toMap() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonth': expirationsMonth,
      'isOrganic': isOrganic,
      'numOfCalories': numOfCalories,
      'unitAmount': unitAmount,
      'reviews': reviews.map((e) => e.toMap()).toList(),
    };
  }
}
