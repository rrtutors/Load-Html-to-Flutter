import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewLocal extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebviewLocalState();
  }

}
class WebviewLocalState extends State<WebviewLocal>
{
 WebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Load Html Content"),  backgroundColor: Colors.deepPurple,),
      body: Container(
          child: WebView(
            initialUrl: '',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController){
              _webViewController=webViewController;
              loadAsset();
            },
          )),
    );;
  }
 loadAsset() async {
   String fileHtmlContents = await rootBundle.loadString('assets/demo.html');
   _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
       mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
       .toString());

 }
}