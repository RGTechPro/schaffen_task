
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/Provider/account.dart';
import 'package:schaffen_task/Services/auth_services.dart';
import 'package:schaffen_task/UI_Screens/Deliver-Address/Components/previous_address.dart';
import 'package:schaffen_task/UI_Screens/Deliver-Address/address.dart';
import 'package:schaffen_task/UI_Screens/MyOrders/my_orders.dart';
import 'package:schaffen_task/UI_Screens/Profile/Components/profile_item.dart';
import 'package:schaffen_task/UI_Screens/log_in.dart';



class Body extends StatelessWidget {

  static String routeName = "/profile";
final _firebase = FirebaseFirestore.instance;
  User? _firebaseUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
  
    var accountProvider = Provider.of<Account>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(30),),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg')),
                ),
                const Text(
                  "Praveen",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "abcd@gmail.com",
                  style: TextStyle(fontSize: 20),
                ),
                const Text(
                  "+91 8282828282",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment,
                children: <Widget>[
                  InkWell(
                    onTap:()
    {
      Navigator.pushNamed(context,  MyOrders.routeName);
    },
                      child: p_card_w(namee: "My Orders",icons: Icons.add_shopping_cart,route: "/my_order")),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context,  PreviousAddress.routeName);
                    },
                      child: p_card_w(namee: "My Addesses",icons: Icons.add_shopping_cart,route: "test")),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: (){},
                    
                    child: p_card_w(namee: "Help",icons: Icons.add_shopping_cart,route: "test")),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                            Provider.of<Auth>(context, listen: false).logout(context);
      Provider.of<Account>(context, listen: false).logout();
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>LogIn()));
                    },
                    child: p_card_w(namee: "Logout",icons: Icons.add_shopping_cart,route: "test")),
                ],
              ),
            ),
          ],
        ),
    );

  }
}