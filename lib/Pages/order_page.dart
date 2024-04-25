import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_checkout/models/invoice_item.dart';
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
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  children:[
                    ...easyCheckoutContext.invoiceItems.map<Widget>( (invoiceItem) => InvoiceItemCard(invoiceItem) )
                  ],
                ),
              ),

            ],
          ),
        );
      })
    );
  }

}


class InvoiceItemCard extends StatelessWidget {
  final InvoiceItem invoiceItem;
  const InvoiceItemCard( this.invoiceItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black26,
          width: 1.0
        ),
        borderRadius: BorderRadius.circular( 12.0)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          // Image
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Image.asset("assets/img/p1.jpg",
                fit: BoxFit.contain
              )
            ),
          ),

          // Product Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( invoiceItem.product.name, style: const TextStyle(fontSize: 24.0 ) ),
                  Text( invoiceItem.amount.toString(), style: const TextStyle(fontSize: 22.0 ) ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
