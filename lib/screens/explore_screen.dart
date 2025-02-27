import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../screens/product_details_screen.dart';
import '../widgets/search_screen.dart';

class ExploreScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Modern Chair",
      image: "assets/6868.jpg",
      price: 20,
      rating: 4.8,
      colors: ["#7B5E57", "#E0C097", "#000000"],
    ),
    Product(
      name: "Leather Sofa",
      image: "assets/sofa-table-standing-gray-rug.jpg",
      price: 35,
      rating: 4.8,
      colors: ["#7B5E57", "#E0C097", "#000000"],
    ),
    Product(
      name: "Luxury Couch",
      image: "assets/living-room-with-tidy-couches.jpg",
      price: 45,
      rating: 4.8,
      colors: ["#7B5E57", "#E0C097", "#000000"],
    ),
  ];

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: const Text("Explore"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: products[index]),
                ),
              );
            },
            child: ProductCard(product: products[index]), // ✅ FIXED: Now wraps ProductCard properly
          );
        },
      ),
    );
  }
}
