import 'package:flutter/foundation.dart';
import 'package:easy_checkout/models/invoice.dart';
import 'package:easy_checkout/models/product.dart';

class InvoiceProvider with ChangeNotifier {
  Invoice? _invoiceSelected;

  Invoice? get invoice => _invoiceSelected;
  
  String get labelTotalProducts {
    return _invoiceSelected!.items.length > 9
      ? "+9"
      : _invoiceSelected!.items.length.toString();
  }

  void setInvoice( Invoice invoice){
    _invoiceSelected = invoice;
    notifyListeners();
  }

  bool productIsSelected(int productId){
    return false;
  }

  void closeInvoice(){
    // TODO: Store in database

    // TODO: Remove current invoice

    // TODO: Return to home page
    
    notifyListeners();
  }

  void addProduct(Product product, int amount){
    if( _invoiceSelected == null){
      return;
    }

    if( amount > 0){
      _invoiceSelected!.addProduct(product, amount);
    }else{
      _invoiceSelected!.removeProduct(product.id);
    }
    
    notifyListeners();
  }
}