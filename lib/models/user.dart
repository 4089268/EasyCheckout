import 'package:uuid/uuid.dart';

class User {

  final String id;
  String name;
  
  User( {required this.name } )
    : id = const Uuid().v4();

}