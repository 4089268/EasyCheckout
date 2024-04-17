import 'package:easy_checkout/models/product.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  const CardProduct( this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Column(
        
        children: [

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset("assets/img/p2.jpg", fit: BoxFit.fitHeight),
            )
          ),

          Text( product.image??"", 
            style: const TextStyle(
              fontSize: 10.0
            )
          ),

          // Title
          Text( product.name, style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary
          )),

          // Price
          Text( product.price.toString(), style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary
          )),

        ],
      ),
    );
  }
}