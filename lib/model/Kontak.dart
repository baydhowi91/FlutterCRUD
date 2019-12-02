import 'dart:convert';

class Kontak {
  String id;
  String namaDepan;
  String namaBelakang;
  String noTelepon;

  Kontak({this.id, this.namaDepan, this.namaBelakang, this.noTelepon});

  factory Kontak.fromJson(Map<String, dynamic> map) {
    return Kontak(
        id: map["id"],
        namaDepan: map["nama_depan"],
        namaBelakang: map["nama_belakang"],
        noTelepon: map["no_telepon"]);
  }

  static List<Kontak> kontakFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Kontak>.from(data.map((item) => Kontak.fromJson(item)));
  }
}
