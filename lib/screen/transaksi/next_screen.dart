import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  NextScreen({Key key}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('Jumlah Tagihan',
          //     style: TextStyle(fontSize: 16, color: Colors.black)),
          // SizedBox(height: 16),
          // Container(
          //   width: double.infinity,
          //   height: 60,
          //   padding: EdgeInsets.all(16),
          //   decoration: BoxDecoration(
          //     border: Border.all(
          //         color: Colors.grey, width: 1.0, style: BorderStyle.solid),
          //     borderRadius: BorderRadius.all(Radius.circular(8)),
          //   ),
          //   child: Text('Rp 1.000.000',
          //       style: TextStyle(fontSize: 20, color: Colors.black)),
          // ),
          // SizedBox(height: 24),
          // Text('Tanggal Jatuh Tempo',
          //     style: TextStyle(fontSize: 16, color: Colors.black)),
          // SizedBox(height: 16),
          // Container(
          //   width: double.infinity,
          //   height: 60,
          //   padding: EdgeInsets.all(16),
          //   decoration: BoxDecoration(
          //     border: Border.all(
          //         color: Colors.grey, width: 1.0, style: BorderStyle.solid),
          //     borderRadius: BorderRadius.all(Radius.circular(8)),
          //   ),
          //   child: Text('31 Mei 2021',
          //       style: TextStyle(fontSize: 20, color: Colors.black)),
          // ),
          SizedBox(height: 30),
          Center(
            child: Text('Belum ada Transaksi',
                style: TextStyle(fontSize: 16, color: Colors.black)),
          )
        ],
      ),
    );
  }
}
