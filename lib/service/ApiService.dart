import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_crud/model/Kontak.dart';
import 'package:flutter_crud/response/KontakResponse.dart';

class ApiService {
  final String baseUrl = "http://belajar.baydhowi.net/rest/api/";
  static String username = 'user';
  static String password = 'demo';
  final String key = 'r4h4514';
  final String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  KontakResponse r = new KontakResponse();

  Future<List<Kontak>> getAllKontak() async {
    Map<String, dynamic> inputMap = {'DEMO-API-KEY': '$key'};
    final response = await http.post(
      baseUrl + "kontak/read",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "authorization": basicAuth
      },
      body: inputMap,
    );

    r = KontakResponse.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      List<Kontak> data = r.data;
      return data;
    } else {
      return null;
    }
  }

  Future<Kontak> create(Kontak kontak) async {
    Map<String, dynamic> inputMap = {
      'DEMO-API-KEY': '$key',
      'nama_depan': kontak.namaDepan,
      'nama_belakang': kontak.namaBelakang,
      'no_telepon': kontak.noTelepon
    };
    final response = await http.post(
      baseUrl + "kontak/create",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "authorization": basicAuth
      },
      body: inputMap,
    );

    r = KontakResponse.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      Kontak data = r.data[0];
      return data;
    } else {
      return null;
    }
  }

  Future<Kontak> update(Kontak kontak) async {
    Map<String, dynamic> inputMap = {
      'DEMO-API-KEY': '$key',
      'nama_depan': kontak.namaDepan,
      'nama_belakang': kontak.namaBelakang,
      'no_telepon': kontak.noTelepon,
      'id': kontak.id
    };
    final response = await http.post(
      baseUrl + "kontak/update",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "authorization": basicAuth
      },
      body: inputMap,
    );

    r = KontakResponse.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      Kontak data = r.data[0];
      return data;
    } else {
      return null;
    }
  }

  Future<Kontak> delete(String id) async {
    Map<String, dynamic> inputMap = {
      'DEMO-API-KEY': '$key',
      'id': id
    };
    final response = await http.post(
      baseUrl + "kontak/delete",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "authorization": basicAuth
      },
      body: inputMap,
    );

    r = KontakResponse.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      Kontak data = r.data[0];
      return data;
    } else {
      return null;
    }
  }
}
