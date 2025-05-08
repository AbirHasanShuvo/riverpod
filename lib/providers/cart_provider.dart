import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product.dart';

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});

class CartNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return const {
      Product(
        id: '4',
        title: 'Red backpack',
        price: 45,
        image: 'assets/icons/backpack.png',
      ),
    };
  }
}
