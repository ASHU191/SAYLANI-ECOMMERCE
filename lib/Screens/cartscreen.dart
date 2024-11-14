import 'package:e_commerce/Models/cart.dart';
import 'package:e_commerce/Provider/provider.dart';
import 'package:e_commerce/Screens/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get totalPrice => context.read<CartProvider>().items.fold(
        0,
        (sum, item) =>
            sum + (double.parse(item.product.price.substring(1)) * item.quantity),
      );

  // For dropdown selection
  String? _selectedDeliveryOption = "Standard Shipping"; // Example option
  String? _selectedDiscountCode = "No Discount"; // Example option
  bool _isDeliveryOptionVisible = false; // To toggle the visibility of the delivery options
  double _deliveryCost = 0.0; // To store the cost of the selected delivery option

  // Calculate the updated total price after considering discounts and delivery cost
  double get updatedTotalPrice {
    double discount = 0.0;
    if (_selectedDiscountCode == "10% Off") {
      discount = 0.10 * totalPrice;
    } else if (_selectedDiscountCode == "20% Off") {
      discount = 0.20 * totalPrice;
    } else if (_selectedDiscountCode == "Free Shipping") {
      _deliveryCost = 0.0;
    }
    return totalPrice + _deliveryCost - discount; // Adjusting for discount
  }

  // Function to increase item quantity
  void _increaseQuantity(CartItem item) {
    setState(() {
      item.quantity++;
    });
  }

  // Function to decrease item quantity
  void _decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      setState(() {
        item.quantity--;
      });
    }
  }

  // Function to remove item from cart
  void _removeItem(CartItem item) {
    setState(() {
      context.read<CartProvider>().removeItem(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Checkout", style: TextStyle(fontFamily: 'poppinsbold', fontSize: 20, color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                    if (cartProvider.items.isNotEmpty) {
                      return Positioned(
                        right: -3,
                        top: -2,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${cartProvider.items.length}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // Delivery Address Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Delivery to", style: TextStyle(fontFamily: 'poppinssemibold', fontSize: 14)),
                Text("Karachi, Sindh, Pakistan", style: TextStyle(fontFamily: 'poppinssemibold', fontSize: 14)),
              ],
            ),
            const SizedBox(height: 10),

            // Cart Items List
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.items.length,
                itemBuilder: (context, index) {
                  final cartItem = cartProvider.items[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          cartItem.product.imageurl,
                          width: 60,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(cartItem.product.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(fontFamily: 'poppinssemibold', fontSize: 14)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItem.product.price,
                              style: const TextStyle(fontFamily: 'poppinslight', fontSize: 12)),
                        ],
                      ),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.grey),
                            onPressed: () {
                              _increaseQuantity(cartItem);
                            },
                          ),
                          Text(cartItem.quantity.toString(),
                              style: const TextStyle(fontFamily: 'poppinsbold', fontSize: 14)),
                          IconButton(
                            icon: const Icon(Icons.remove, color: Colors.grey),
                            onPressed: () {
                              _decreaseQuantity(cartItem);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _removeItem(cartItem);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Order Summary
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Order Summary", style: TextStyle(fontFamily: 'poppinsmedium', fontSize: 16)),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isDeliveryOptionVisible = !_isDeliveryOptionVisible;
                          });
                        },
                        icon: const Icon(Icons.arrow_drop_up_outlined, color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total price (${cartProvider.items.length} items)",
                          style: const TextStyle(fontFamily: 'poppinssemibold', fontSize: 14)),
                      Text("\$${updatedTotalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(fontFamily: 'poppinssemibold', fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Option (${_selectedDeliveryOption})",
                          style: const TextStyle(fontFamily: 'poppinssemibold', fontSize: 14)),
                      Text("\$${_deliveryCost.toStringAsFixed(2)}",
                          style: const TextStyle(fontFamily: 'poppinssemibold', fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total", style: TextStyle(fontFamily: 'poppinssemibold', fontSize: 14)),
                      Text("\$${(updatedTotalPrice + _deliveryCost).toStringAsFixed(2)}",
                          style: const TextStyle(fontFamily: 'poppinssemibold', fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 55),
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(totalPrice: updatedTotalPrice + _deliveryCost),
                        ),
                      );
                    },
                    child: const Text("Proceed to Payment",
                        style: TextStyle(fontFamily: 'poppinssemibold', fontSize: 14, color: Colors.white)),
                  ),
                ],
              ),
            ),
            // Delivery Options Popup
            _isDeliveryOptionVisible
                ? Container(
                    height: size.height * 0.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16.0)),
                      border: Border.all(width: 1, color: Colors.grey),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20.0, bottom: 20),
                            child: Text("Select The Delivery", style: TextStyle(fontFamily: 'poppinssemibold', fontSize: 16)),
                          ),
                          ListTile(
                            title: const Text("Standard", style: TextStyle(fontFamily: 'poppinsmedium')),
                            trailing: const Text("\$8.00", style: TextStyle(fontFamily: 'poppinssemibold')),
                            subtitle: const Text("1 - 3 days delivery", style: TextStyle(fontFamily: 'poppinssemibold')),
                            onTap: () {
                              setState(() {
                                _selectedDeliveryOption = "Standard Shipping";
                                _deliveryCost = 8.00;
                              });
                            },
                            tileColor: _selectedDeliveryOption == "Standard Shipping" ? Colors.green[100] : null,
                          ),
                          ListTile(
                            title: const Text("Express", style: TextStyle(fontFamily: 'poppinsmedium')),
                            trailing: const Text("\$15.00", style: TextStyle(fontFamily: 'poppinssemibold')),
                            subtitle: const Text("1 - 2 days delivery", style: TextStyle(fontFamily: 'poppinssemibold')),
                            onTap: () {
                              setState(() {
                                _selectedDeliveryOption = "Express Shipping";
                                _deliveryCost = 15.00;
                              });
                            },
                            tileColor: _selectedDeliveryOption == "Express Shipping" ? Colors.green[100] : null,
                          ),
                          ListTile(
                            title: const Text("Free", style: TextStyle(fontFamily: 'poppinsmedium')),
                            trailing: const Text("\$0.00", style: TextStyle(fontFamily: 'poppinssemibold')),
                            subtitle: const Text("Free delivery (5+ days)", style: TextStyle(fontFamily: 'poppinssemibold')),
                            onTap: () {
                              setState(() {
                                _selectedDeliveryOption = "Free Shipping";
                                _deliveryCost = 0.00;
                              });
                            },
                            tileColor: _selectedDeliveryOption == "Free Shipping" ? Colors.green[100] : null,
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
