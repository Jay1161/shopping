import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'main.dart';

class OrderSummaryBottomSheet extends StatefulWidget {
  final List<Product> cartItems;

  const OrderSummaryBottomSheet({Key? key, required this.cartItems}) : super(key: key);

  @override
  _OrderSummaryBottomSheetState createState() => _OrderSummaryBottomSheetState();
}

class _OrderSummaryBottomSheetState extends State<OrderSummaryBottomSheet> {
  String selectedPaymentMethod = 'Cash on Delivery (COD)';

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    widget.cartItems.forEach((product) {
      totalAmount += product.price * product.quantity;
    });

    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Order Summary',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final product = widget.cartItems[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(
                      'Price: \u20b9 ${product.price} - Quantity: ${product.quantity}'),
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Total Amount'),
            subtitle: Text('\u20b9 $totalAmount'),
          ),
          Divider(),
          ListTile(
            title: Text('Payment Method'),
            trailing: DropdownButton<String>(
              value: selectedPaymentMethod,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedPaymentMethod = newValue;
                  });
                }
              },
              items: [
                DropdownMenuItem(
                  value: 'Cash on Delivery (COD)',
                  child: Text('Cash on Delivery (COD)'),
                ),
                DropdownMenuItem(
                  value: 'Credit Card',
                  child: Text('Credit Card'),
                ),
              ],
            ),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () {
              _onConfirmOrder(context, totalAmount, selectedPaymentMethod);
            },
            child: Text('Confirm Order'),
          ),
        ],
      ),
    );
  }

  void _onConfirmOrder(BuildContext context, double totalAmount, String selectedPaymentMethod) {
    if (selectedPaymentMethod == 'Cash on Delivery (COD)') {
      _placeOrder(context, totalAmount, 'Cash on Delivery');
    } else if (selectedPaymentMethod == 'Credit Card') {
      _showCreditCardDetailsDialog(context, totalAmount);
    }
  }

  void _showCreditCardDetailsDialog(BuildContext context, double totalAmount) {
    TextEditingController cardNumberController = TextEditingController();
    TextEditingController cvvController = TextEditingController();
    TextEditingController expiryDateController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Credit Card Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: cardNumberController,
                decoration: InputDecoration(labelText: 'Card Number'),
              ),
              TextField(
                controller: cvvController,
                decoration: InputDecoration(labelText: 'CVV'),
              ),
              TextField(
                controller: expiryDateController,
                decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _processPayment(context, totalAmount, PaymentOption.CreditCard, cardNumberController.text, cvvController.text, expiryDateController.text);
              },
              child: Text('Confirm Payment'),
            ),
          ],
        );
      },
    );
  }

  void _processPayment(BuildContext context, double totalAmount, PaymentOption paymentOption, [String? cardNumber, String? cvv, String? expiryDate]) {
    if (paymentOption == PaymentOption.CreditCard) {
      StripePayment.setOptions(
        StripeOptions(
          publishableKey: 'pk_test_51P12yUSCWWG4FJX49jNTKJ8eSrSVXI6rEE4ZvZ1dAzWz4Gd3EYaKCef5uTTNpHQ3rhqmy9mogJuNQ0u4tkuw2N1200q8eZjzJs', // Replace with your publishable key
          merchantId: "Test",
          androidPayMode: 'test',
        ),
      );

      StripePayment.createTokenWithCard(
        CreditCard(
          number: cardNumber!,
          expMonth: int.parse(expiryDate!.split('/')[0]),
          expYear: int.parse(expiryDate.split('/')[1]),
          cvc: cvv!,
        ),
      ).then((token) {
        _placeOrder(context, totalAmount, 'Credit Card');
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error processing payment: $error'),
            duration: Duration(seconds: 15),
          ),
        );
      });
    }
  }

  void _placeOrder(BuildContext context, double totalAmount, String paymentMethod) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order Placed'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

enum PaymentOption {
  COD,
  CreditCard,
}


