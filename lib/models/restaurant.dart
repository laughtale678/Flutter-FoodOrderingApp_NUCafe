import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nu_cafe/models/cart_item.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{
  //menu
  final List<Food> _menu = [
    //coffee
    Food(
        name: "Americano",
        imagePath: "assets/images/coffee/AMERICANO.jpeg",
        price: 3.00,
        category: FoodCategory.coffee
    ),
    Food(
        name: "Cappuccino",
        imagePath: "assets/images/coffee/CAPPUCCINO.jpeg",
        price: 4.00,
        category: FoodCategory.coffee
    ),
    Food(
        name: "Espresso",
        imagePath: "assets/images/coffee/ESPRESSO.jpeg",
        price: 4.00,
        category: FoodCategory.coffee
    ),
    Food(
        name: "Latte",
        imagePath: "assets/images/coffee/LATTE.jpeg",
        price: 5.00,
        category: FoodCategory.coffee
    ),
    Food(
        name: "Mocha",
        imagePath: "assets/images/coffee/MOCHA.jpeg",
        price: 5.00,
        category: FoodCategory.coffee
    ),
    //tea
    Food(
        name: "Black Tea",
        imagePath: "assets/images/tea/BLACK_TEA.jpeg",
        price: 4.00,
        category: FoodCategory.tea
    ),
    Food(
        name: "Iced Green Tea Latte",
        imagePath: "assets/images/tea/ICED_MATCHA_GREENTEA_LATTE.jpeg",
        price: 4.00,
        category: FoodCategory.tea
    ),
    Food(
        name: "Tropical Berry Green Tea Shake",
        imagePath: "assets/images/tea/TROPICAL_BERRY_GREENTEA_SHAKER.jpeg",
        price: 5.00,
        category: FoodCategory.tea
    ),
    Food(
        name: "Yuzu Citrus Black Tea Shake",
        imagePath: "assets/images/tea/YUZU_CITRUS_BLACKTEA_SHAKER.jpeg",
        price: 4.00,
        category: FoodCategory.tea
    ),
    //sandwich
    Food(
        name: "Egg & Cheese Sandwich",
        imagePath: "assets/images/sandwich/EGG&CHEESE.jpeg",
        price: 6.00,
        category: FoodCategory.sandwich
    ),
    Food(
        name: "Ham & Swiss Sandwich",
        imagePath: "assets/images/sandwich/HAM&SWISS.jpeg",
        price: 6.00,
        category: FoodCategory.sandwich
    ),
    Food(
        name: "Plant-Based Sandwich",
        imagePath: "assets/images/sandwich/PLANT.jpeg",
        price: 6.00,
        category: FoodCategory.sandwich
    ),
    Food(
        name: "Turkey & Cheese Sandwich",
        imagePath: "assets/images/sandwich/TURKEY.jpeg",
        price: 6.00,
        category: FoodCategory.sandwich
    ),
  ];
  //cart
  final List<CartItem> _cart = [];
  //address
  String _deliveryAddress = "225 Terry Ave N";

  //getter
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  //update address
  void updateDeliveryAddress(String address){
    _deliveryAddress = address;
    notifyListeners();
  }

  //add to cart
  void addToCart(Food food){
    //check if the food is already in the cart
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      return item.food == food;
    });
    //if the food is already in the cart, increase the quantity
    if(cartItem != null){
      cartItem.quantity++;
    }
    //if the food is not in the cart, add it to the cart
    else{
      _cart.add(CartItem(food: food));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);
    if(cartIndex != -1){
      
      if(_cart[cartIndex].quantity > 1){
        _cart[cartIndex].quantity--;
      }
      else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price
  double getTotalPrice(){
    double totalPrice = 0.0;
    for(CartItem cartItem in _cart){
      totalPrice += cartItem.food.price * cartItem.quantity;
    }
    return totalPrice;
  }

  //get items count
  int getTotalItemCount() {
    int totalItemCount = 0;
    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }

  //generate reciept
  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}";
  }

  String generateReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt:");
    receipt.writeln();
    for(final cartItem in _cart){
      receipt.writeln("${cartItem.food.name} x ${cartItem.quantity} -- ${_formatPrice(cartItem.food.price)}");
    }
    receipt.writeln();
    receipt.writeln("Total: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivery Address: $deliveryAddress");
    return receipt.toString();
  }
}
