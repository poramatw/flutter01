import 'package:flutter/material.dart';
import 'package:practice01/components/components/card.dart';
import 'package:practice01/provider/provider_service.dart';
import 'package:provider/provider.dart';

import '../../models/cart_models.dart';

class Notice extends StatelessWidget {
  Notice({super.key});

  final List<Product> availableProducts = [
    Product(id: 1, title: 'Hamburger', price: 20.0),
    Product(id: 2, title: 'Ice water', price: 2.0),
    Product(id: 3, title: 'Sausage', price: 10.0),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar:
          AppBar(automaticallyImplyLeading: false, title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: availableProducts.length,
              itemBuilder: (context, index) => FoodCard(
                  availableProducts[index],
                  () => cart.addItem(availableProducts[index])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Price: \$${cart.totalPrice}'),
                ElevatedButton(onPressed: () {}, child: const Text('Checkout'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
