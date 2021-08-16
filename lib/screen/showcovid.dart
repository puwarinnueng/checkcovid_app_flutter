import 'package:flutter/material.dart';
import '../widget/covid.dart';
import 'package:http/http.dart' as http;
import '../api/apiCovid.dart';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nueng App',
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.lightBlue),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GetData _dataFromAPI;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<GetData> getData() async {
    var url = Uri.parse(
        "https://static.easysunday.com/covid-19/getTodayCases.json?fbclid=IwAR1kZUwE58s_rCaAYSVjKEEsBR8s_etUoXet-Sx_xibnmqxNzqHE39FHVss");
    var res = await http.get(url);
    _dataFromAPI = getDataFromJson(res.body); //json to dart object
    return _dataFromAPI;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ยอดโควิด 19 ในไทยวันนี้"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Covid("ข้อมูล ณ. วันที่", result.updateDate,
                      Colors.blue.shade800, 150),
                  SizedBox(
                    height: 40,
                  ),
                  Covid(
                      "ติดเชื้อวันนี้", result.todayCases, Colors.orange, 100),
                  SizedBox(
                    height: 10,
                  ),
                  Covid("เสียชีวิตวันนี้", result.todayDeaths,
                      Colors.red.shade400, 100),
                  SizedBox(
                    height: 10,
                  ),
                  Covid("รักษาหายวันนี้", result.todayRecovered,
                      Colors.green.shade600, 100),
                  SizedBox(
                    height: 10,
                  ),
                  Covid("เสียชีวิตทั้งหมด", result.deaths, Colors.pink, 70),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  //  Covid("รักษาหายทั้งหมด", result.recovered , Colors.green.shade600, 70),
                  // SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
