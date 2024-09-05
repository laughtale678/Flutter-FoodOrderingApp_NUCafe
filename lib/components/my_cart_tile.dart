import 'package:flutter/material.dart';
import 'package:flutter_nu_cafe/components/my_quantity_selector.dart';
import 'package:flutter_nu_cafe/models/cart_item.dart';
import 'package:flutter_nu_cafe/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      width: 100,
                      height: 100,
                    )
                  ),
                  const SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(cartItem.food.name)),
                      Text('\$${cartItem.food.price}'),
                    ],
                  ),

                  const Spacer(),

                  QuantitySelector(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onIncrement: () => restaurant.addToCart(cartItem.food), 
                    onDecrement: () => restaurant.removeFromCart(cartItem),
                    )
                ],
              ),
            )

        ]),
      )
    );
  }
}