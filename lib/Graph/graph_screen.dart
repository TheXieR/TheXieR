import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GrapgSreen extends StatefulWidget {
  const GrapgSreen({Key? key}) : super(key: key);

  @override
  _GrapgSreenState createState() => _GrapgSreenState();
}

class _GrapgSreenState extends State<GrapgSreen> {
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
                    children: [
                      Text(
                        'Graph Screen',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
