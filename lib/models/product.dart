import 'package:flutter/material.dart';

class Product {
  final String name;
  final String image;
  final double price;
  final double rating;
  final List<Color> colors;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required List<String> colors,
  }) : colors = colors.map((color) => _hexToColor(color)).toList();

  // Convert hex string to Color
  static Color _hexToColor(String hex) {
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) {
      hex = "FF$hex"; // Add alpha channel if missing
    }
    return Color(int.parse(hex, radix: 16));
  }
}
