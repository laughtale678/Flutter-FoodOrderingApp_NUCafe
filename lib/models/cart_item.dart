import 'package:flutter_nu_cafe/models/food.dart';

class CartItem {
  Food food;
  int quantity;

  CartItem({required this.food,  this.quantity = 1});

  double get totalPrice => food.price * quantity;
}