import 'package:daily5/models/inventorymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../helpers/DBHelper.dart';

class InventoryProvider with ChangeNotifier {
  DBHelper dbHelper = DBHelper();
  int _quantity = 1;
  int get quantity => _quantity;


  List<Inventory> inventory = [];

  Future<List<Inventory>> getData() async {
    inventory = await dbHelper.getInventoryList();
    notifyListeners();
    return inventory;
  }

  void _setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('item_quantity', _quantity);
    notifyListeners();
  }

  void _getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _quantity = prefs.getInt('item_quantity') ?? 1;
  }

  int getQuantity(int quantity) {
    _getPrefsItems();
    return _quantity;
  }


}

