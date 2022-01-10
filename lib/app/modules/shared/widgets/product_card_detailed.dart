import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:taskf/app/core/widgets/button.dart';

class ProductCardDetailed extends StatelessWidget {
  ProductCardDetailed({Key? key}) : super(key: key);
  final product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                spreadRadius: 1.0,
                color: Colors.blue,
                blurRadius: 5,
                offset: Offset(2, 2),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
          child: ListView(
            children: [
              //Image
              Container(
                margin: const EdgeInsets.all(8.0),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.7,
                child: CachedNetworkImage(
                  imageUrl: product!.imageUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              //price and name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //price
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 2.5),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text(
                            '${product!.price} sp',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    //name
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 2.5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Text(
                            product!.name,
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: Keys.fontFamilyKey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Text(
                      product!.description,
                      style: TextStyle(
                          color: Colors.blue, fontFamily: Keys.fontFamilyKey),
                    ),
                  ),
                ),
              ),
              //Detail button and add Shopping cart product
              /*Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ],
                  ),
                ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Text(
                          product!.marketName,
                          style: TextStyle(
                              color: Colors.blue,
                              fontFamily: Keys.fontFamilyKey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Text(
                          product!.marketAddress,
                          style: TextStyle(
                              color: Colors.blue,
                              fontFamily: Keys.fontFamilyKey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ButtonWidget(
                textButton: 'back',
                onPress: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
