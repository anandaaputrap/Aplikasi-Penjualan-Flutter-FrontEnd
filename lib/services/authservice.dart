import 'dart:convert';
import 'package:projekakhir/models/usermodel.dart';
import 'package:http/http.dart' as http;

class AuthService{

  String baseurl = 'http://10.0.2.2:8000/api';

  Future<UserModel> register({
    String name,
    String username,
    String email,
    String nomor,
    String alamat,
    String password,
  }) async {
    var url = '$baseurl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({

      'name': name,
      'username': username,
      'email': email,
      'nomor': nomor,
      'alamat': alamat,
      'password': password,

    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

     print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Registrasi');
    }
  }
  Future<UserModel> login({
    String email,
    String password,
  }) async {
    var url = '$baseurl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({

      'email': email,
      'password': password,

    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

     print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}