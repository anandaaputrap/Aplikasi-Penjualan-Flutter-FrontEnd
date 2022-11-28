class KategoriModel {
  int id;
  String nama_kategori;

  KategoriModel({
    this.id,
    this.nama_kategori,
  });

  KategoriModel.fromJson(Map<String, dynamic> json){
    print('FROM JSON: $json');
    print('id: ${json['id']}');
    print('nama: ${json['nama_kategori']}');

    id = json['id'];
    nama_kategori = json['nama_kategori'];
  }
  Map<String, dynamic> toJson(){
    return {
    'id': id,
    'nama_kategori': nama_kategori,
    };
  }
}