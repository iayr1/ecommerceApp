import 'package:flutter/material.dart';
import 'razorpay_service.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  final RazorpayService razorpayService = RazorpayService();

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['title'])),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product['image']),
            SizedBox(height: 10),
            Text(
              product['title'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('\$${product['price']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
            SizedBox(height: 10),
            Text(product['description']),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                razorpayService.openCheckout(product['price']);
              },
              child: Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
