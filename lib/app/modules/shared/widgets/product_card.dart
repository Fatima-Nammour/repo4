import 'package:flutter/material.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:taskf/app/core/models/products.dart';

class ProductCard extends StatelessWidget {
  final bool? isShoppCartProduct;
  final Product? product;

  final Function? onPressAddOrDelete;
  final Function? onPressDetail;

  const ProductCard(
      {Key? key,
      this.product,
      this.onPressAddOrDelete,
      this.onPressDetail,
      this.isShoppCartProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isShoppCartProduct!) {
      return Container(
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
        child: Column(
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
                          color: Colors.blue, fontFamily: Keys.fontFamilyKey),
                    ),
                  ))),
                ],
              ),
            ),
            //Description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          onPressDetail!();
                        },
                        icon: const Icon(
                          Icons.info_outline,
                          color: Colors.blue,
                          size: 35.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(
                    child: IconButton(
                      focusColor: Colors.red,
                      onPressed: () {
                        onPressAddOrDelete!();
                      },
                      icon: const Icon(
                        Icons.add_shopping_cart_outlined,
                        color: Colors.blue,
                        size: 35.0,
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
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
        child: Column(
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
                          color: Colors.blue, fontFamily: Keys.fontFamilyKey),
                    ),
                  ))),
                ],
              ),
            ),
            //Count
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Text(
                    'count ${product!.count.toString()}',
                    style: TextStyle(
                        color: Colors.blue, fontFamily: Keys.fontFamilyKey),
                  ),
                ),
              ),
            ),
            //Detail button and add Shopping cart product
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          onPressDetail!();
                        },
                        icon: const Icon(
                          Icons.info_outline,
                          color: Colors.blue,
                          size: 35.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(
                    child: IconButton(
                      focusColor: Colors.red,
                      onPressed: () {
                        onPressAddOrDelete!();
                      },
                      icon: const Icon(
                        Icons.remove_shopping_cart_outlined,
                        color: Colors.blue,
                        size: 35.0,
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
