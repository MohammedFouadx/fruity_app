
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/models/fruits_and_vegs.dart';


class ProductDetailsScreen extends StatelessWidget {
  final FruitsAndVegs fruitsAndVegs ;
  ProductDetailsScreen({
    required this.fruitsAndVegs,
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child: CustomScrollView(
                primary: true,
                shrinkWrap: false,
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor:
                    Theme.of(context).accentColor.withOpacity(0.9),
                    expandedHeight: 330,
                    elevation: 0,
                    iconTheme:
                    IconThemeData(color: Theme.of(context).primaryColor),
                    flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Container(
                          color: Colors.white,
                          child: Image.asset(
                            fruitsAndVegs.imageUrl!,

                          ),
                        )
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Wrap(
                        runSpacing: 8,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      fruitsAndVegs.name!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style:
                                      Theme.of(context).textTheme.headline3,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      fruitsAndVegs.description!,
                                      style: Theme.of(context).textTheme.headline4,
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),




                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
