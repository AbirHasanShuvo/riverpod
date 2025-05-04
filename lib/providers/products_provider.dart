import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v2/model/product.dart';

const List<Product> allProducts = [
  Product(
    id: '1',
    title: 'Groovy Shorts',
    price: 12,
    image: 'assets/icons/shorts.png',
  ),
  Product(
    id: '2',
    title: 'Karati kit',
    price: 34,
    image: 'assets/icons/karati.png',
  ),
  Product(
    id: '3',
    title: 'Denim Jeans',
    price: 54,
    image: 'assets/icons/jeans.png',
  ),
  Product(
    id: '4',
    title: 'Red backpack',
    price: 45,
    image: 'assets/icons/backpack.png',
  ),
  Product(
    id: '5',
    title: 'Drum & sticks',
    price: 77,
    image: 'assets/icons/drum.png',
  ),
  Product(
    id: '6',
    title: 'Blue suitcase',
    price: 54,
    image: 'assets/icons/suitcase.png',
  ),
  Product(
    id: '7',
    title: 'Roller skates',
    price: 52,
    image: 'assets/icons/skates.png',
  ),
  Product(
    id: '8',
    title: 'Electric guitar',
    price: 198,
    image: 'assets/icons/guitar.png',
  ),
];

final productProvider = Provider((ref) {
  return allProducts;
});

final reducedProductProvider = Provider((ref) {
  return allProducts.where((p) => p.price < 50).toList();
});
