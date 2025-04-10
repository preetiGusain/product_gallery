part of 'products_bloc.dart';

@immutable
//builders
abstract class ProductsState {}

//listeners
abstract class ProductsActionState extends ProductsState{}

class ProductsInitial extends ProductsState {}

class ProductFetchingLoadingState extends ProductsState {}
class ProductFetchingErrorState extends ProductsState {}
class ProductsFetchingSuccessfulState extends ProductsState {
  final List<ProductsUiModel> products;
  ProductsFetchingSuccessfulState({required this.products});
}
