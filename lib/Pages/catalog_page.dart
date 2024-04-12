import 'package:flutter/material.dart';

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
        backgroundColor: Colors.teal,
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

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: Image.asset("assets/img/logo.png"),
            currentAccountPictureSize: const Size(250, 75),
            accountName: const Text("EasyCheckout"),
            accountEmail: const Text("subtitle")
          )
        ],
      ),
    );
  }
}