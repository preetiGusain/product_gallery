import 'package:flutter/material.dart';
import 'package:product_gallery/features/products/models/products_ui_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductsUiModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.image,
                  height: 250,
                  width: 250,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Title
            Text(
              product.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 10),

            const SizedBox(height: 12),

            // Category
            Row(
              children: [
                const Text(
                  "Category: ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Chip(
                  label: Text(
                    product.category.name.replaceAll('_', ' ').toUpperCase(),
                  ),
                  backgroundColor: Colors.blue.shade50,
                ),
              ],
            ),

            // Price
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Rating
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 20),
                const SizedBox(width: 4),
                Text(
                  product.rating.rate.toString(),
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(width: 6),
                Text(
                  '(${product.rating.count} reviews)',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Description
            const Text(
              "Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
