import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html_app/webviewjavascript.dart';
import 'package:flutter_html_app/webviewlocal.dart';
import 'package:flutter_html_app/webviewone.dart';
import 'package:flutter_html_app/webviewone.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Webview Examples"),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              getButton(context,"Load URL",WebViewURL()),
              getButton(context,"Load Local HTML",WebviewLocal()),
              getButton(context,"JavaScript Events",WebviewJs()),
              RaisedButton(
                padding: EdgeInsets.all(12),
                child: Text("Browser",style: TextStyle(
                    color: Colors.white,fontSize: 18
                )),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                onPressed: () {
                  _launchURL("http://rrtutors.com/site");
                },
              )

            ],
          ),
        ),
      ),
    );
  }


  getButton(context,text,widget)
  {
    return RaisedButton(
      padding: EdgeInsets.all(12),
      child: Text(text,style: TextStyle(
          color: Colors.white,fontSize: 18
      )),
      color: Colors.red,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder:(ctx){
          return widget;
        } ));
      },
    );
  }

}

_launchURL(url) async {

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}






