import 'package:e_commerce/profile.dart';
import 'package:e_commerce/purchasesuccess.dart';
import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

class Cart {
  List<Product> items = [];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GearPage(),
    );
  }
}

class GearPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Rexus Mouse',
      description: 'High-performance Smartphone',
      price: 129.99,
      imagePath: 'images/rexus.png',
    ),
    Product(
      name: 'Logitech Headphone',
      description: 'High-performance Headphone',
      price: 189.99,
      imagePath: 'images/logitech.png',
    ),
    Product(
      name: 'Steel Series Keyboard',
      description: 'High-performance Keyboard',
      price: 249.99,
      imagePath: 'images/steelseries.png',
    ),
    Product(
      name: 'Corsair Gaming Chair',
      description: 'High-performance Gaming Chair',
      price: 799.99,
      imagePath: 'images/corsair.png',
    ),
    Product(
      name: 'Digital Alliance MousePad',
      description: 'High-performance MousePad',
      price: 99.99,
      imagePath: 'images/dgalliance.png',
    ),
  ];

  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level Up Product'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  onBuyPressed: () {
                    // Handle Buy button tap
                    print('Buy button tapped for ${products[index].name}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PurchasePage(product: products[index]),
                      ),
                    );
                  },
                  onCartPressed: () {
                    // Handle Cart button tap
                    print('Cart button tapped for ${products[index].name}');
                    cart.items.add(products[index]);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${products[index].name} added to the cart'),
                      ),
                    );
                  },
                );
              },
            ),
            FloatingActionButton(
              onPressed: () {
                // Navigate to Cart page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cart: cart),
                  ),
                );
              },
              child: Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            iconSize: 32,
            onPressed: () {
               Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
              print('Home button pressed');
            },
            icon: Icon(Icons.home),
          ),
          IconButton(
            iconSize: 32,
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
      return GearPage(); // Assuming ProductListScreen is your e-commerce product screen
    }));
              print('Product button pressed');
            },
            icon: Icon(Icons.assignment),
          ),
          IconButton(
            iconSize: 32,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return Carts();
                  }));
              print('Wishlist button pressed');
            },
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            iconSize: 32,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  }));
                print('Account button pressed');
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),

    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onBuyPressed;
  final VoidCallback onCartPressed;

  const ProductCard({
    required this.product,
    required this.onBuyPressed,
    required this.onCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imagePath,
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(
              product.name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              product.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${product.price.toString()}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onBuyPressed,
                  child: Text('Buy'),
                ),
                ElevatedButton(
                  onPressed: onCartPressed,
                  child: Text('Cart'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PurchasePage extends StatelessWidget {
  final Product product;

  const PurchasePage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You bought ${product.name}!',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the ProductPage
                Navigator.pop(context);
              },
              child: Text('Back to Products'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final Cart cart;

  CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    // Calculate the total price of items in the cart
    double totalPrice = cart.items.fold(0, (sum, product) => sum + product.price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cart.items[index].name),
                  subtitle: Text('\$${cart.items[index].price.toString()}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement logic to handle the buy button on the Cart Page
              // You can use this button to complete the purchase
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Purchase Confirmation'),
                    content: Text('Do you want to complete the purchase?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Handle purchase confirmation
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PurchaseSuccessfulPage(),
                            ),
                          );
                        },
                        child: Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle canceling the purchase
                          Navigator.pop(context);
                        },
                        child: Text('No'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Buy'),
          ),
        ],
      ),
    );
  }
}