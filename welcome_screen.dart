import 'package:e_commerce/login_page.dart';

import 'home_page.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: 
                    BorderRadius.only(bottomRight: Radius.circular(70)),
                  ),
                  child: Center(
                      child: Image.asset(
                    "images/LevelUp_removeBG.png",
                    scale: 0.6,
                    height: 250.0,
                    width: 250.0,
                  ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.666,
                decoration: BoxDecoration(
                color: Colors.lightBlue,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.666,
                padding: EdgeInsets.only(top: 40, bottom: 30),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70),
                ),
                ),
                child: Column(
                  children: [
                  Text("THE FUTURE E-COMMERCE",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Shop at Level Up to Get a Futuristic Impression",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      ),
                  ),
                  SizedBox(height: 60),
                  Material(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, 
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        )
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15,
                        horizontal: 80,
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color : Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
