import 'package:flutter/material.dart';
import 'package:pid/Graph/graph_screen.dart';
import 'package:pid/Healthy/healthy.dart';
import 'package:pid/Management/management.dart';
import 'package:pid/QRScreen/scanqr_screen.dart';
import 'Home/home_screen.dart';

class IndexPages extends StatefulWidget {
  const IndexPages({Key? key}) : super(key: key);

  @override
  _IndexPagesState createState() => _IndexPagesState();
}

class _IndexPagesState extends State<IndexPages> {
  int currenttIndex = 0;
  final screens = [
    HomeScreen(),
    GrapgSreen(),
    HealthyScreen(),
    ScannQRScreen(),
    ManagementScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currenttIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xffd2691e),
            currentIndex: currenttIndex,
            showUnselectedLabels: false,
            onTap: (index) => setState(() => currenttIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'หน้าหลัก',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph_outlined),
                label: 'กราฟ',
                backgroundColor: Color(0xffd2691e),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.health_and_safety),
                label: 'สุขภาพ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code),
                label: 'QR scan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.manage_accounts),
                label: 'การจัดการ',
              )
            ]));
  }
}
