import 'package:objectbox/objectbox.dart';
import 'package:taskf/app/core/models/products.dart';
import 'package:taskf/app/core/services/storage/storage_services.dart';

class ProductStorage {
  Box<Product>? _product;
  ProductStorage() {
    StorageService storageService = StorageService.instance;
    _product = storageService.store!.box<Product>();
  }

  Product? getProduct(int id) {
    try {
      Product? product = _product!.get(id);
      if (product == null) {
        return null;
      } else {
        return product;
      }
    } on ObjectBoxException catch (_) {
      //CustomToast.showError(CustomError.unKnown);
      return null;
    }
  }

  void setProduct(Product product) {
    try {
      _product!.put(product);
    } on ObjectBoxException catch (_) {
      // CustomToast.showError(CustomError.unKnown);
    }
  }

  void removeProduct(int id) {
    try {
      _product!.remove(id);
    } on ObjectBoxException catch (_) {
      //CustomToast.showError(CustomError.unKnown);
    }
  }

  void removeAllProducts() {
    try {
      _product!.removeAll();
    } on ObjectBoxException catch (_) {
      //CustomToast.showError(CustomError.unKnown);
    }
  }

  void updateShoppingCartProduct(Product product) {
    try {
      _product!.put(product, mode: PutMode.update);
    } on ObjectBoxException catch (_) {
      // CustomToast.showError(CustomError.unKnown);
    }
  }

  List<Product>? getAllBox() {
    if (_product!.isEmpty()) {
      return [];
    } else {
      return _product!.getAll();
    }
  }
}
