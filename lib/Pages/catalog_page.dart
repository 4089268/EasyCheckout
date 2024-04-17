import 'package:flutter/material.dart';
import 'package:easy_checkout/Components/card_product.dart';
import 'package:easy_checkout/data/context.dart';
import 'package:easy_checkout/models/product.dart';
import 'package:easy_checkout/Components/my_drawer.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {

  final EasyCheckoutContext easyCheckoutContext = EasyCheckoutContext();

  late SliverGridDelegate sliverGridDelegate;

  @override
  Widget build(BuildContext context) {
    buildSliverGridDelegate(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:  const Text("Productos"),
          backgroundColor: Theme.of(context).colorScheme.surface,
          bottom: buildTabMenu()
        ),
        drawer: const MyDrawer(),
        body: TabBarView(
          children: [
            
            buildGrid(context, 0),

            buildGrid(context, 1),

            buildGrid(context, 2)

          ],
        ),
      ),
    );
  }

  void buildSliverGridDelegate(BuildContext context){
    sliverGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: MediaQuery.of(context).size.width / ( MediaQuery.of(context).size.height / 1),
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 20.0
    );
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

  Widget buildGrid(BuildContext context, int indexTab){

    List<Product> _products = [];
    
    switch( indexTab){
      case 0:
        _products = easyCheckoutContext.groceryProducts.take(20).toList();
        break;

      case 1:
        _products = easyCheckoutContext.groceryProducts.skip(20).take(20).toList();
        break;

      case 2:
        _products = easyCheckoutContext.groceryProducts.skip(40).take(10).toList();
        break;

    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: _products.length,
          gridDelegate: sliverGridDelegate,
          itemBuilder: (context, index){
            final _product = _products[index];
            return CardProduct(_product);
          }
        ),
      ),
    );
    
  }

}