import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v2/providers/products_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;
  @override
  Widget build(BuildContext context) {
    //here no need for the ref variable like the stateless widget we have used before
    final cartProducts = ref.watch(reducedProductProvider);
    //the product from the provider caming here
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children:
              cartProducts.map((product) {
                return Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Image.asset(product.image, width: 60, height: 60),
                      const SizedBox(width: 10),
                      Text(product.title),
                      const Expanded(child: SizedBox()),
                      Text(
                        '€${product.price}',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
