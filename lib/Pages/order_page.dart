import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:easy_checkout/data/easycheckout_context.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => __OrderPageState();
}

class __OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedido #0000"),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Consumer<EasyCheckoutContext>(builder: (context, easyCheckoutContext, child){
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Stack(
                    children: [

                      const Positioned(
                        top: 4.0,
                        right: 4.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric( horizontal: 8.0, vertical: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Ticket", style: TextStyle(fontSize: 16.0) ),
                              Text("001", style: TextStyle(fontSize: 28.0))
                            ],
                          ),
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Usuario", style: TextStyle(fontSize: 16.0) ),
                                Text("Salvador Rangel", style: TextStyle(fontSize: 22.0)),
                              ],
                            ),
                          ),
                      
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Productos", style: TextStyle(fontSize: 16.0) ),
                                Text("666", style: TextStyle(fontSize: 22.0)),
                              ],
                            ),
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              
                              TextButton(
                                onPressed: ()=>{},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red.shade400,
                                  elevation: 12.0,
                                ),
                                child: const Text( "Cancelar Ticket",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  )
                                ),
                              ),
                      
                              TextButton(
                                onPressed: ()=>{},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue.shade400,
                                  elevation: 12.0,
                                ),
                                child: const Text( "Procesar Pago",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white
                                  )
                                ),
                              ),
                      
                            ],
                          )
                        ],
                      ),

                    ]
                  ),
                ),
              ),

              Expanded(
                child: ListView(
                  children: const [

                    InvoiceItemCard(),
                    InvoiceItemCard(),
                    InvoiceItemCard(),
                    InvoiceItemCard(),
                    InvoiceItemCard(),
                    InvoiceItemCard(),

                    
                    

                  ],
                ),
              ),

              Expanded(
                child: Card(
                  child: DataTable(
                    columns: const [
                      DataColumn( label: Text("Producto") ),
                      DataColumn( label: Text("Preci Unit."), numeric: true ),
                      DataColumn( label: Text("Cantidad"), numeric: true ),
                      DataColumn( label: Text("Total"), numeric: true ),
                    ],
                    rows: [
                      ...easyCheckoutContext.invoiceItems.map<DataRow>((e){
                        return DataRow(
                          cells:[
                            DataCell( 
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.local_grocery_store),
                                  ),
                                  Text(e.product.name)
                                ],
                              )
                            ),
                            DataCell( Text(e.product.price.toString()) ),
                            DataCell(
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: ()=>{}
                                  ),

                                  Text(e.amount.toString()),

                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: ()=>{},
                                  )
                                ],
                              )
                            ),
                            DataCell( Text(e.total.toStringAsPrecision(3)) ),
                          ]
                        );
                      })
                    ],
                  ),
                )
                
              ),
            ],
          ),
        );
      })
    );
  }

}


class InvoiceItemCard extends StatelessWidget {
  const InvoiceItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * .4,
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: const BoxDecoration(
        border: Border( bottom: BorderSide(width: 1, color: Colors.black12))
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .4,
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: Image.asset("assets/img/p1.jpg",
              fit: BoxFit.contain
            )
          ),

          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("** datos del producto"),
            )
          )
        ],
      ),
    );
  }
}
