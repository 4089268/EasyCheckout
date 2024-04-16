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
            
             Container(
              child: const Center( 
                child: Text("Contenidon 1")
              ),
            ),

            Container(
              child: const Center(child: Text("Contenidon 2")),
            ),

            Container(
              child: const Center(child: Text("Contenidon 3")),
            ),

          ],
        ),
      ),
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
}