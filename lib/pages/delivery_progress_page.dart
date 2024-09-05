import 'package:flutter/material.dart';
import 'package:flutter_nu_cafe/components/my_button.dart';
import 'package:flutter_nu_cafe/components/my_receipt.dart';

class DeliveryProgressPage extends StatefulWidget {

  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery in Progress'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const MyReceipt(),
          const Spacer(),
          MyButton(
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            text: "OK"
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}