import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:taskf/app/core/models/products.dart';
import 'package:taskf/app/core/services/internet_connection/internetConn.dart';
import 'package:taskf/app/core/services/storage/product_storage.dart';
import 'package:taskf/app/modules/products/product_repository.dart';

class ProductsController extends GetxController with StateMixin<dynamic> {
  d.Response? response;

  ProductStorage productStorage; //needed
  ProductRepository productRepository;
  ProductsController({
    required this.productRepository,
    required this.productStorage,
  });

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    InterNetConn.checkInternetConnect();
    getProductsRequett();
    super.onInit();
  }

  Future<void> refreshProducts() async {
    //call the get products witch gets the products and put them in the box storage
    change(null, status: RxStatus.loading());
    await getProductsRequett();
  }

  ///the following method get & store products
  List<Product> products = [];
  Future<void> getProductsRequett() async {
    Map<String, dynamic> response;
    try {
      response = await productRepository.getProductsRequestt();
      for (int i = 0; i < response[Keys.productsKey].length; i++) {
        Product product = Product(
          id: int.parse(response[Keys.productsKey][i][Keys.productIDKey]),
          name: response[Keys.productsKey][i][Keys.productNameKey],
          description: response[Keys.productsKey][i]
              [Keys.productDescriptionKey],
          imageUrl: response[Keys.productsKey][i][Keys.productImageUrlKey],
          price: response[Keys.productsKey][i][Keys.productPriceKey].toString(),
          rate: response[Keys.productsKey][i][Keys.productRateKey].toString(),
          marketName: response[Keys.productsKey][i][Keys.productMarketKey]
              [Keys.productMarketNameKey],
          marketAddress: response[Keys.productsKey][i][Keys.productMarketKey]
              [Keys.productMarketAddressKey],
          count: 1,
        );
        products.add(product);
      }
      change(null, status: RxStatus.success());
    } catch (e) {
      print(e);
      Get.snackbar('No Internet!', 'Please check your connection',
          duration: const Duration(seconds: 3),
          icon: const Icon(
            Icons.signal_cellular_connected_no_internet_0_bar_sharp,
          ));
      change(null, status: RxStatus.success());
    }
  }

  void createAndStoreShoppingCartProduct(Product product) {
    if (productStorage.getProduct(product.id) == null) {
      Product shoppingCart = Product(
        id: product.id,
        count: 1,
        name: product.name,
        price: product.price,
        rate: product.rate,
        imageUrl: product.imageUrl,
        description: product.description,
        marketName: product.marketName,
        marketAddress: product.marketAddress,
      );
      productStorage.setProduct(shoppingCart);
    } else {
      Product? productTemp = productStorage.getProduct(product.id);

      int counter = productTemp!.count;

      counter = ++counter;
      Product shoppingCart = Product(
        id: product.id,
        count: counter,
        name: product.name,
        price: product.price,
        rate: product.rate,
        imageUrl: product.imageUrl,
        description: product.description,
        marketName: product.marketName,
        marketAddress: product.marketAddress,
      );
      productStorage.updateShoppingCartProduct(shoppingCart);
    }
  }
}
