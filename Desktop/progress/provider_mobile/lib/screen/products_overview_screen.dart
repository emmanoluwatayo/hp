import 'package:flutter/material.dart';

enum FilterOption {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyShop"),
        actions: [
          PopupMenuButton(
            onSelected: ((value) {
              setState(() {
                if (value == FilterOption.favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            }),
            icon: const Icon(Icons.more_vert),
            itemBuilder: ((context) => [
                  const PopupMenuItem(
                    value: FilterOption.favorites,
                    child: Text("Only Favorite"),
                  )
                ]),
          ),
          const PopupMenuItem(
            value: FilterOption.all,
            child: Text("Show All"),
          ),
        ],
      ),
      Consumer<Cart>
    );
  }
}
