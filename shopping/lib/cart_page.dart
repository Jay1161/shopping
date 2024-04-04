import 'package:flutter/material.dart';
import 'main.dart';
import 'package:shopping/order_summary_bottom_sheet.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _removeItem(Product product) {
    setState(() {
      widget.cartItems.remove(product);
    });
  }

  void _updateQuantity(Product product, int quantity) {
    setState(() {
      product.quantity = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final product = widget.cartItems[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\u20b9 ${product.price}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Quantity ${product.quantity}'),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _removeItem(product),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return OrderSummaryBottomSheet(cartItems: widget.cartItems);
            },
          );
        },
        label: Text('Place Order'),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }
}
