import 'package:get/get.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:taskf/app/core/widgets/widget_error.dart';
import 'package:taskf/app/modules/auth/login/login_binding.dart';
import 'package:taskf/app/modules/auth/login/login_view.dart';
import 'package:taskf/app/modules/auth/signup/signup_binding.dart';
import 'package:taskf/app/modules/auth/signup/signup_view.dart';
import 'package:taskf/app/modules/auth/wrapper/wrapper_binding.dart';
import 'package:taskf/app/modules/auth/wrapper/wrapper_view.dart';
import 'package:taskf/app/modules/home/home_binding.dart';
import 'package:taskf/app/modules/home/home_view.dart';
import 'package:taskf/app/modules/products/products_binding.dart';
import 'package:taskf/app/modules/products/products_view.dart';

import 'package:taskf/app/modules/shared/widgets/product_card_detailed.dart';
import 'package:taskf/app/modules/shopping_cart/shopping_binding.dart';
import 'package:taskf/app/modules/shopping_cart/shopping_cart_view.dart';

class AppPages {
  static List<GetPage> appRoutes = [
    GetPage(
      name: Keys.wrapperPageKey,
      page: () => const WrapperView(),
      binding: WrapperBinding(),
    ),
    GetPage(
      name: Keys.homePageKey,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Keys.errorPageKey,
      page: () => const WidgetError(
        pageKey: '',
      ),
    ),
    GetPage(
      name: Keys.productDetailedPageKey,
      page: () => ProductCardDetailed(),
    ),
    GetPage(
      name: Keys.loginPageKey,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Keys.signupPageKey,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Keys.productsPageKey,
      page: () => const ProductsView(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: Keys.shoppingCartProductsPage,
      page: () => const ShoppingCartView(),
      binding: ShoppingCartBinding(),
    ),
  ];
}
