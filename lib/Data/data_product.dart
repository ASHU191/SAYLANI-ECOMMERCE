class Productdetails {
  String imageurl;
  String name;
  String price;
  String description;
  String brandname;
  String brandlogo;
  Productdetails({
    required this.imageurl,
    required this.name,
    required this.price,
    required this.description,
    required this.brandname,
    required this.brandlogo,
  });
}

final List<Productdetails> products = [
  Productdetails(
    name: 'Samsung 50" inch LED HD Display',
    price: '\$2599.99',
    imageurl:
"https://images.priceoye.pk/samsung-galaxy-s25-pakistan-priceoye-ave16-500x500.webp"  ,  description:
        'The Samsung 50-inch monitor offers Full HD resolution and vibrant colors with IPS technology for sharp, clear visuals from any angle. Its sleek design, energy efficiency, and easy connectivity make it perfect for work and entertainment. Additional features like Reader Mode and Flicker Safe help reduce eye strain for comfortable use.',
    brandname: 'Samsung',
    brandlogo:
        'https://logovector.net/wp-content/uploads/2014/07/Samsung-logo-vector.png',
  ),
  Productdetails(
    name: 'Beautiful Mug with customizble',
    price: '\$25.99',
    imageurl:
"https://www.arzaan.pk/cdn/shop/files/392451828-1519188506-_1_900x.jpg?v=1721942292",    description:
        'This aesthetic mug boasts a delicate design in soft pastel hues, perfect for elevating your coffee experience. Its minimalist patterns add a touch of elegance, while the high-quality ceramic ensures durability. Sip in style and enjoy every moment!',
    brandname: 'Cera-E-Noor',
    brandlogo:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSzsQUMsJI9hvaY1z0XPmpG4_0bOqeVuZxkQ&s',
  ),
  Productdetails(
    name: 'Ronin HD Quality airpods',
    price: '\$70.00',
    imageurl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT-1t4iTDBmgk5KmxSaxCzGUhWgPZcjxK9AQ&s',
    description:
        'These sleek wireless earbuds deliver exceptional sound quality and a comfortable fit, making them perfect for music lovers on the go. With advanced noise cancellation and intuitive touch controls, they enhance your listening experience while keeping you connected. Their compact design and long battery life ensure you can enjoy your favorite tunes anywhere, anytime.',
    brandname: 'Ronin',
    brandlogo:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIkU0CLtw3CZaqkRPxytr9MJkUYFxHoHr8tQ&s',
  ),
  Productdetails(
    name: 'Controller Black',
    price: '\$99.00',
    imageurl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtskPqnOvuKMQ5tQpjowGbUVmzOX2HDV9ehbKWOQAy2HHl2amz_cnGnf7qStM_HnjhPdc&usqp=CAU',
    description:
        'This ergonomic game controller offers precision and comfort for an immersive gaming experience. With responsive buttons, customizable settings, and a sleek design, it enhances gameplay across various platforms. Its wireless connectivity and long-lasting battery ensure you stay in the action without interruptions.',
    brandname: 'Playstation',
    brandlogo:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2jhXihRZ2aaQKzpVvRS342veO4xOlbe67zQ&s',
  ),
];
