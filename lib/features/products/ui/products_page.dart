import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_gallery/features/products/bloc/products_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  //Creating simple class instance of our Bloc
  final ProductsBloc productsBloc = ProductsBloc();

  @override
  void initState() {
    // Adding the inital products fetch event
    productsBloc.add(ProductsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products Page')),
      body: BlocConsumer<ProductsBloc, ProductsState>(
        bloc: productsBloc,
        listenWhen: (previous, current) => current is ProductsActionState,
        buildWhen: (previous, current) => current is! ProductsActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ProductsFetchingSuccessfulState:
              final successState = state as ProductsFetchingSuccessfulState;
              return ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [Text(successState.products[index].title)],
                    ),
                  );
                },
              );
            default:
              return const SizedBox();
          }
          ;
        },
      ),
    );
  }
}
