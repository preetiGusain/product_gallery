import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_gallery/features/products/models/products_ui_model.dart';
import 'package:product_gallery/features/products/repos/product_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsInitialFetchEvent>(productsInitialFetchEvent);
  }

  FutureOr<void> productsInitialFetchEvent(
    ProductsInitialFetchEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductFetchingLoadingState());
    List<ProductsUiModel> products = await ProductRepo.fetchProduct();
    emit(ProductsFetchingSuccessfulState(products: products));
  }
}
