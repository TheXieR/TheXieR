import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HealthyScreen extends StatefulWidget {
  const HealthyScreen({Key? key}) : super(key: key);

  @override
  _HealthyScreenState createState() => _HealthyScreenState();
}

class _HealthyScreenState extends State<HealthyScreen> {
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
                        'Healthy Screen',
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
