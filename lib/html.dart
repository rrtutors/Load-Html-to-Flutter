import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
class HtmlWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("With HTMl Widget"),),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: loadAsset(),
            builder: (ctx,data){
          return Html(data: data.data);
        }),
      ),
    );
  }
  Future loadAsset() async {

    return await rootBundle.loadString('assets/demo.html');

  }
}