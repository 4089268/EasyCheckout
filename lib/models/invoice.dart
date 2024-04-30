import 'package:uuid/uuid.dart';
import 'package:easy_checkout/models/invoice_item.dart';
import 'package:easy_checkout/models/product.dart';
import 'package:easy_checkout/models/user.dart';

class Invoice {

  final String id;
  User user;
  String? name;
  DateTime createdAt;
  DateTime? closedAt;
  final List<InvoiceItem> _items = [];
  List<InvoiceItem> get items => _items;
  double get total {
    return _items.fold( 0, (previousValue, element) => previousValue + element.total);
  }

  Invoice({ required this.user, this.name} ):
    createdAt = DateTime.now(),
    id = const Uuid().v4();

  void addProduct( Product product, int amount ){
    // Find produc 
    var _index = _items.indexWhere( (invoiceItem) => invoiceItem.productId == product.id);
    if( _index != -1){
      // Product exist in the list, update the amount
      _items[_index].amount += amount;
    }
    else{
      // Product does not exist on th elist, add them
      _items.add( InvoiceItem(product:product, amount: amount) );
    }
  }

  void removeProduct(int productId){
    _items.removeWhere((invoiceItem) => invoiceItem.productId == productId);
  }

  void closeTicket(){
    closedAt = DateTime.now();

  }
}