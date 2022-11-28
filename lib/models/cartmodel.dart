import 'package:projekakhir/models/produkmodel.dart';

class CartModel {
  int id;
  ProdukModel product;
  int quantity;

  CartModel({
    this.id,
    this.product,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    product = ProdukModel.fromJson(json['product']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    return product.harga * quantity;
  }

  double getSubTotal() {
    return (product.harga * quantity) + 20000;
  }
}