import 'package:flutter/material.dart';
import 'package:easy_checkout/Components/my_drawer.dart';

class ShopBagPage extends StatefulWidget {
  const ShopBagPage({super.key});

  @override
  State<ShopBagPage> createState() => __ShopBagPageState();
}

class __ShopBagPageState extends State<ShopBagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Shop Bag"),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      drawer: const MyDrawer(),
      body: const Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star),
                SizedBox( height: 10),
                Text( "Hola mundo",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ],
            )
          )
        ],
      )
    );
  }
}
