import 'package:flutter/material.dart';
import '../models/product.dart';

class PaymentScreen extends StatefulWidget {
  final Product product;
  final int quantity;

  const PaymentScreen({super.key, required this.product, required this.quantity});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int quantity = 1;
  String selectedPaymentMethod = "Credit Card";

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  double get totalPrice => widget.product.price * quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50], // Light teal background
      appBar: AppBar(
        title: const Text("Payment", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.teal[700],
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Summary
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(widget.product.image, width: 80, height: 80, fit: BoxFit.cover),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.product.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text("\$${widget.product.price.toStringAsFixed(2)}",
                              style: const TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Quantity Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Quantity:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.teal),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                    Text(quantity.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Colors.teal),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Payment Method Selection
            const Text("Select Payment Method:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
            Column(
              children: ["Credit Card", "PayPal", "Apple Pay"].map((method) {
                return RadioListTile(
                  activeColor: Colors.teal,
                  title: Text(method, style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                  value: method,
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                );
              }).toList(),
            ),

            const Spacer(),

            // Total Price & Checkout Button
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal[100], // Teal checkout section
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.teal[300]!, blurRadius: 8)],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Price:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal)),
                      Text("\$${totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Payment successful via $selectedPaymentMethod!"),
                          backgroundColor: Colors.teal[700],
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[600],
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("Complete Payment",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
