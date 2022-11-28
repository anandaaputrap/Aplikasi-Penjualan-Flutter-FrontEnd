import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekakhir/models/produkmodel.dart';
import 'package:projekakhir/services/produkservice.dart';
class ProdukProvider with ChangeNotifier{
  List<ProdukModel> _produk = [];

  List<ProdukModel> get produk => _produk;

  set produk(List<ProdukModel> produk){
    _produk = produk;
    notifyListeners();
  }

  Future <void> getProduk() async{
    try{
      List<ProdukModel> produk = await ProdukService().getProduk();
      _produk = produk;
    }catch (e){
      print(e);
    }
  }
}