
import 'package:projekakhir/models/galerimodel.dart';
class TransactionModel {
  int id;
  String user_id;
  String alamat;
  double total_harga;
  double biaya_kirim;
  String status;
  String metode_pembayaran;
  String created_at;
  // List<GaleriModel> galleries;

  TransactionModel(
      {
      this.id,
      this.user_id,
      this.alamat,
      this.total_harga,
      this.biaya_kirim,
      this.status,
      this.metode_pembayaran,
      this.created_at,
      //this.galleries
      });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    print('print : $json');
    id = json['id'];
    user_id = json['name'];
    alamat = json['alamat'];
    total_harga = double.parse(json['total_harga'].toString());
    biaya_kirim = double.parse(json['biaya_kirim'].toString());
    status = json['status'];
    metode_pembayaran = json['metode_pembayaran'];
    created_at = json['created_at'];
    // galleries = json['galleries']
    //     .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
    //     .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': user_id,
      'alamat': alamat,
      'total_harga': total_harga,
      'biaya_kirim': biaya_kirim,
      'status': status,
      'metode_pembayaran': metode_pembayaran,
      'created_at' : created_at,
      //'galleries': galleries.map((gallery) => gallery.toJson()).toList()
    };
  }
}