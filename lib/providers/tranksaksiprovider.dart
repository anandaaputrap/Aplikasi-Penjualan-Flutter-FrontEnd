import 'package:flutter/material.dart';
import 'package:projekakhir/models/cartmodel.dart';
import 'package:projekakhir/models/transactionmodel.dart';
import 'package:projekakhir/models/usermodel.dart';
import 'package:projekakhir/services/transaksiservice.dart';

class TransactionProvider with ChangeNotifier{
  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  set transactions(List<TransactionModel> transactions) {
    _transactions = transactions;
    notifyListeners();
  }

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice, UserModel alamat, double subTotal) async {
    try {
      if (await TransaksiService().checkout(token, carts, totalPrice, alamat, subTotal)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);

      return false;
    }
  }

  Future<void>getTransactions(UserModel user) async {
    try {
      List<TransactionModel> transactions = await TransaksiService().getTransaction(user);
      _transactions = transactions;
    } catch (e) {
      print(e);
    }
  }
}