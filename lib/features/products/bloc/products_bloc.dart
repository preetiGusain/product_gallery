import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:product_gallery/features/products/models/products_ui_model.dart';

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
    List<ProductsUiModel> products = [];
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
      // Print the raw response to debug
      print("Response body: ${response.body}");

      List result = jsonDecode(response.body);
      // Print the decoded result
      print("Decoded JSON: $result");
      for (int i = 0; i < result.length; i++) {
        ProductsUiModel product = ProductsUiModel.fromJson(
          result[i] as Map<String, dynamic>,
        );
        // Print each product to debug
        print("Parsed product: $product");

        products.add(product);
      }
      print("Products: $products");
      print(response.body);
      emit(ProductsFetchingSuccessfulState(products: products));
    } catch (e) {
      emit(ProductFetchingErrorState());
      log(e.toString());
      print("Error: $e");
    }
  }
}
