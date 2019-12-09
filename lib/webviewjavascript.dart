import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewJs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebviewJsState();
  }

}
class WebviewJsState extends State<WebviewJs>
{
  WebViewController _webViewController;
  TextEditingController _textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Load Html Content"),  backgroundColor: Colors.deepPurple,),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               Container(
                 decoration: getBoxShadow(),
                 margin: EdgeInsets.all(8),

                 height: 400,
                 child:  WebView(
                   initialUrl: '',
                   javascriptMode: JavascriptMode.unrestricted,
                   onWebViewCreated: (WebViewController webViewController){
                     _webViewController=webViewController;
                     loadAsset();
                   },
                 ),
               ),
                Container(
                  margin: EdgeInsets.all(8),
                  color: Colors.white,
                  child: TextField(
                    textInputAction: TextInputAction.go,
                    onSubmitted: (value){
                      if(_textEditingController.text.length>0) {
                        int number=int.parse(_textEditingController.text) ;
                        _webViewController.evaluateJavascript('add($number, $number)');
                      }
                    },
                    decoration: getInoutDecoration("Enter Number"),
                    controller: _textEditingController,
                    keyboardType: TextInputType.numberWithOptions(signed: true),
                  ),
                )
              ],
            )
        ),
      ),

    );;
  }
  loadAsset() async {
    String fileHtmlContents = await rootBundle.loadString('assets/demojs.html');
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());

  }

  getBoxShadow()
  {
    return BoxDecoration(

        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(color: Colors.green,width: 1),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.lightGreen,
              offset: Offset(1.0, 2.0),
              blurRadius: 10,
              spreadRadius: 3)
        ]);

  }
  getInoutDecoration(hint)
  {
    return InputDecoration(
      hintText: hint,
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(12),
    );
  }

}