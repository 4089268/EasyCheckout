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
    return -1;
  }

  Invoice({ required this.user, this.name} ):
    createdAt = DateTime.now(),
    id = const Uuid().v4();

  void addProduct( Product product, int amount ){
    var _index = _items.indexWhere((element) => element.product.id == product.id);
    if( _index != -1){
        // Product exist in the list, update the ammount
        _items[_index].amount += amount;
    }
    else{
      // Product does not exist on th elist, add them
      _items.add( InvoiceItem(product:product, amount: amount) );
    }
  }

  void closeTicket(){
    closedAt = DateTime.now();

  }
}