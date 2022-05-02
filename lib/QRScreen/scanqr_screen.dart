import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScannQRScreen extends StatefulWidget {
  const ScannQRScreen({Key? key}) : super(key: key);
  @override
  _ScannQRScreenState createState() => _ScannQRScreenState();
}

class _ScannQRScreenState extends State<ScannQRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: GestureDetector(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Color(0x66d2691e),
                        Color(0x99d2691e),
                        Color(0xccd2691e),
                        Color(0xffd2691e),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
