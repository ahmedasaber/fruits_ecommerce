import 'package:fruits_ecommerce/features/home/domain/entites/cart_item_entity.dart';

import 'items_entity.dart';

class ItemsListEntity {
  final List<ItemEntity> items;

  ItemsListEntity({required this.items});

  factory ItemsListEntity.fromEntity(List<CartItemEntity> list) {
    return ItemsListEntity(
      items: list.map((e) => ItemEntity.fromEntity(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'items': items.map((e) => e.toJson()).toList()};
  }
}
