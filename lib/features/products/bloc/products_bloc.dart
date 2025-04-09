import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

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
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse('https://fakestoreapi.com/products'));
        print(response.body);
    } catch(e) {
      log(e.toString());
    }
  }
}
