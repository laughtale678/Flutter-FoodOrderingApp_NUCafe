import 'package:flutter/material.dart';
import 'package:flutter_nu_cafe/components/my_button.dart';
import 'package:flutter_nu_cafe/models/food.dart';
import 'package:flutter_nu_cafe/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addToCart(Food food) {
    Navigator.pop(context);
    context.read<Restaurant>().addToCart(food);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Image.asset(widget.food.imagePath,
              height: 350,),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(widget.food.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)
              ),

              const SizedBox(height: 10),

              Text('\$${widget.food.price.toString()}',
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary)
              ),

              const SizedBox(height: 10),

              Divider(color: Theme.of(context).colorScheme.secondary),

              const Text("Options"),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text('Option $index'),
                      value: false,
                      onChanged: (value) {},
                    );
                  },
                ),
              )
            ]
            ),
          ),

          MyButton(
            onTap: () => addToCart(widget.food), 
            text: "Add to cart"
          ),

          const SizedBox(height: 10)
        ]
        ),
      ),
    );
  }
}
