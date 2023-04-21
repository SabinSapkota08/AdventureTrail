import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductSearchScreen extends StatefulWidget {
  final List<Product> products;

  ProductSearchScreen(this.products);

  @override
  _ProductSearchScreenState createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
  }

  void _filterProducts(String query) {
    List<Product> filteredList = [];
    widget.products.forEach((product) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        filteredList.add(product);
      }
    });
    setState(() {
      filteredProducts = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) => _filterProducts(value),
          decoration: InputDecoration(
            hintText: 'Search for products',
            border: InputBorder.none,
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: filteredProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  // TODO: navigate to product detail screen
                },
                child: Image.network(
                  filteredProducts[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  filteredProducts[index].name,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  '\$${filteredProducts[index].price.toStringAsFixed(2)}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
