import 'package:flutter/material.dart';

import 'package:easy_checkout/Pages/catalog_page.dart';
import 'package:easy_checkout/Pages/shopbag_page.dart';
import 'package:easy_checkout/Pages/home_page.dart';

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
            accountName: Text("EasyCheckout", style: TextStyle( color: Theme.of(context).colorScheme.primary) ),
            accountEmail: Text("subtitle", style: TextStyle( color: Theme.of(context).colorScheme.primary)),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background
            ),
          ),

          InkWell(
            child: const ListTile(
              title: Text("Inicio"),
              leading: Icon(Icons.home),
            ),
            onTap: ()=> navigateTo(context, 'home')
          ),

          InkWell(
            child: const ListTile(
              title: Text("Catalogo"),
              leading: Icon(Icons.book),
            ),
            onTap: ()=> navigateTo(context, 'catalog')
          ),

          InkWell(
            child: const ListTile(
              title: Text("Vista Pedido"),
              leading: Icon(Icons.shopping_basket),
            ),
            onTap: ()=> navigateTo(context, 'shopbag')
          ),

          InkWell(
            child: const ListTile(
              title: Text("Informacion"),
              leading: Icon(Icons.info_rounded),
            ),
            onTap: ()=> navigateTo(context, 'information')
          ),

          InkWell(
            child: const ListTile(
              title: Text("Configuracion"),
              leading: Icon(Icons.settings),
            ),
            onTap: ()=> navigateTo(context, 'settings')
          )

        ],
      ),
    );
  }


  void navigateTo(context, destination){
    
    switch(destination){
      case "home":
        Navigator.popUntil(context, ModalRoute.withName("/") );
        break;

      case "catalog":
        Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (_) => const CatalogPage()) );
        break;

      case "shopbag":
        Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (_) => const ShopBagPage()) );
        break;

      case "information":
        Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (_) => const HomePage()) );
        break;

      case "settings":
        Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (_) => const HomePage()) );
        break;
        
    }
    
  }
}