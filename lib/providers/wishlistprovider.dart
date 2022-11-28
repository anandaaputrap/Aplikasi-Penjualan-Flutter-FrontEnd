import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:projekakhir/models/produkmodel.dart';

class WishlistProvider with ChangeNotifier{

  List<ProdukModel> _wishlist = [];
  List<ProdukModel> get wishlist => _wishlist;

  set wishlist(List<ProdukModel> wishlist){
    _wishlist = wishlist;
    notifyListeners();
  }  

  setProduk(ProdukModel produk){
    if(!isWishlist(produk)){
      _wishlist.add(produk);
    }else{
      _wishlist.removeWhere((element) => element.id == produk.id);
    }

    notifyListeners();
  }

  isWishlist(ProdukModel produk){
    if(_wishlist.indexWhere((element) => element.id == produk.id) == -1){
      return false;
    }else{
      return true;
    }
  }
}