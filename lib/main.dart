import 'package:flutter/material.dart';
import 'screen/showcovid.dart';
import 'screen/moneychange.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'หนึ่ง',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [
            MyApp1(),
            MoneyChange(),
          ],
        ),
        backgroundColor: Colors.lightBlue,
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              text: "ยอดโควิดในไทย",
              // text: Text("ยอดโควิดในไทย"),
            ),
            Tab(
              text: "อัตราการแลกเงิน",
            ),
          ],
        ),
      ),
    );
  }
}
