import 'package:easy_checkout/Pages/catalog_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: AppBar(
        title: const Text("Easy Checkout", style: TextStyle(
          color: Colors.white,
          fontSize: 24
        )),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.amber
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Center(
                    child: Image.asset("assets/img/logo.png", width: MediaQuery.of(context).size.width / 2,),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.2,
                  ),

                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white
                    ),
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute( builder: (_) => const CatalogPage() )
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Productos", style: TextStyle(
                          fontSize: 18.0
                        )),
                        Padding(
                          padding: EdgeInsets.only( left: 12.0),
                          child: Icon(Icons.shopping_basket),
                        ),
                      ],
                    ) 
                  ),

                ],
              ),
            )
          ],
        )
      ),
    );
  }

  Widget buildDrawer() {
    return const Drawer(
      backgroundColor: Colors.teal,
      child: Column(
        children: [
          Text("Hola mundo"),
          Text("Este es un drawer")
        ],
      ),
    );
  }

}