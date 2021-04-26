import 'package:flutter/material.dart';
import 'package:loka_apps/util/color_swatch.dart';

class CreditCardContainer extends StatelessWidget {
  const CreditCardContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 5.0, color: Colors.blue[200], offset: Offset(0, 5)),
        ],
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          colors: [
            ColorsSwatch.softBlue,
            ColorsSwatch.awsomeBlue,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Limit Pinjaman Anda",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              "Rp 1.000.000",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              "Ajukan pinjaman untuk dapat limit sebenarnya",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
