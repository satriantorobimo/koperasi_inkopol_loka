import 'package:flutter/material.dart';
import 'package:loka_apps/util/credi_card_container.dart';
import 'package:loka_apps/util/custom_carousel.dart';
import 'package:loka_apps/util/custom_container.dart';
import 'package:loka_apps/util/custom_rounded.dart';
import 'package:loka_apps/util/history_tile.dart';
import 'package:loka_apps/util/icon_color.dart';
import 'package:loka_apps/util/icon_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List images = ['assets/imgs/foto1.png', 'assets/imgs/foto2.png'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.0,
                    color: Colors.grey[300],
                    spreadRadius: 5.0),
              ],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(51),
                bottomLeft: Radius.circular(51),
              ),
              color: Colors.white,
            ),
            child: Hero(
              tag: "card",
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: CreditCardContainer(),
                  onTap: () {},
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: CustomContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    'assets/imgs/360logo.png',
                    width: 100,
                  ),
                  Text(
                    'Ajukan Pinjaman',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Carousel(
            height: 174,
            items: images,
            builderFunction: (context, item) {
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    color: Colors.blue,
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                    )),
              );
            },
          ),
          SizedBox(height: 8),
          CustomContainer(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Riwayat Pembayaran",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CustomRoundedButton(
                      buttonText: "Lihat Semua",
                      color: Colors.blue,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    HistoryListTile(
                      iconColor: IconColors.transfer,
                      onTap: () {},
                      transactionAmount: "Rp. 200.000",
                      transactionIcon: IconImgs.transfer,
                      transactionName: "Pembayaran 1/12",
                      transactionType: "PEMBAYARAN",
                    ),
                    HistoryListTile(
                      iconColor: IconColors.transfer,
                      onTap: () {},
                      transactionAmount: "Rp. 200.000",
                      transactionIcon: IconImgs.transfer,
                      transactionName: "Pembayaran 2/12",
                      transactionType: "PEMBAYARAN",
                    ),
                    HistoryListTile(
                      iconColor: IconColors.transfer,
                      onTap: () {},
                      transactionAmount: "Rp. 200.000",
                      transactionIcon: IconImgs.transfer,
                      transactionName: "Pembayaran 3/12",
                      transactionType: "PEMBAYARAN",
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Berita Terkini",
                      ),
                      Text(
                        "Lihat Semua",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Carousel(
                  height: 130,
                  items: images,
                  builderFunction: (context, item) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          color: Colors.blue,
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                          )),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
