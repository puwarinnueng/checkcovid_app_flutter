import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

//สร้าง containner ต้นแบบ
class Covid extends StatelessWidget {
  //สร้าง object
  String title; //ชื่อรายการ
  var amount; //จำนวนเงิน
  Color color; //สี
  double size; //ขนาดกล่อง
  //construcetur
  Covid(this.title, this.amount, this.color, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      height: size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          //จำนวนเงิน
          Expanded(
            child: Text(
              // '${NumberFormat("#,###.##").format(amount)}',
              amount.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
