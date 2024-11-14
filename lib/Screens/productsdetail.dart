import 'package:e_commerce/Screens/cartscreen.dart';
import 'package:flutter/material.dart';// Assuming you're using a badge package
// import 'package:e_commerce/Screens/homepage.dart';
import 'package:e_commerce/Data/data_product.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/Provider/provider.dart';
// import 'package:e_commerce/Screens/cartscreen.dart'; // Import Productdetails model

class Productsdetail extends StatefulWidget {
  final Productdetails product;

  // Constructor to accept the product details
  Productsdetail({required this.product});

  @override
  _ProductsdetailState createState() => _ProductsdetailState();
}

class _ProductsdetailState extends State<Productsdetail> {
  int itemcount = 0; // Initial cart item count

  // Function to increment the cart count when "Add to Cart" is pressed
void addToCart() {
 final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(widget.product); // Add product to cart
    setState(() {
      itemcount++;
    });
}


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Product Details',
              style: TextStyle(fontFamily: 'poppinssemibold'),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
              },
              icon: Badge(
                isLabelVisible: true,
                label: Text('$itemcount'), // Display the cart count
                offset: const Offset(4, -8),
                backgroundColor: Colors.red,
                child: const Icon(
                  Icons.shopping_cart,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.product.imageurl,
                  height: 200,
                  // errorBuilder: (context, error, stackTrace) =>
                  //     Icon(Icons.image_not_supported), // Handle image loading error
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppinsmedium'),
                  ),
                  IconButton(onPressed: (
                    
                  ){
                    ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Product Added to Wishlist")),
        );
                  },
                   style: IconButton.styleFrom(
                        backgroundColor: const Color(0xffF1F1F1),
              
                      ), icon: Icon(Icons.favorite_outline_sharp))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.price,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'poppinssemibold'),
                  ),
                  Text("(219 people bought this)",style: TextStyle(fontFamily: 'poppinsmedium'),)
                ],
              ),
              SizedBox(height: size.height*0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Choose Color",style: TextStyle(fontFamily: 'poppinssemibold',fontSize: 14,color: Colors.grey),),
                  SizedBox(height: size.height*0.01,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                            height: size.height*0.07,
                            width: size.width*0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: const Color.fromARGB(255, 251, 244, 187)
                            ),
                           
                            ),
                            Container(
                            height: size.height*0.07,
                            width: size.width*0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: const Color.fromARGB(255, 251, 195, 213)
                            ),
                           
                            ),
                            Container(
                            height: size.height*0.07,
                            width: size.width*0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: const Color.fromARGB(255, 239, 195, 247)
                            ),
                           
                            ),
                            Container(
                            height: size.height*0.07,
                            width: size.width*0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: const Color.fromARGB(255, 208, 233, 254)
                            ),
                           
                            ),
                            
                     ],
                   ),
                  
                ],
              ),
              Divider(height: size.height*0.017,),
              ListTile(
                leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.product.brandlogo),
                ),
                title: Text(widget.product.brandname,style: TextStyle(fontFamily: 'poppinsbold')),
                subtitle: Text("Online 12mins ago",style: TextStyle(fontFamily: 'poppinslight',fontSize: 12)),
                trailing: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1
                    )
                  ),
                  child: TextButton(onPressed: (){},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      
                    )
                  ), child: Text("FOLLOW",style: TextStyle(fontFamily: 'poppinsbold',color: Colors.black))),
                )
              ),
              Divider(height: size.height*0.017,),


              Text(
                widget.product.description,
                style: TextStyle(fontSize: 15, fontFamily: 'poppinslight'),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  // Add to Cart Button
                  Expanded(
                    child: GestureDetector(
                      onTap: addToCart,
                      
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Buy Now Button
                  Expanded(
                    child: GestureDetector(
                      onTap:  addToCart,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 173, 173, 173),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                 
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
