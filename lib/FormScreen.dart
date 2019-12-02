import 'package:flutter/material.dart';
import 'package:flutter_crud/model/Kontak.dart';
import 'package:flutter_crud/service/ApiService.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class FormScreen extends StatefulWidget {
  Kontak kontak;
  FormScreen({this.kontak});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  ApiService api = new ApiService();
  TextEditingController ctrlNamaDepan = new TextEditingController();
  TextEditingController ctrlNamaBelakang = new TextEditingController();
  TextEditingController ctrlNoTelepon = new TextEditingController();

  @override
  void initState() {
    if (this.widget.kontak != null) {
      ctrlNamaDepan.text = this.widget.kontak.namaDepan;
      ctrlNamaBelakang.text = this.widget.kontak.namaBelakang;
      ctrlNoTelepon.text = this.widget.kontak.noTelepon;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.kontak == null ? "Form Tambah" : "Form Update",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: ctrlNamaDepan,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nama Depan',
                hintText: 'Nama Depan',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: ctrlNamaBelakang,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nama Belakang',
                hintText: 'Nama Belakang',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: ctrlNoTelepon,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'No Telepon',
                hintText: 'No Telepon',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Spacer(),
                RaisedButton(
                  onPressed: () {
                    if (validateInput()) {
                      Kontak dataIn = new Kontak(
                          id: this.widget.kontak != null
                              ? this.widget.kontak.id
                              : "",
                          namaDepan: ctrlNamaDepan.text,
                          namaBelakang: ctrlNamaBelakang.text,
                          noTelepon: ctrlNoTelepon.text);
                      if (this.widget.kontak != null) {
                        api.update(dataIn).then((result) {
                          if (result != null) {
                            Navigator.pop(_scaffoldState.currentState.context);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Simpan data gagal"),
                            ));
                          }
                        });
                      } else {
                        api.create(dataIn).then((result) {
                          if (result != null) {
                            Navigator.pop(_scaffoldState.currentState.context);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Simpan data gagal"),
                            ));
                          }
                        });
                      }
                    } else {
                      _scaffoldState.currentState.showSnackBar(SnackBar(
                        content: Text("Data belum lengkap"),
                      ));
                    }
                  },
                  child: Text(
                    widget.kontak == null ? "Simpan" : "Ubah",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.orange[400],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool validateInput() {
    if (ctrlNamaDepan.text == "" ||
        ctrlNamaBelakang.text == "" ||
        ctrlNoTelepon.text == "") {
      return false;
    } else {
      return true;
    }
  }
}
