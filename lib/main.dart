import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nft_flutter_windows/LeftSide.dart';
import 'package:nft_flutter_windows/RightSide.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _switchValue = false;
  bool _isLoading = false;
  String _imageurl = "https://picsum.photos/400";
  String _plyurl = "https://picsum.photos/400";
  String _text = "apple";
  String _tokenid = "0";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meta Metopia NFT Generator"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              LeftSideWidget(
                text: _text,
                isLoading: _isLoading,
                imageurl: _imageurl,
                plyurl: _plyurl,
                switchValue: _switchValue,
                tokenid: _tokenid,
                onTokenID: (tokenid) {
                  setState(() {
                    _tokenid = tokenid;
                  });
                },
                onIsLoading: (isLoading) {
                  setState(() {
                    _isLoading = isLoading;
                  });
                },
                onImageURL: (imageurl) {
                  setState(() {
                    _imageurl = imageurl;
                  });
                },
                onPlyURL: (plyurl) {
                  setState(() {
                    _plyurl = plyurl;
                  });
                },
                onSwitchValue: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
                onTextChange: (text) {
                  setState(() {
                    _text = text;
                  });
                },
              ),
              RightSideWidget(
                switchValue: _switchValue,
                text: _text,
                isLoading: _isLoading,
                imageurl: _imageurl,
                plyurl: _plyurl,
                tokenid: _tokenid,
              )
            ],
          ),
        ),
      ),
    );
  }
}
