import 'package:easy_checkout/Pages/catalog_page.dart';
import 'package:easy_checkout/models/invoice.dart';
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
        child: 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                
                // Logo image
                Center(
                  child: Image.asset("assets/img/logo.png", width: MediaQuery.of(context).size.width / 2,),
                ),

                const SizedBox(
                  height: 12.0,
                ),

                Center( 
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Ticket Activos", style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold
                    )),
                  )
                ),

                // List current tickets
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0)
                    ),
                    child: ListView(
                      children: [
                        buildListTile(context, null),
                        buildListTile(context, null),
                        buildListTile(context, null),
                        buildListTile(context, null),
                        buildListTile(context, null),
                        buildListTile(context, null),
                        
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white
                        ),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute( builder: (_) => const CatalogPage() )
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only( right: 12.0),
                              child: Icon(Icons.add_shopping_cart),
                            ),
                            Text("Agregar nuevo ticket", style: TextStyle(
                              fontSize: 18.0
                            )),
                          ],
                        ) 
                      ),
                  
                    ],
                  ),
                )

              ],
            ),
          )
      ),
    );
  }


  Widget buildListTile( BuildContext context, Invoice? invoice ){
    return Card(
      child: ListTile(
        leading: Icon( Icons.pages_sharp, color: Colors.grey.shade700 ),
        title: Text("Ticket 1"),
        subtitle: Text("fecha - total"),
      ),
    );

  }

}
