import 'package:e_commerce/Screens/cartscreen.dart';
// import 'package:e_commerce/Screens/productsdetail.dart';
// import 'package:e_commerce/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/Provider/provider.dart';
import 'package:e_commerce/Data/data_product.dart';
import 'package:e_commerce/widget/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// class Productdetails{
//   String imageurl;
//   String name;
// String price;
// String description;

// String brandname;
// String brandlogo;
// Productdetails({
//   required this.imageurl,
//     required this.name,
//     required this.price,
//     required this.description,
//     required this.brandname,
//     required this.brandlogo,
//   });
// }

class _HomeScreenState extends State<HomeScreen> {
  //   final List <Productdetails> products=[
  //   Productdetails(name: 'Monitor LG 22 inches QLED',price: '\$199.99', imageurl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcLetLJlUDT63JqYwRfX-UjFB7HpzQizzwqg&s',description: 'The LG 22-inch monitor offers Full HD resolution and vibrant colors with IPS technology for sharp, clear visuals from any angle. Its sleek design, energy efficiency, and easy connectivity make it perfect for work and entertainment. Additional features like Reader Mode and Flicker Safe help reduce eye strain for comfortable use.',brandname: 'LG TV',brandlogo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwNxYdCG0N58ck0XnE0AUx9SgaKn7XewUDuw&s'),
  //   Productdetails(name: 'Aesthetic Mug White',price: '\$19.99', imageurl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTneaQHDX3KrW8WWjdm6_aXkjtvJfUZP8WLWQ&s',description: 'This aesthetic mug boasts a delicate design in soft pastel hues, perfect for elevating your coffee experience. Its minimalist patterns add a touch of elegance, while the high-quality ceramic ensures durability. Sip in style and enjoy every moment!',brandname: 'Cera-E-Noor',brandlogo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSzsQUMsJI9hvaY1z0XPmpG4_0bOqeVuZxkQ&s'),
  //   Productdetails(name: 'Audionic best quality airbuds', price: '\$50.00', imageurl: 'https://audionic.co/cdn/shop/files/audionic-the-sound-master-black-airbud-425-tws-earbuds-35775641485468.png?v=1723624303',description: 'These sleek wireless earbuds deliver exceptional sound quality and a comfortable fit, making them perfect for music lovers on the go. With advanced noise cancellation and intuitive touch controls, they enhance your listening experience while keeping you connected. Their compact design and long battery life ensure you can enjoy your favorite tunes anywhere, anytime.',brandname: 'Audionic',brandlogo: 'https://mir-s3-cdn-cf.behance.net/projects/404/d750ad35771233.Y3JvcCw4OTYsNzAxLDIyLDA.jpg'),
  //   Productdetails(name: 'PS5 Controller Black in color', price: '\$75.00', imageurl: 'https://w7.pngwing.com/pngs/703/936/png-transparent-playstation-xbox-one-controller-dualshock-4-game-controllers-controller-playstation-4-game-controllers-electronic-device.png',description: 'This ergonomic game controller offers precision and comfort for an immersive gaming experience. With responsive buttons, customizable settings, and a sleek design, it enhances gameplay across various platforms. Its wireless connectivity and long-lasting battery ensure you stay in the action without interruptions.',brandname: 'Playstation',brandlogo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2jhXihRZ2aaQKzpVvRS342veO4xOlbe67zQ&s'),


  // ];
    void _addToCart(Productdetails product) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(product);
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
 
