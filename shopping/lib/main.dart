import 'package:flutter/material.dart';
import 'package:shopping/order_summary_bottom_sheet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> _products = [
    Product(
        id: 1,
        name: 'Spring Rolls',
        price: 200,
        imageUrl: 'assets/item1.jpg'),
    Product(
        id: 2,
        name: 'Pasta',
        price: 100,
        imageUrl: 'assets/item2.jpg'),
    Product(
        id: 3,
        name: 'Strawberry',
        price: 110,
        imageUrl: 'assets/item3.jpg'),
  ];

  List<Product> _cartItems = [];

  void _addToCart(Product product) {
    setState(() {
      final existingProductIndex =
      _cartItems.indexWhere((item) => item.id == product.id);
      if (existingProductIndex != -1) {
        _cartItems[existingProductIndex].quantity++;
      } else {
        _cartItems.add(product.copyWith(quantity: 1));
      }
    });
  }

  void _incrementProductQuantity(Product product) {
    setState(() {
      product.quantity++;
    });
  }

  void _decrementProductQuantity(Product product) {
    setState(() {
      if (product.quantity > 1) {
        product.quantity--;
      }
    });
  }

  void _updateProductQuantityInCart(Product product, int quantity) {
    setState(() {
      product.quantity = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: _products[index],
            onAddToCart: _addToCart,
            onIncrement: _incrementProductQuantity,
            onDecrement: _decrementProductQuantity,
            onUpdateQuantity: _updateProductQuantityInCart,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(cartItems: _cartItems),
            ),
          );
        },
        label: Text('View Cart (${_cartItems.length})'),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  Product copyWith({int? quantity}) {
    return Product(
      id: this.id,
      name: this.name,
      price: this.price,
      imageUrl: this.imageUrl,
      quantity: quantity ?? this.quantity,
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final Function(Product) onAddToCart;
  final Function(Product) onIncrement;
  final Function(Product) onDecrement;
  final Function(Product, int) onUpdateQuantity;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onAddToCart,
    required this.onIncrement,
    required this.onDecrement,
    required this.onUpdateQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imageUrl,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(
              product.name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "\u20b9" + '${product.price}',
              style: TextStyle(fontSize: 16.0, color: Colors.blue),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => onDecrement(product),
                ),
                Text(
                  '${product.quantity}',
                  style: TextStyle(fontSize: 16.0),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => onIncrement(product),
                ),
                ElevatedButton(
                  onPressed: () => onAddToCart(product),
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
