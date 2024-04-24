import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_checkout/Components/card_product.dart';
import 'package:easy_checkout/data/easycheckout_context.dart';
import 'package:easy_checkout/models/product.dart';
import 'package:easy_checkout/Components/my_drawer.dart';
import 'package:easy_checkout/Components/basket_button.dart';
import 'package:easy_checkout/Pages/order_page.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {

  @override
  Widget build(BuildContext context) {

    return Consumer<EasyCheckoutContext>( builder: (context, easyCheckoutContext, child){
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title:  const Text("Productos"),
              backgroundColor: Theme.of(context).colorScheme.surface,
              bottom: buildTabMenu(),
              actions: [
                ShoppingBagButton(
                  onPressed: ()=> navigateToOrderPage(context, easyCheckoutContext)
                )
              ],
            ),
            drawer: const MyDrawer(),
            body: TabBarView(
              children: [
                
                buildGrid(context, easyCheckoutContext, 0),

                buildGrid(context, easyCheckoutContext, 1),

                buildGrid(context, easyCheckoutContext, 2)

              ],
            ),
          ),
        );
    });

  } 

  TabBar buildTabMenu(){
    return const TabBar(
      tabs: [
        Tab(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            child: Text("Categoria 1"),
          ),
        ),

        Tab(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            child: Text("Categoria 2"),
          ),
        ),

        Tab(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            child: Text("Categoria 3"),
          ),
        )
      ],
    );
  }

  Widget buildGrid(BuildContext context, EasyCheckoutContext easyCheckoutContext, int indexTab){

    List<Product> productsList = [];
    
    switch( indexTab){
      case 0:
        productsList = easyCheckoutContext.groceryProducts.take(20).toList();
        break;

      case 1:
        productsList = easyCheckoutContext.groceryProducts.skip(20).take(20).toList();
        break;

      case 2:
        productsList = easyCheckoutContext.groceryProducts.skip(40).take(10).toList();
        break;

    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child:  GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: .75,
        children: [
          ...productsList.map<Widget>( (product) => CardProduct(
            product,
            productIsSelected: easyCheckoutContext.productIsSelected(product.id),
            ammountChanged: (ammount) => easyCheckoutContext.changeProductAmmount(product, ammount),
          ))
        ]
      )
    );
    
  }

  void navigateToOrderPage(BuildContext context, EasyCheckoutContext easyCheckoutContext){
    if( easyCheckoutContext.invoiceItems.isNotEmpty ){
      Navigator.of(context).push( MaterialPageRoute(builder: (_) => const OrderPage()) );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("No hay elementos seleccionado",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),  
          )
        )
      );
    }
  }

}