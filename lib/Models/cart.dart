import 'package:e_commerce/Data/data_product.dart';

class CartItem {
  final Productdetails product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}