import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ResultDetails extends StatefulWidget {
  const ResultDetails(this.url,{Key? key}) : super(key: key);
   final String url;

  @override
  State<ResultDetails> createState() => _ResultDetailsState();
}

class _ResultDetailsState extends State<ResultDetails> {
  bool _isLoading = true;
  PDFDocument? document;
  void initState() {
    loadDocument();

    super.initState();
    // Enable virtual display.
    //if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(
      "https://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf");

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : PDFViewer(
      document: document!,
      zoomSteps: 1,
    );
  }
}
