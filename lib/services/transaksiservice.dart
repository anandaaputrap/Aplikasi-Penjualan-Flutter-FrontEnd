import 'dart:convert';
import 'package:projekakhir/models/cartmodel.dart';
import 'package:http/http.dart' as http;
import 'package:projekakhir/models/transactionmodel.dart';
import 'package:projekakhir/models/usermodel.dart';

class TransaksiService {
  String baseurl = 'http://10.0.2.2:8000/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice, UserModel user, double subTotal) async {
    var url = Uri.parse('$baseurl/checkout');
    var headers = {
      'Content-type': 'application/json',
      'Accept' : 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'alamat': user.alamat,
        'items': carts
            .map(
              (cart) => {
                'id': cart.product.id,
                'quantity': cart.quantity,
              },
            )
            .toList(),
        'status': 'PENDING',
        'metode_pembayaran': 'COD',
        'total_harga': subTotal,
        'biaya_kirim': 20000,
      },
    );
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout');
    }
  }

  Future<List<TransactionModel>> getTransaction(UserModel user) async {
    var id = user.id;
    var url = Uri.parse('$baseurl/transactions/$id');
    var headers = {
      'Content-type': 'application/json',
      'Authorization': user.token,
    };
    var body = jsonEncode(
      {'user_id': user.id},
    );
    var response = await http.get(url, headers: headers);

    print(response.body);
   

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<TransactionModel> transaction = [];

      for (var item in data) {
        transaction.add(TransactionModel.fromJson(item));
      }
      //print(transaction);   
      return transaction;
    } else {
      throw Exception('Gagal Mengambil Transaksi');
    }
  }
}