import 'package:uuid/uuid.dart';
import 'package:easy_checkout/models/product.dart';

class InvoiceItem {
  final String id;
  Product product;
  String name;
  int amount;
  String? comments;

  double get total {
    return product.price * amount;
  } 

  InvoiceItem( this.product, this.name, this.amount, { this.comments} ): id = const Uuid().v4();

}