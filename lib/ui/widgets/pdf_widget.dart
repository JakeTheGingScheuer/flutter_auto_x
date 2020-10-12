import 'package:auto_x/ui/widgets/home_page_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PDFWidget extends StatelessWidget{

  PDFDocument doc;
  PDFWidget({this.doc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        HomePageButton(),
        Container(
            height: 500,
            width: 300,
            child: PDFViewer(document: doc))
      ],
    );
  }

}