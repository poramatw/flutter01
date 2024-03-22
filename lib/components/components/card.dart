import 'package:flutter/material.dart';
import 'package:practice01/models/cart_models.dart';

class FoodCard extends StatelessWidget {
  // create variables
  final Product product;
  final Function()? _onPressed;

  const  FoodCard(this.product, this._onPressed,{super.key });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.title),
        subtitle: Text('Price: \$${product.price}'),
        trailing: IconButton(
          icon: const Icon(Icons.add),
          onPressed: _onPressed,
        ),
      ),
    );
  }
}
