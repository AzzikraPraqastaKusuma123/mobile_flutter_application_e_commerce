import 'package:e_commerce/card.dart';
import 'package:e_commerce/cart_page.dart';
import 'package:e_commerce/chat.dart';
import 'package:e_commerce/gadgets.dart';
import 'package:e_commerce/gaminggear.dart';
import 'package:e_commerce/help.dart';
import 'package:e_commerce/product.dart';
import 'package:e_commerce/profile.dart';
import 'package:e_commerce/service.dart';
import 'package:e_commerce/upgrade.dart';
import 'package:e_commerce/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'productdetail.dart';
import 'part_pc.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  List catNames = [
    'Part PC',
    'Gadgets',
    'Gaming Gear',
    'Upgrade',
    'Service',
    'Help',
  ];

  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF618DFD),
    Color(0xFFFC7F7F),
    Color(0xFFCB84FB),
    Color(0xFF78E667),
  ];

  List imgList = [
    'Laptop',
    'Processor',
    'PC',
    'Graphic Card',
  ];

  List<Icon> catIcons = [
    Icon(Icons.storage, color: Colors.white, size: 30,),
    Icon(Icons.phone_android, color: Colors.white, size: 30),
    Icon(Icons.gamepad_outlined, color: Colors.white, size: 30),
    Icon(Icons.upgrade_rounded, color: Colors.white, size: 30),
    Icon(Icons.design_services, color: Colors.white, size: 30),
    Icon(Icons.help_center, color: Colors.white, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.logout, color: Colors.white,),
                      onPressed: () {
                        // Implementasi tindakan kembali ke halaman sebelumnya
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return WelcomeScreen();
                          },
                        ));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.mail, color: Colors.white,),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return chat();
                          },
                        ));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    "Level Up Computer",
                    style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here....",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ElevatedButton(
                         onPressed: () {
                            // Use the index to determine which category was pressed
                            handleCategoryClick(context, index);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: catColors[index],
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: catIcons[index],
                        ),
                        SizedBox(height: 10),
                        Text(
                          catNames[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

// Padding(
//   padding: EdgeInsets.only(top: 20, left: 15, right: 15),
//   child: Column(
//     children: [
//       GridView.builder(
//         itemCount: catNames.length,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           childAspectRatio: 1.1,
//         ),
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   print('${catNames[index]} button pressed');
//                   // Add your logic here, e.g., navigate to a new screen
//                 },
//                 child: Container(
//                   height: 60,
//                   width: 60,
//                   decoration: BoxDecoration(
//                     color: catColors[index],
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: catIcons[index],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 catNames[index],
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black.withOpacity(0.6),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     ],
//   ),
// ),

          Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Padding(
      padding: EdgeInsets.only(left: 10),
    child: Text(
      "Product",
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w600,
      ),
    ),
    ),
    Padding(
      padding: EdgeInsets.only(right: 10), // Adjust the padding as needed
      child: Text(
        "See All",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.lightBlue,
        ),
      ),
    ),
  ],
),
          SizedBox(height: 10),
          // ... (Previous code)

GridView.builder(
  itemCount: imgList.length,
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (MediaQuery.of(context).size.height - 50 - 25) / (4 * 240),
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
  ),
  itemBuilder: (context, index) {
    return InkWell(
      onTap: () {
        // Handle product click based on the index or product type
        handleProductClick(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "images/${imgList[index]}.png",
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 10),
            Text(
              imgList[index],
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "View the Product",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  },
),

// ... (Rest of the code)

        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            iconSize: 32,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(); // Assuming ProductListScreen is your e-commerce product screen
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
}

void handleCategoryClick(BuildContext context, int index) {
    // Implement the logic for handling the click on each category
    switch (index) {
      case 0:
      Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return PartPc();
                  }));
        print('Part PC clicked');
        break;
      case 1:
        Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return GadgetsPage();
                  }));
        print('Gadgets clicked');
        break;
      case 2:
        Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return GearPage();
                  }));
        print('Gaming Gear clicked');
        break;
      case 3:
        Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return UpgradePage();
                  }));
        print('Upgrade clicked');
        break;
      case 4:
        Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return ServicePage();
                  }));
        print('Service clicked');
        break;
      case 5:
        Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return HelpPage();
                  }));
        print('Help clicked');
        break;
      default:
        break;
    }
  }

void handleProductClick(int index) {
  // Implement the logic for handling the click on each product
  switch (index) {
    case 0:
      print('object');
      break;
    case 1:
      // Handle click on processor
      print('Processor clicked');
      break;
    case 2:
      // Handle click on PC
      print('PC clicked');
      break;
    case 3:
      // Handle click on Graphic Card (VGA)
      print('Graphic Card (VGA) clicked');
      break;
    default:
      break;
  }
}

