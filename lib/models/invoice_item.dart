import 'package:uuid/uuid.dart';
import 'package:easy_checkout/models/product.dart';

class InvoiceItem {
  
  final String id;
  Product product;
  int get productId => product.id;
  int amount;
  String? comments;
  double get total {
    return product.price * amount;
  } 
  

  InvoiceItem( { required this.product, required this.amount, this.comments} )
    : id = const Uuid().v4();

}