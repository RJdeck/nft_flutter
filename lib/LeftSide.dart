import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

typedef OnTextChange = void Function(String text);
typedef OnSwitchValue = void Function(bool switchValue);
typedef OnIsLoading = void Function(bool isLoading);
typedef OnImageURL = void Function(String imageurl);
typedef OnPlyURL = void Function(String plyurl);
typedef OnTokenID = void Function(String tokenid);

class LeftSideWidget extends StatelessWidget {
  const LeftSideWidget(
      {super.key,
      required bool switchValue,
      required String text,
      required bool isLoading,
      required String imageurl,
      required String plyurl,
      required String tokenid,
      required OnTextChange onTextChange,
      required OnSwitchValue onSwitchValue,
      required OnIsLoading onIsLoading,
      required OnImageURL onImageURL,
      required OnPlyURL onPlyURL,
      required OnTokenID onTokenID,
      })
      : _text = text,
        _onTextChange = onTextChange,
        _switchValue = switchValue,
        _onSwitchValue = onSwitchValue,
        _isLoading = isLoading,
        _onIsLoading = onIsLoading,
        _imageurl = imageurl,
        _onImageURL = onImageURL,
        _plyurl = plyurl,
        _onPlyURL = onPlyURL,
        _tokenid = tokenid,
        _onTokenID = onTokenID;


  final String _text;
  final bool _switchValue;
  final bool _isLoading;
  final String _imageurl;
  final String _plyurl;
  final String _tokenid;

  final OnTextChange _onTextChange;
  final OnSwitchValue _onSwitchValue;
  final OnIsLoading _onIsLoading;
  final OnImageURL _onImageURL;
  final OnPlyURL _onPlyURL;
  final OnTokenID _onTokenID;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "[Enter text here...]",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onChanged: (value) {
                  _onTextChange(value);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: SwitchListTile(
                title: Text(_switchValue ? "3D NFT" : "2D NFT"),
                subtitle: Text(_switchValue
                    ? "Get 3D NFT, may take more time.."
                    : "GET 2D NFT"),
                value: _switchValue,
                onChanged: (value) {
                  _onSwitchValue(value);
                },
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    _onIsLoading(true);
                    final tar_url = (_switchValue
                        ? "https://text2nft.rj-deck.com/meta2d"
                        : "https://text2nft.rj-deck.com/meta3d");

                    final response = await http
                        .post(Uri.parse(tar_url),
                            headers: {
                              'Content-Type': 'application/json',
                            },
                            body: json.encode({
                              'message': _text,
                            }))
                        .timeout(const Duration(seconds: 480));

                    if (response.statusCode == 201) {
                      var result = json.decode(response.body);
                      // do something with the returned data
                      _onImageURL(result[0]['image_url']);
                      _onPlyURL(result[1]['ply_url']);
                      _onTokenID(
                          "0x" + result[2]['tokenId'].toRadixString(16) + "h");

                      _onIsLoading(false);
                    } else {
                      // handle error
                    }
                  },
                  child: const Text("Get NFT"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
