import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter_x5/webview_flutter.dart';
class ArticleView extends StatefulWidget {
final String blog_Url ;

   ArticleView({required this.blog_Url});
  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Flutter"),
      //       Text(
      //         "News",
      //         style: TextStyle(color: Colors.blue),
      //       )
      //     ],
      //   ),
      //   actions:<Widget> [
          
      //     Opacity(
      //       opacity: 0,
      //       child: Container(padding: EdgeInsets.symmetric(horizontal: 16),
      //         child: Icon(Icons.save)),
      //     )],
      //   centerTitle: true,
      //   elevation: 0.0,
      // ),
      //  body:
       
appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
actions: [
       Opacity(
        opacity: 0,
        child: Container(padding: EdgeInsets.symmetric(horizontal: 16),child: Icon(Icons.save)))
],

        centerTitle: true,
        elevation: 0.0,
        
      ),
   body:      Container(
     
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blog_Url,
          onWebViewCreated: ((WebViewController WebViewController){
            _completer.complete(WebViewController);
          }),
        ),
        
      
    ),

       
   
    );
  }
}