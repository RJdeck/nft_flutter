import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({super.key, required bool switchValue, required String text, required bool isLoading, required String imageurl,required String plyurl})
  : _text = text, _switchValue = switchValue, _isLoading = isLoading, _imageurl = imageurl,  _plyurl = plyurl;
  
  final String _text;
  final bool _switchValue;
  final bool _isLoading;
  final String _imageurl;
  final String _plyurl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: _isLoading
                            ? Center(
                                child: SpinKitFadingCircle(
                                  color: Colors.blue,
                                  size: 50.0,
                                ),
                              )
                            : Image.network(
                                _imageurl,
                                width: 400,
                                height: 400,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: 20, left: 200, right: 200),
                        child: InkWell(
                          onTap: () {
                            launchUrl(
                                Uri.parse(_switchValue ? _plyurl : _imageurl));
                          },
                          child: Text(
                            _isLoading
                                ? "Loading..."
                                : _switchValue
                                    ? _plyurl
                                    : _imageurl,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
  }
}