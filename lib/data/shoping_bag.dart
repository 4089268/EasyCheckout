// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:easy_checkout/models/invoice_item.dart';
import 'package:easy_checkout/models/product.dart';

class ShopingBag extends ChangeNotifier {
  Map<String, InvoiceItem> _items = {};
  Map<String, InvoiceItem> get items {
    return { ..._items};
  }
  double get total {
    var _total =  0.0;
    _items.forEach((key, value) => _total += ( value.amount * value.product.price) );
    return _total;
  }

  void addItem( Product product, int ammount, String? comments  ){

    // Validate if already is stored and update
    if( _items.values.map((e) => e.product.id).contains(product.id) ){
      var _invoiceItemId = _items.values.where((element) => element.product.id == product.id).first.id;
      _items.update( _invoiceItemId, (value) => InvoiceItem (
        value.product,
        value.name,
        value.amount + ammount,
        comments: comments
      ));

    }else{
      var invoiceItem = InvoiceItem( product, product.name, ammount, comments: comments );
      _items.putIfAbsent( invoiceItem.id, () => invoiceItem );
    }

  }

  void updateAmmount( Product product, int newAmmount){
    var _invoiceItem = _items.values.where((element) => element.product.id == product.id).firstOrNull;
    if(_invoiceItem != null){

      if( newAmmount <= 0 ){
        _items.remove( _invoiceItem.id );
        return;
      }

      _items.update( _invoiceItem.id, (value) => InvoiceItem(
        product,
        product.name,
        newAmmount
      ));
    }

  }
  
}