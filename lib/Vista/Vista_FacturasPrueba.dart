import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:url_launcher/url_launcher.dart';

class VistaListadoPDFs extends StatefulWidget {
  @override
  _VistaListadoPDFsState createState() => _VistaListadoPDFsState();
}

class _VistaListadoPDFsState extends State<VistaListadoPDFs> {
  List<String> _pdfUrls = [];

  @override
  void initState() {
    super.initState();
    _cargarPDFs();
  }

  Future<void> _cargarPDFs() async {
    try {
     firebase_storage.ListResult result =
          await firebase_storage.FirebaseStorage.instance.ref('entradas-4350a.appspot.com').listAll();

      List<String> urls = [];
      result.items.forEach((firebase_storage.Reference ref) {
        urls.add(ref.fullPath);
      });

      setState(() {
        _pdfUrls = urls;
      });
    } catch (e) {
      print('Error al cargar los PDFs: $e');
    }
  }

  Future<void> _abrirPDF(String url) async {
    try {
      String pdfUrl = await firebase_storage.FirebaseStorage.instance
          .ref(url)
          .getDownloadURL();

      if (await canLaunch(pdfUrl)) {
        await launch(pdfUrl);
      } else {
        throw 'No se puede abrir el PDF';
      }
    } catch (e) {
      print('Error al abrir el PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de PDFs'),
      ),
      body: ListView.builder(
        itemCount: _pdfUrls.length,
        itemBuilder: (context, index) {
          String url = _pdfUrls[index];
          return ListTile(
            title: Text(url),
            onTap: () => _abrirPDF(url),
          );
        },
      ),
    );
  }
}
