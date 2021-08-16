import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MoneyChange extends StatefulWidget {
  @override
  _MoneyChangeState createState() => _MoneyChangeState();
}

class _MoneyChangeState extends State<MoneyChange> {

  @override
  void initState() {
    super.initState();
    getExchangeRate();
  }
   Future <void> getExchangeRate() async {
     var url = Uri.parse("https://static.easysunday.com/covid-19/getTodayCases.json?fbclid=IwAR1kZUwE58s_rCaAYSVjKEEsBR8s_etUoXet-Sx_xibnmqxNzqHE39FHVss");    
    var response = await http.get(url);
    print(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("อัตราการแลกเปลี่ยนทั่วโลก"),
      ),
      body: Text("กำลังพัฒนาคร๊าบบ"),
      
    );
  }
}