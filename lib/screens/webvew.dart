// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WbVewNews extends StatelessWidget {
  String? url;
  String? title;
  WbVewNews({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(textDirection: TextDirection.rtl, title!),
          backgroundColor: Colors.teal,
        ),
        body: WebView(
          initialUrl: url,
        ));
  }
}