    return Scaffold(
       appBar: AppBar(
        backgroundColor:Colors.white,
        elevation: 1,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Address',
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
            Text(
              'Karachi, Sindh, Pakistan',
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartScreen()));
            },
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart_outlined),
                Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                    if (cartProvider.items.isNotEmpty) {
                      return Positioned(
                        right: -3,
                        top: -2,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '${cartProvider.items.length}',
                            style: const TextStyle(
                              fontSize: 10,
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
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          )
        ],
      
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height:Size.height*0.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
               decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        labelText: "Search here",
                labelStyle: TextStyle(color:Colors.grey,fontFamily: 'poppinsmedium',fontSize: 14),

                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
              ),
            ),
            SizedBox(
                height: size.height*0.2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: size.height*0.4,
                      margin: const EdgeInsets.only(left: 10,right: 10),
                      decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                       BoxShadow(
                        color: Color.fromARGB(255, 168, 166, 166),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0,-2), // changes position of shadow
                      ),
                    ], 
                      image: const DecorationImage(image: AssetImage("assets/images/sale.jpg"),fit: BoxFit.cover)
                      ),
                      
                    ),
                    Container(
                      width: size.height*0.4,
                      
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, -2), // changes position of shadow
                      ),
                    ], 
                      image: const DecorationImage(image: AssetImage("assets/images/sale1.jpg"),fit: BoxFit.cover)
                      )
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0,top:10.0),
                child: Text("Category",style: TextStyle(fontFamily: 'poppinsmedium'),),
              ),
              SizedBox(height: size.height*0.02),
              Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                      height: size.height*0.07,
                      width: size.width*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),

                        image: const DecorationImage(image: AssetImage("assets/images/4.jpeg.jpg"),fit: BoxFit.contain)
                      ),
                     
                      ),
                   const Padding(
                        padding: EdgeInsets.only(top:8.0),
                        child: Text("Apperals",style: TextStyle(fontFamily: 'poppinsmedium'),),
                   )
                    ],
                  ),
                   Column(
                    children: [
                      Container(
                      height: size.height*0.07,
                      width: size.width*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),

                        // color: Colors.blueGrey,
                        image: const DecorationImage(image: AssetImage("assets/images/5.png"),fit: BoxFit.contain)
              
                      ),
                     
                      ),
                     const Padding(
                        padding: EdgeInsets.only(top:8.0),
                        child: Text("School",style: TextStyle(fontFamily: 'poppinsmedium'),),
                      )
                    ],
                  ),
                   Column(
                    children: [
                      Container(
                      height: size.height*0.07,
                      width: size.width*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),

                        // color: Colors.blueGrey,
                        image: const DecorationImage(image: AssetImage("assets/images/1.png"),fit: BoxFit.contain)
              
                      ),
                     
                      ),
                     const Padding(
                        padding: EdgeInsets.only(top:8.0),
                        child: Text("Sports",style: TextStyle(fontFamily: 'poppinsmedium'),),
                      )
                    ],
                  ), Column(
                    children: [
                      Container(
                      height: size.height*0.07,
                      width: size.width*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        // color: Colors.blueGrey,
                        image: const DecorationImage(image: AssetImage("assets/images/2.png"),fit: BoxFit.contain)
              
                      ),
                     
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top:8.0),
                        child: Text("Electronics",style: TextStyle(fontFamily: 'poppinsmedium'),),
                      )
                    ],
                  ), 
                
                ],
              ),
              SizedBox(height: size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text("Recent Product",style: TextStyle(fontFamily: 'poppinssemibold'),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5)
                      ),
                      child: const Row(
                        children: [
                          Text("Filters    ",style: TextStyle(fontFamily: 'poppinslight',fontSize: 12),),
                          Icon(Icons.filter_alt_outlined,size: 12,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
               SizedBox(
  height: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                    onAddToCart: _addToCart, // Add product to cart
                  );
                },
              ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
       color: const Color(0xffffffff),
       height: size.height*0.13,
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              IconButton(onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Prod()));
              }, icon: const Icon(Icons.home,color: Colors.green)),
              const Text("Home",style: TextStyle(fontFamily: 'poppinsmedium',fontSize: 12),)
            ],
          ),
          Column(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline_sharp)),
              const Text("Wishlist",style:TextStyle(fontFamily:  'poppinsmedium',fontSize: 12))
            ],
          ),
          Column(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.edit_document)),
              const Text("History",style:TextStyle(fontFamily:  'poppinsmedium',fontSize: 12))
            ],
          ),
          Column(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.person)),
              const Text("Account",style:TextStyle(fontFamily:  'poppinsmedium',fontSize: 12))
            ],
          )
        ],
       ),
      )
    );
  }
}