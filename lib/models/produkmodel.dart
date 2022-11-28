import 'package:projekakhir/models/galerimodel.dart';
import 'package:projekakhir/models/kategorimodel.dart';

class ProdukModel {
  int id;
  String nama_produk;
  double harga;
  String deskripsi;
  String tags;
  int stok_produk;
  KategoriModel category;
  DateTime createdAt;
  DateTime updateAt;
  DateTime deleteAt;
  List<GaleriModel> galleries;

  ProdukModel({
    this.id,
    this.nama_produk,
    this.harga,
    this.deskripsi,
    this.tags,
    this.stok_produk,
    this.category,
    this.createdAt,
    this.updateAt,
    this.deleteAt,
    this.galleries,
  });

  ProdukModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_produk = json['nama_produk'];
    harga = double.parse(json['harga'].toString());
    deskripsi = json['deskripsi'];
    tags = json['tags'];
    stok_produk = json['stok_produk'];
    category = KategoriModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GaleriModel>((gallery) => GaleriModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updateAt = DateTime.parse(json['updated_at']);
    deleteAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_produk': nama_produk,
      'harga': harga,
      'deskripsi': deskripsi,
      'tags': tags,
      'stok_produk' : stok_produk,
      'category': category.toJson(),
      'createdAt': createdAt.toString(),
      'updateAt': updateAt.toString(),
      'deleteAt': deleteAt.toString(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
    };
  }
}