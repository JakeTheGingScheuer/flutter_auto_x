import 'package:auto_x/res/screen_dimensions.dart';
import 'package:auto_x/ui/widgets/home_page_button.dart';
import 'package:auto_x/ui/widgets/spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PdfPage extends StatefulWidget {
  String file;

  PdfPage({this.file});

  @override
  _PdfPageState createState() => _PdfPageState(file: this.file);
}

class _PdfPageState extends State<PdfPage>{
  String file;
  PDFDocument _doc;
  bool _loading;

  _PdfPageState({this.file});


  @override
  void initState(){
    super.initState();
    _initPdf();
  }

  _initPdf() async{
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(file);
    setState(() {
      _doc=doc;
      _loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading ? Spinner() : pdf();
  }

  pdf(){
    return Column(
      children: [
        SizedBox(height: 20),
        HomePageButton(),
        Container(
          height: screenHeight(context)*.89,
            width: screenWidth(context),
            child: PDFViewer(document: _doc))
      ],
    );
  }
}