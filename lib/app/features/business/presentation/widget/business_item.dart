import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodle_blur_task/app/features/business/data/models/business_response_model.dart';
import 'package:doodle_blur_task/app/features/business/presentation/screens/business_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BusinessItem extends StatelessWidget {
  Business model;
  BusinessItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    String categories = "";

    for (var item in model.categories) {
      categories += "${item.title}, ";
    }

    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BusinessDetails(model: model)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade400)
        ),
        padding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      height: size.width * 0.3,
                      child: CachedNetworkImage(imageUrl: model.imageUrl),
                    ),

                    const SizedBox(width: 10,),

                    SizedBox(
                      width: size.width * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(width: 20,),

                          SizedBox(
                            width: size.width * 0.4,
                            child: Text(
                              model.name,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),


                          Text.rich(TextSpan(
                            text: 'Price: ',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: model.price.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(TextSpan(
                            text: 'Reviews: ',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: model.reviewCount.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                SizedBox(
                  width: size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),

                      model.isClosed ?
                      const Column(
                        children: [
                          Text(
                            "Temporary Closed",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ) : const SizedBox(),


                      Text.rich(TextSpan(
                        text: 'Categories: ',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: categories,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )),

                      const SizedBox(height: 10,),

                      Text.rich(TextSpan(
                        text: 'Address: ',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: model.location.displayAddress.join(", "),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )),

                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              // height: 50,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(25))
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const Icon(Icons.star,color: Colors.yellow,size: 10,),

                  const SizedBox(width: 5,),

                  Text(
                    model.rating.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
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
