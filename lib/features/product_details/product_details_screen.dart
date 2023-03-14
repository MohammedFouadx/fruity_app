
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fruits_market/data/models/product.dart';
import 'package:fruits_market/features/home/home_controller.dart';
import 'package:get/get.dart';
import '../../data/models/fruits_and_vegs.dart';
import '../home/presentation/widgets/big_text.dart';


class ProductDetailsScreen extends StatelessWidget {
  final Product product ;
  ProductDetailsScreen({
    required this.product,
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double _width =120;
    double _height = 120;
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
                        background: CachedNetworkImage(
                          fit: BoxFit.cover,
                          placeholderFadeInDuration: Duration(seconds: 5),
                          imageUrl: product.image ?? "",
                          placeholder: (context, url) =>  Image.asset(
                              'assets/images/orange.jpg'
                          ),
                          errorWidget: (context, url, error) => Image.asset(
                              'assets/images/orange.jpg'
                          ),
                        ),
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
                                      product.name!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style:
                                      Theme.of(context).textTheme.headline3,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      product.desc!,
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
      bottomNavigationBar: GetBuilder<HomeViewController>(
          builder: (controller){
            return   Container(
              height: 90,
              padding: const EdgeInsets.only(top: 30 , left: 25 , right: 25 , bottom: 20),
              decoration:   BoxDecoration(
                  color: Colors.grey,
                  borderRadius: const  BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )
              ),
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      height: _height,
                      width: _width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              icon: const Icon(
                                Icons.remove,
                                size: 20,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                controller.setQuantity(false);
                              },
                            ),
                          ),
                          Expanded(
                            child: BigText(
                              text: controller.quantity.toString(),
                              fontSize: 20,
                              color: Colors.white,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                controller.setQuantity(true);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: (){
                          controller.addItem(product);
                        },
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: BigText(
                              text: ' ${product.price} | Add to Cart',
                              fontSize: 20,
                              color: Colors.white,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

            );
          }
      )


      // InkWell(
      //   onTap: (){
      //
      //   },
      //   child: Container(
      //     height: 60,
      //     width: MediaQuery.of(context).size.width,
      //     color: Colors.green,
      //     child: Center(
      //       child: Text(
      //         "Add to cart",
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white,
      //           fontSize: 16
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
