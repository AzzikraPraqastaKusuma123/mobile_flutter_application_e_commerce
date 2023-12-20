import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _namaPengguna = 'John Doe';
  String _emailPengguna = 'john.doe@example.com';
  String _alamat = '123 Main Street';
  String _nomorTelepon = '555-1234';
  String _urlGambarProfil = 'URL_GAMBAR_PROFIL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengguna'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(_urlGambarProfil),
            ),
            SizedBox(height: 20.0),
            Text(
              _namaPengguna,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              _emailPengguna,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              _alamat,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              _nomorTelepon,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Aksi yang ingin dilakukan ketika tombol di tekan
                _editProfil(context);
              },
              child: Text('Edit Profil'),
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
      return ProductPage(); // Assuming ProductListScreen is your e-commerce product screen
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

  void _editProfil(BuildContext context) {
    // Tampilkan dialog atau navigasi ke halaman pengeditan profil
    // Anda dapat menggunakan Navigator atau menampilkan dialog sesuai kebutuhan
    // Contoh:
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profil'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Tambahkan elemen formulir untuk mengedit data profil
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nama Pengguna'),
                  onChanged: (value) {
                    setState(() {
                      _namaPengguna = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email Pengguna'),
                  onChanged: (value) {
                    setState(() {
                      _emailPengguna = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Alamat'),
                  onChanged: (value) {
                    setState(() {
                      _alamat = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nomor Telepon'),
                  onChanged: (value) {
                    setState(() {
                      _nomorTelepon = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'URL Gambar Profil'),
                  onChanged: (value) {
                    setState(() {
                      _urlGambarProfil = value;
                    });
                  },
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Lakukan aksi penyimpanan data pengguna di sini
                // Anda dapat menyimpan data ke penyimpanan lokal atau server
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}