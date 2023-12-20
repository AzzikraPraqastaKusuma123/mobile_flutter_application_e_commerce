import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CheckoutPage(selectedProducts: [],),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class CheckoutPage extends StatefulWidget {
  final List<Product> selectedProducts;

  CheckoutPage({required this.selectedProducts});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String address = '';
  double calculateTotal() {
    double total = 0.0;
    for (var product in widget.selectedProducts) {
      total += product.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ringkasan Pesanan',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.selectedProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.selectedProducts[index].name),
                  subtitle: Text('\$${widget.selectedProducts[index].price.toString()}'),
                );
              },
            ),
            SizedBox(height: 10.0),
            Divider(height: 1.0, color: Colors.black),
            SizedBox(height: 10.0),
            Text(
              'Alamat Pengiriman',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(labelText: 'Alamat'),
              onChanged: (value) {
                setState(() {
                  address = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            Divider(height: 1.0, color: Colors.black),
            SizedBox(height: 20.0),
            Text(
              'Total Harga: \$${calculateTotal().toString()}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implementasi logika proses checkout
                // Contoh sederhana: menampilkan snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Pesanan berhasil ditempatkan!'),
                  ),
                );
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}