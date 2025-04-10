import 'dart:convert';

import 'package:product_gallery/features/products/models/products_ui_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  static Future<List<ProductsUiModel>> fetchProduct() async {
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
      return products;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
