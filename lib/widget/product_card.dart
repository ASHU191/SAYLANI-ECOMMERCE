import 'package:e_commerce/Data/data_product.dart';
import 'package:e_commerce/Provider/provider.dart';
import 'package:e_commerce/Screens/productsdetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Productdetails product;
  final Function(Productdetails) onAddToCart;

  const ProductCard(
      {super.key, required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Productsdetail(product: product)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(product.imageurl), fit: BoxFit.contain),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 10),
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'poppinsbold'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  product.price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'poppinssemibold'
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addItem(product);

                    onAddToCart(product); // Add product to cart when tapped
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 10),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color:  Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Add to cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'poppinsbold'
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
