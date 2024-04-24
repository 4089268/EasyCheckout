import 'package:easy_checkout/models/invoice_item.dart';
import 'package:flutter/foundation.dart';
import 'package:easy_checkout/models/product.dart';

class EasyCheckoutContext with ChangeNotifier, DiagnosticableTreeMixin{

  final List<InvoiceItem> _invoiceItems = [];

  List<InvoiceItem> get invoiceItems => _invoiceItems;

  late List<Product> groceryProducts;

  EasyCheckoutContext(){
    groceryProducts = [
      const Product(
        1,
        'Apples',
        2.99,
        image: 'https://example.com/apples.jpg',
        description: 'Fresh and juicy apples.',
      ),
      const Product(
        2,
        'Bananas',
        1.99,
        image: 'https://example.com/bananas.jpg',
        description: 'Ripe and delicious bananas.',
      ),
      const Product(
        3,
        'Milk',
        3.49,
        image: 'https://example.com/milk.jpg',
        description: 'Fresh dairy milk.',
      ),
      const Product(
        4,
        'Bread',
        2.49,
        image: 'https://example.com/bread.jpg',
        description: 'Soft and tasty bread loaf.',
      ),
      const Product(
        5,
        'Eggs',
        4.99,
        image: 'https://example.com/eggs.jpg',
        description: 'Farm-fresh eggs.',
      ),
      const Product(
        6,
        'Oranges',
        3.29,
        image: 'https://example.com/oranges.jpg',
        description: 'Sweet and tangy oranges.',
      ),
      const Product(
        7,
        'Potatoes',
        1.79,
        image: 'https://example.com/potatoes.jpg',
        description: 'Fresh potatoes for various dishes.',
      ),
      const Product(
        8,
        'Tomatoes',
        2.59,
        image: 'https://example.com/tomatoes.jpg',
        description: 'Ripe tomatoes for salads and cooking.',
      ),
      const Product(
        9,
        'Cucumbers',
        1.99,
        image: 'https://example.com/cucumbers.jpg',
        description: 'Crisp and refreshing cucumbers.',
      ),
      const Product(
        10,
        'Carrots',
        1.49,
        image: 'https://example.com/carrots.jpg',
        description: 'Fresh carrots for snacking and cooking.',
      ),
      const Product(
        11,
        'Chicken Breast',
        5.99,
        image: 'https://example.com/chicken_breast.jpg',
        description: 'Lean and protein-rich chicken breast.',
      ),
      const Product(
        12,
        'Salmon Fillet',
        8.49,
        image: 'https://example.com/salmon_fillet.jpg',
        description: 'Fresh and flavorful salmon fillet.',
      ),
      const Product(
        13,
        'Ground Beef',
        4.99,
        image: 'https://example.com/ground_beef.jpg',
        description: 'Quality ground beef for various recipes.',
      ),
      const Product(
        14,
        'Pasta',
        1.29,
        image: 'https://example.com/pasta.jpg',
        description: 'Versatile pasta for pasta dishes.',
      ),
      const Product(
        15,
        'Rice',
        2.79,
        image: 'https://example.com/rice.jpg',
        description: 'Long-grain rice for cooking.',
      ),
      const Product(
        16,
        'Yogurt',
        1.99,
        image: 'https://example.com/yogurt.jpg',
        description: 'Creamy yogurt for breakfast or snacks.',
      ),
      const Product(
        17,
        'Cheese',
        3.79,
        image: 'https://example.com/cheese.jpg',
        description: 'Assorted cheese for sandwiches and recipes.',
      ),
      const Product(
        18,
        'Butter',
        2.99,
        image: 'https://example.com/butter.jpg',
        description: 'Rich and creamy butter for cooking and baking.',
      ),
      const Product(
        19,
        'Olive Oil',
        5.49,
        image: 'https://example.com/olive_oil.jpg',
        description: 'High-quality olive oil for cooking.',
      ),
      const Product(
        20,
        'Biscuits',
        2.19,
        image: 'https://example.com/biscuits.jpg',
        description: 'Crunchy biscuits for tea or snacks.',
      ),
      const Product(
        21,
        'Cereal',
        3.99,
        image: 'https://example.com/cereal.jpg',
        description: 'Healthy cereal for breakfast.',
      ),
      const Product(
        22,
        'Coffee',
        6.49,
        image: 'https://example.com/coffee.jpg',
        description: 'Freshly ground coffee beans.',
      ),
      const Product(
        23,
        'Tea',
        3.29,
        image: 'https://example.com/tea.jpg',
        description: 'Assorted tea blends for a relaxing drink.',
      ),
      const Product(
        24,
        'Sugar',
        1.79,
        image: 'https://example.com/sugar.jpg',
        description: 'Granulated sugar for sweetening drinks and baking.',
      ),
      const Product(
        25,
        'Salt',
        0.99,
        image: 'https://example.com/salt.jpg',
        description: 'Table salt for seasoning dishes.',
      ),
      const Product(
        26,
        'Pepper',
        1.29,
        image: 'https://example.com/pepper.jpg',
        description: 'Ground black pepper for seasoning.',
      ),
      const Product(
        27,
        'Lettuce',
        1.49,
        image: 'https://example.com/lettuce.jpg',
        description: 'Fresh lettuce for salads and sandwiches.',
      ),
      const Product(
        28,
        'Onions',
        1.29,
        image: 'https://example.com/onions.jpg',
        description: 'Versatile onions for cooking.',
      ),
      const Product(
        29,
        'Garlic',
        0.79,
        image: 'https://example.com/garlic.jpg',
        description: 'Fresh garlic for seasoning dishes.',
      ),
      const Product(
        30,
        'Bell Peppers',
        2.99,
        image: 'https://example.com/bell_peppers.jpg',
        description: 'Colorful bell peppers for cooking.',
      ),
      const Product(
        31,
        'Lemons',
        2.49,
        image: 'https://example.com/lemons.jpg',
        description: 'Juicy lemons for flavoring dishes and drinks.',
      ),
      const Product(
        32,
        'Limes',
        1.99,
        image: 'https://example.com/limes.jpg',
        description: 'Fresh limes for cocktails and cooking.',
      ),
      const Product(
        33,
        'Avocados',
        1.99,
        image: 'https://example.com/avocados.jpg',
        description: 'Creamy avocados for guacamole and salads.',
      ),
      const Product(
        34,
        'Soy Sauce',
        2.79,
        image: 'https://example.com/soy_sauce.jpg',
        description: 'Traditional soy sauce for seasoning.',
      ),
      const Product(
        35,
        'Vinegar',
        1.49,
        image: 'https://example.com/vinegar.jpg',
        description: 'White vinegar for cooking and cleaning.',
      ),
      const Product(
        36,
        'Ketchup',
        1.99,
        image: 'https://example.com/ketchup.jpg',
        description: 'Classic ketchup for dipping and sauces.',
      ),
      const Product(
        37,
        'Mustard',
        1.29,
        image: 'https://example.com/mustard.jpg',
        description: 'Tangy mustard for sandwiches and dressings.',
      ),
      const Product(
        38,
        'Mayonnaise',
        2.49,
        image: 'https://example.com/mayonnaise.jpg',
        description: 'Creamy mayonnaise for sandwiches and salads.',
      ),
      const Product(
        39,
        'Salsa',
        2.99,
        image: 'https://example.com/salsa.jpg',
        description: 'Spicy salsa for dipping and sauces.',
      ),
      const Product(
        40,
        'Peanut Butter',
        3.99,
        image: 'https://example.com/peanut_butter.jpg',
        description: 'Smooth peanut butter for sandwiches and snacks.',
      ),
      const Product(
        41,
        'Jam',
        2.29,
        image: 'https://example.com/jam.jpg',
        description: 'Sweet jam for spreading on toast and pastries.',
      ),
      const Product(
        42,
        'Honey',
        4.49,
        image: 'https://example.com/honey.jpg',
        description: 'Natural honey for sweetening drinks and recipes.',
      ),
      const Product(
        43,
        'Baking Powder',
        1.99,
        image: 'https://example.com/baking_powder.jpg',
        description: 'Leavening agent for baking.',
      ),
      const Product(
        44,
        'Baking Soda',
        1.49,
        image: 'https://example.com/baking_soda.jpg',
        description: 'Versatile ingredient for baking and cleaning.',
      ),
      const Product(
        45,
        'Chocolate Chips',
        3.79,
        image: 'https://example.com/chocolate_chips.jpg',
        description: 'Semi-sweet chocolate chips for baking.',
      ),
      const Product(
        46,
        'Flour',
        2.29,
        image: 'https://example.com/flour.jpg',
        description: 'All-purpose flour for baking.',
      ),
      const Product(
        47,
        'Vanilla Extract',
        4.99,
        image: 'https://example.com/vanilla_extract.jpg',
        description: 'Pure vanilla extract for baking.',
      ),
      const Product(
        48,
        'Dish Soap',
        2.79,
        image: 'https://example.com/dish_soap.jpg',
        description: 'Effective dish soap for washing dishes.',
      ),
      const Product(
        49,
        'Paper Towels',
        3.49,
        image: 'https://example.com/paper_towels.jpg',
        description: 'Absorbent paper towels for cleaning up spills.',
      ),
      const Product(
        50,
        'Toilet Paper',
        4.99,
        image: 'https://example.com/toilet_paper.jpg',
        description: 'Soft toilet paper for bathroom use.',
      ),
    ];
  }


  void changeProductAmmount( Product product, int ammount){

    var productFounded = _invoiceItems.where((e) => e.product.id == product.id).isNotEmpty;

    // Remove produdct
    if( productFounded && ammount == 0 ){
      _invoiceItems.remove( _invoiceItems.where((element) => (element.product.id == product.id)).first );
      notifyListeners();
      return;
    }

    // Add the product
    if( productFounded ){
      _invoiceItems.where((invoice) => invoice.product.id == product.id).first.amount += ammount;
    }else{
      _invoiceItems.add( InvoiceItem( product, "name", ammount ));
    }

    notifyListeners();
  }

  String labelTotalProducts(){
    return _invoiceItems.length > 9
      ? "+9"
      : _invoiceItems.length.toString();
  }

  bool productIsSelected( int productId ){
    return _invoiceItems.where((element) => element.product.id == productId).isNotEmpty;
  }

}