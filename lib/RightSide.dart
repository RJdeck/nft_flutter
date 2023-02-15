import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class RightSideWidget extends StatelessWidget {
  const RightSideWidget(
      {super.key,
      required bool switchValue,
      required String text,
      required bool isLoading,
      required String imageurl,
      required String plyurl,
      required String tokenid})
      : _text = text,
        _switchValue = switchValue,
        _isLoading = isLoading,
        _imageurl = imageurl,
        _plyurl = plyurl,
        _tokenid = tokenid;

  final String _text;
  final bool _switchValue;
  final bool _isLoading;
  final String _imageurl;
  final String _plyurl;
  final String _tokenid;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Container(
            width: 400,
            height: 540,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 125, 192, 246),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              children: [
                Container(
                  width: 380,
                  height: 380,
                  padding: EdgeInsets.all(20),
                  child: _isLoading
                      ? Center(
                          child: SpinKitFadingCircle(
                            color: Colors.blue,
                            size: 120.0,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            _imageurl,
                            width: 380,
                            height: 380,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'NFT ID:',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        _isLoading ? "" : _tokenid,
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'MINTED TIME:',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        _isLoading
                            ? ""
                            : DateFormat('yyyy-MM-dd').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: 400,
          //   padding: EdgeInsets.only(top: 7, left: 20, right: 20),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: <Widget>[
          //       Expanded(
          //         flex: 2,
          //         child: Text(
          //           'LINK URL:',
          //           style: TextStyle(
          //             fontSize: 18,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         flex: 5,
          //         child: InkWell(
          //           onTap: () {
          //             launchUrl(Uri.parse(_switchValue ? _plyurl : _imageurl));
          //           },
          //           child: Container(
          //             padding: EdgeInsets.only(left: 22, top: 2, bottom: 2),
          //             child: Text(
          //                 _isLoading
          //                     ? ""
          //                     : _switchValue
          //                         ? _plyurl
          //                         : _imageurl,
          //                 style: TextStyle(fontSize: 8),
          //                 softWrap: true),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
