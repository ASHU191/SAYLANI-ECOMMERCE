import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final double totalPrice; // Add this field to hold the passed total price

   PaymentScreen({required this.totalPrice}); // Constructor to accept the total price

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final existingCard = TextEditingController();
    final newCard = TextEditingController();
    final expDate = TextEditingController();
    final securityCode = TextEditingController();
    final cardHolderName = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment method',
          style: TextStyle(color: Colors.black, fontFamily: 'poppinssemibold', fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select existing card',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'poppinsmedium'),
              ),
              SizedBox(height: size.height*0.01),
              TextField(
                
                controller: existingCard,
                
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "*** *** *** 789",
                  hintStyle: TextStyle(color: Colors.grey, fontFamily: 'poppinsmedium', fontSize: 14),
                  prefixIcon: Icon(Icons.view_comfortable_outlined, color: Colors.grey),
                  suffixIcon: Icon(Icons.restore_from_trash_outlined, color: Colors.grey, size: 14),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
               SizedBox(height:size.height*0.02),
              const Text(
                'Or Input New Card',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'poppinsmedium'),
              ),
               SizedBox(height: size.height*0.01),
              TextField(
                controller: newCard,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Card number',
                  labelStyle: const TextStyle(fontFamily: 'poppinsmedium'),
                  hintText: '1234 1234 1234 1234',
                  border: const OutlineInputBorder(),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       SizedBox(width: size.width*0.08),
                      Image.asset('assets/images/visa.png', height: 24),
                       SizedBox(width: size.width*0.002),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/mastercard.png', height: 24),
                      ),
                    ],
                  ),
                ),
              ),
               SizedBox(height: size.height*0.01),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: expDate,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: 'Exp date',
                        hintText: 'mm/yy',
                        labelStyle: TextStyle(fontFamily: 'poppinsmedium'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width*0.01),
                  Expanded(
                    child: TextField(
                      controller: securityCode,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Security code',
                        labelStyle: TextStyle(fontFamily: 'poppinsmedium'),
                        hintText: 'cvv/cvc',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(height: size.height*0.01),
              TextField(
                controller: cardHolderName,
                decoration: const InputDecoration(
                  labelText: 'Card holder',
                  hintText: 'Enter card holder name',
                  labelStyle: TextStyle(fontFamily: 'poppinsmedium'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.25),
              const Divider(thickness: 1),
              ListTile(
                title: const Text(
                  'Totals',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'poppinsmedium'),
                ),
                trailing: Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'poppinsmedium'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // _showPaymentSuccessDialog(context);
                },
                child: const Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show the payment success dialog
void _showPaymentSuccessDialog(BuildContext context) {
  final size=MediaQuery.of(context).size;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        height: size.height * 0.6, // 40% of screen height
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 180),
             SizedBox(height:size.height*0.016 ),
            const Text(
              "Congrats! Your payment is successfully completed.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,fontFamily: 'poppinsbold'),
            ),
             SizedBox(height: size.height*0.02),
            const Text(
              "You can track your order or download the invoice below.",
              style: TextStyle(fontFamily: 'poppinsmedium'),
              textAlign: TextAlign.center,
            ),
             SizedBox(height: size.height*0.01,),
             const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.file_download, color: Colors.grey),
                                SizedBox(width: 5),
                                Text(
                                  'Order Invoice',
                                  style: TextStyle(color: Colors.grey,fontFamily: 'poppinsmedium'),
                                ),
                              ],
                            ),
             SizedBox(height: size.height*0.016),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the bottom sheet
                Navigator.pop(context); // Go back to the previous screen
              },
              child: const Text("Continue",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      );
    },
  );
} 
}
