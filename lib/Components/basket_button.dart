import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_checkout/data/easycheckout_context.dart';

class ShoppingBagButton extends StatelessWidget {
  
  final Function onPressed;

  const ShoppingBagButton( { required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<EasyCheckoutContext>( builder: (context, easyCheckoutContext, child){

      return TextButton(
        onPressed: () => onPressed(),
        child: Stack(
          children: [

            Icon( Icons.shopping_basket,
              size: 38.0,
              color: Colors.grey.shade800
            ),

            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child:  Text( easyCheckoutContext.labelTotalProducts() ,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.black87
                  )
                ),
              )
            )

          ]
        )
      );

    });
    
  }
}