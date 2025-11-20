import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:fruits_ecommerce/core/entities/review_entity.dart';

class ProductEntity extends Equatable{
  final String name;
  final String code;
  final String description;
  final num price;
  final File? image;
  final bool isFeatured;
  bool isFav;
  String? imageUrl;
  final int expirationsMonth;
  final bool isOrganic;
  final int numOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingCount = 0;
  final List<ReviewEntity> reviews;
  final num sellingCount;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.isFav,
    this.imageUrl,
    required this.expirationsMonth,
    required this.avgRating,
    this.isOrganic = false,
    required this.numOfCalories,
    required this.unitAmount,
    required this.reviews,
    required this.sellingCount,
  });

  @override
  List<Object?> get props => [code];
}
