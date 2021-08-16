import 'package:flutter/material.dart';
import '../widget/covid.dart';
import 'package:http/http.dart' as http;
import '../api/apiMoney.dart';

class MoneyChange extends StatelessWidget {
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
    var url = Uri.parse("https://api.exchangerate-api.com/v4/latest/THB");
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
                  Covid("ข้อมูล ณ วันที่", result.date, Colors.lightBlue, 100),
                  SizedBox(
                    height: 35,
                  ),
                  Covid("ไทย บาท", result.rates['THB'], Colors.green, 70),
                  SizedBox(
                    height: 10,
                  ),
                  Covid("เยน ญี่ปุ่น", result.rates['JPY'], Colors.green, 70),
                  SizedBox(
                    height: 10,
                  ),
                  Covid("วอน เกาหลี", result.rates['KRW'], Colors.green, 70),
                  SizedBox(
                    height: 10,
                  ),
                  Covid("หยวน จีน", result.rates['GBP'], Colors.green, 70),
                  SizedBox(
                    height: 10,
                  ),
                  Covid("ดอลล่า สหรัฐอเมริกา", result.rates['USD'],
                      Colors.green, 70),
                  SizedBox(
                    height: 10,
                  ),
                  Covid("ยูโร สหราชอาณาจักร", result.rates['GBP'], Colors.green,
                      70),
                  SizedBox(
                    height: 10,
                  ),
                  Covid(
                      "ดอลล่า สิงคโปร์", result.rates['GBP'], Colors.green, 70),
                  SizedBox(
                    height: 10,
                  ),
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
