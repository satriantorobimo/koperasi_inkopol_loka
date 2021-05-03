import 'package:flutter/material.dart';
import 'package:loka_apps/util/history_tile.dart';
import 'package:loka_apps/util/icon_color.dart';
import 'package:loka_apps/util/icon_image.dart';

class AllScreen extends StatefulWidget {
  AllScreen({Key key}) : super(key: key);

  @override
  _AllScreenState createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
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
          // ListView(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   children: <Widget>[
          //     HistoryListTile(
          //       iconColor: IconColors.transfer,
          //       onTap: () {},
          //       transactionAmount: "Rp. 1.000.000",
          //       transactionIcon: IconImgs.transfer,
          //       transactionName: "Pembayaran 1/4",
          //       transactionType: "31 January 2021",
          //     ),
          //     HistoryListTile(
          //       iconColor: IconColors.transfer,
          //       onTap: () {},
          //       transactionAmount: "Rp. 1.000.000",
          //       transactionIcon: IconImgs.transfer,
          //       transactionName: "Pembayaran 2/4",
          //       transactionType: "28 February 2021",
          //     ),
          //     HistoryListTile(
          //       iconColor: IconColors.transfer,
          //       onTap: () {},
          //       transactionAmount: "Rp. 1.00.000",
          //       transactionIcon: IconImgs.transfer,
          //       transactionName: "Pembayaran 3/4",
          //       transactionType: "31 Maret 2021",
          //     ),
          //   ],
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
