
import 'package:flutter/material.dart';

import '../../core/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: appPadding / 2),
          child: Icon(
            Icons.short_text_rounded,
            color: black,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: appPadding),
            child: Icon(Icons.logout,color: black,),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context , index){
                return SizedBox(
                  height: 120,
                  child: Card(
                    elevation: 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/redcabbag.jpg",
                          width: 70,
                          height: 70,
                        ),

                        const SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "redcabbag"
                            ),
                            Text(
                              "2000"
                            ),
                          ],
                        ),

                        const Spacer(),

                        Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 25,
                        ),

                        const SizedBox(width: 20,),

                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
