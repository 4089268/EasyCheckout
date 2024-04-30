import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_checkout/data/invoice_provider.dart';
import 'package:easy_checkout/models/invoice.dart';
import 'package:easy_checkout/Pages/catalog_page.dart';
import 'package:easy_checkout/data/easycheckout_context.dart';

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
      
      body: Padding(
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
                child: Text("Ticket Activos ${context.watch<EasyCheckoutContext>().invoices.length}" , style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold
                )),
              )
            ),
      
            // List current tickets
            Visibility(
              visible: context.watch<EasyCheckoutContext>().invoices.isNotEmpty,
              child: Expanded(
                child: ListTickets(
                  onTicketPress: (invoiceId) => handleTicketClick(context, invoiceId),
                )
              ),
            ),
            
            ButtonNewTicket( onPressed: () => handleNewTicketButtonClick(context) ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8,8,8,24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: ()=>{},
                    child: const Row(
                      children: [
                        Icon(Icons.set_meal),
                        Text("Sample Action 1"),
                      ],
                    )
                  ),
              
                  ElevatedButton(
                    onPressed: ()=>{},
                    child: const Row(
                      children: [
                        Icon(Icons.code_off_rounded),
                        Text("Sample Action 2"),
                      ],
                    )
                  ),
                  ElevatedButton(
                    onPressed: ()=>{},
                    child: const Row(
                      children: [
                        Icon(Icons.code_off_rounded),
                        Text("Sample Action 3"),
                      ],
                    )
                  )
                ],
              ),
            )
      
          ],
        ),
      ),
    );
  }


  void handleNewTicketButtonClick(BuildContext context){
    var newInvoiceId = context.read<EasyCheckoutContext>().addInvoice();
    handleTicketClick(context, newInvoiceId );
  }

  void handleTicketClick(BuildContext context, String invoiceId){
    Invoice? invoice = context.read<EasyCheckoutContext>().getInvoiceById(invoiceId);
    if( invoice != null){
      context.read<InvoiceProvider>().setInvoice( invoice );
      Navigator.of(context).push(
        MaterialPageRoute( builder: (_) => const CatalogPage() )
      );
    }else{
      // TODO: Show message
    }
  }
}

class ListTickets extends StatelessWidget {
  final Function(String) onTicketPress;
  const ListTickets({ required this.onTicketPress, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: ListView(
        children: context.watch<EasyCheckoutContext>().invoices.map<Widget>( (invoice) {
          
          return ListTile(
            onTap: ()=> onTicketPress(invoice.id) ,
            leading: Icon( Icons.pages_sharp, color: Colors.grey.shade700 ),
            title: Text( invoice.name??"*Ticket Nuevo"),
            subtitle: Text( invoice.createdAt.toIso8601String() ),
          );

        }).toList(),
      ),
    );

  }
}

class ButtonNewTicket extends StatelessWidget {
  final Function onPressed;
  const ButtonNewTicket({ required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white
            ),
            onPressed: () => onPressed(),
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
    );
  }
}
