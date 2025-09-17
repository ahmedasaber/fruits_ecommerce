import 'package:bloc/bloc.dart';
import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/cart_entity.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);
  void addProduct(ProductEntity productEntity){
    bool productIsExist = cartEntity.isExist(productEntity);
    CartItemEntity cartItemEntity = cartEntity.getCartItem(productEntity);
    if(productIsExist){
      cartItemEntity.increaseCount();
      emit(CartItemIncrease());
    }else{
      cartEntity.addCartItem(cartItemEntity);
      emit(CartItemAdded());
    }
  }

  void decreaseItems(ProductEntity productEntity){
    bool productIsExist = cartEntity.isExist(productEntity);
    CartItemEntity cartItemEntity = cartEntity.getCartItem(productEntity);
    if(productIsExist){
      cartItemEntity.decreaseCount();
      emit(CartIteDecrease());
    }
  }
  void deleteCartItem(CartItemEntity cartItem){
    cartEntity.deleteCartItem(cartItem);
    emit(CartItemRemoved());
  }
}
