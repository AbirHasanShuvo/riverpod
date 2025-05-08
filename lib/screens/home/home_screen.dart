import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v2/providers/products_provider.dart';
import 'package:riverpod_v2/screens/cart/cart_screen.dart';

import '../../providers/cart_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: const Text('this is Home Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CartScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,

            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(allProducts[index].image, width: 50, height: 50),
                  Text(allProducts[index].title),
                  Text(
                    '€${allProducts[index].price}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  if (cartProducts.contains(allProducts[index]))
                    TextButton(onPressed: () {
                      ref.read(cartNotifierProvider.notifier).removeProduct(allProducts[index]);
                    }, child: Text('remove')),
                  if (!cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {
                        ref.read(cartNotifierProvider.notifier).addProduct(allProducts[index]);
                      },
                      child: Text('add to cart'),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
