import 'package:e_commerce/home_page.dart';
import 'package:e_commerce/profile.dart';
import 'package:flutter/material.dart';
import 'product.dart';


class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class Carts extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<Carts> {
  List<CartItem> cartItems = [];

  void addItemToCart(Product product) {
    bool itemExists = cartItems.any((item) => item.product == product);

    if (itemExists) {
      // If the item is already in the cart, increase the quantity
      cartItems.firstWhere((item) => item.product == product).quantity++;
    } else {
      // If the item is not in the cart, add a new CartItem
      cartItems.add(CartItem(product: product));
    }

    setState(() {});
  }

  void removeItemFromCart(Product product) {
    cartItems.removeWhere((item) => item.product == product);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: cartItems.isEmpty
            ? Center(
                child: Text('Your cart is empty.'),
              )
            : ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  CartItem cartItem = cartItems[index];
                  return ListTile(
                    title: Text(cartItem.product.name),
                    subtitle: Text('Price: \$${cartItem.product.price.toString()}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if (cartItem.quantity > 1) {
                              cartItem.quantity--;
                            } else {
                              removeItemFromCart(cartItem.product);
                            }
                            setState(() {});
                          },
                        ),
                        Text('${cartItem.quantity}'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            cartItem.quantity++;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  );
                },
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
                Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductPage();
                            }));
                print('Courses button pressed');
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
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Carts(),
    );
  }
}

void main() {
  runApp(MyApp());
}
