import 'package:flutter/material.dart';

class EmptyShoppingCartPage extends StatelessWidget {
  const EmptyShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image.asset(
              'assets/images/empty_cart.png',
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0)),
              child: const Text(
                'No products here!',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            IconButton(
              onPressed: () async {
                // await controller.getProducts(context);
              },
              icon: const Icon(
                Icons.refresh_outlined,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
