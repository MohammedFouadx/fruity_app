import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants.dart';
import '../../../product_details/product_details_screen.dart';
import '../../home_controller.dart';



class DailyFresh extends StatefulWidget {
  const DailyFresh({Key? key}) : super(key: key);

  @override
  State<DailyFresh> createState() => _DailyFreshState();
}

class _DailyFreshState extends State<DailyFresh> {
  

  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = Get.put(HomeViewController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(appPadding),
          child: Text(
            'Daily Fresh',
            style: TextStyle(
                fontSize: 24, letterSpacing: 1, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            height: size.height * 0.4,
            child:   ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.product.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: appPadding,
                        right: appPadding / 2,
                        bottom: appPadding,
                      ),
                      child: InkWell(
                        onTap: (){
                          Get.to(
                              ProductDetailsScreen(
                                product: controller.product[index],
                              ));
                        },
                        child: Container(
                          width: size.width * 0.55,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: black.withOpacity(0.2),
                                offset: Offset(5, 5),
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(appPadding / 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  placeholderFadeInDuration: Duration(seconds: 5),
                                  imageUrl: controller.product[index].image ?? "",
                                  placeholder: (context, url) =>  Image.asset(
                                      'assets/images/orange.jpg'
                                  ),
                                  errorWidget: (context, url, error) => Image.asset(
                                      'assets/images/orange.jpg'
                                  ),
                                ),
                                Text(
                                  controller.product[index].name ?? "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  controller.product[index].desc ?? "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  " ${controller.product[index].price}   ريال",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: appPadding * 2,
                      bottom: appPadding / 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: black.withOpacity(0.5),
                                offset: Offset(3, 3),
                                blurRadius: 3,
                              )
                            ]),
                        padding: EdgeInsets.symmetric(
                          vertical: appPadding / 4,
                          horizontal: appPadding / 1.5,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.favorite_rounded,),
                            Text('Save'),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            )

        )
      ],
    );
  }
}
