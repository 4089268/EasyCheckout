import 'package:easy_checkout/models/product.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {

  final Function(int)? ammountChanged;
  
  final Product product;
  final bool productIsSelected;

  const CardProduct( this.product, { this.ammountChanged, required this.productIsSelected,  super.key});

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
              child: Image.asset("assets/img/image_not_available_sm.png", fit: BoxFit.fitHeight),
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

          CounterButton(
            productIsSelected: productIsSelected,
            ammountChanged: (ammount) =>  ammountChanged?.call(ammount)
          )
        ],
      ),
    );
  }
}



class CounterButton extends StatefulWidget {

  final Function(int) ammountChanged;

  final bool productIsSelected;
  
  const CounterButton({ required this.ammountChanged, required this.productIsSelected, super.key});
  
  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color:  widget.productIsSelected ?Colors.amber.shade700 :Colors.amber.shade400,
            borderRadius: BorderRadius.circular(24.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: decrement,
              ),
              
              const SizedBox(width: 5),
              
              Text(
                '$counter',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),

              const SizedBox(width: 5),
              
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: increment,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void increment(){
    setState(() {
      counter++;
    });

    widget.ammountChanged(counter);
  }

  void decrement(){
    setState(() {
      if( counter > 0){
        counter--;
      }
    });

    widget.ammountChanged(counter);
  }

}