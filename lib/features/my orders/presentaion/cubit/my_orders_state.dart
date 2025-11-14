part of 'my_orders_cubit.dart';

@immutable
sealed class MyOrdersState {}

final class MyOrdersInitial extends MyOrdersState {}
final class MyOrdersLoading extends MyOrdersState {}
final class MyOrdersFailure extends MyOrdersState {
  final String errMessage;

  MyOrdersFailure({required this.errMessage});
}
final class MyOrdersSuccess extends MyOrdersState {
  final List<MyOrderEntity> myOrders;

  MyOrdersSuccess({required this.myOrders});
}
