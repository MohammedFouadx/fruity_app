import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/features/home/home_controller.dart';
import 'package:fruits_market/features/home/presentation/widgets/daily_fresh.dart';
import 'package:fruits_market/features/home/presentation/widgets/fresh_fruits.dart';
import 'package:fruits_market/features/home/presentation/widgets/search_box.dart';
import 'package:get/get.dart';
import '../../../core/constants.dart';


class HomeScreen extends StatelessWidget {

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBox(),
            DailyFresh(),
            FreshFruits(),
          ],
        ),
      ),
    );
  }
}
