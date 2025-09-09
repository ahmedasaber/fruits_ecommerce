import 'package:fruits_ecommerce/core/entities/review_entity.dart';

num getAvgRating(List<ReviewEntity> reviews){
  if (reviews.isEmpty) return 0;

  num sum = 0.0;
  for(var review in reviews){
    sum+= review.rating;
  }
  return sum / reviews.length;
}