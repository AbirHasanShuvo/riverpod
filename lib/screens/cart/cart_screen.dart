import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v2/providers/cart_provider.dart';
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
    final cartProducts = ref.watch(cartNotifierProvider);
    //the product from the provider caming here
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Text('Your Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children:
              cartProducts.map((product) {
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  // decoration: BoxDecoration(color: Colors.white),
                  padding: const EdgeInsets.all(10),
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
