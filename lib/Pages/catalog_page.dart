import 'package:flutter/material.dart';
import 'package:easy_checkout/Components/my_drawer.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Productos"),
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