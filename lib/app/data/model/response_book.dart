/// status : true
/// message : "DataBook Ditemukan"
/// data : [{"id":1,"judul":"Maling Kondang","kategori_id":1,"penulis":"Atta Gledek","penerbit":"Geng Petir","image":null,"tanggal_publikasi":"2020-01-20","status":"TERSEDIA","created_at":"2024-01-23T20:56:41.000000Z","updated_at":"2024-01-23T21:52:12.000000Z"},null]

class ResponseBook {
  ResponseBook({
      this.status, 
      this.message, 
      this.data,});

  ResponseBook.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBook.fromJson(v));
      });
    }
  }
  bool? status;
  String? message;
  List<DataBook>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// judul : "Maling Kondang"
/// kategori_id : 1
/// penulis : "Atta Gledek"
/// penerbit : "Geng Petir"
/// image : null
/// tanggal_publikasi : "2020-01-20"
/// status : "TERSEDIA"
/// created_at : "2024-01-23T20:56:41.000000Z"
/// updated_at : "2024-01-23T21:52:12.000000Z"

class DataBook {
  DataBook({
      this.id, 
      this.judul, 
      this.kategoriId, 
      this.penulis, 
      this.penerbit, 
      this.image, 
      this.tanggalPublikasi, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  DataBook.fromJson(dynamic json) {
    id = json['id'];
    judul = json['judul'];
    kategoriId = json['kategori_id'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    image = json['image'];
    tanggalPublikasi = json['tanggal_publikasi'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? judul;
  int? kategoriId;
  String? penulis;
  String? penerbit;
  dynamic image;
  String? tanggalPublikasi;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['judul'] = judul;
    map['kategori_id'] = kategoriId;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['image'] = image;
    map['tanggal_publikasi'] = tanggalPublikasi;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}