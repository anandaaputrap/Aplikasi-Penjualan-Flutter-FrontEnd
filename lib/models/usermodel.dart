class UserModel{
  int id;
  String name;
  String email;
  String username;
  String nomor;
  String alamat;
  String profilePhotoUrl;
  String token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.nomor,
    this.alamat,
    this.profilePhotoUrl,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json){
    print('print : $json');
    
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    nomor = json['nomor'];
    alamat = json['alamat'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'nomor': nomor,
      'alamat': alamat,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}