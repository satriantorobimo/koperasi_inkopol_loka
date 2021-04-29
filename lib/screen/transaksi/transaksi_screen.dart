import 'package:flutter/material.dart';
import 'package:loka_apps/screen/transaksi/all_screen.dart';
import 'package:loka_apps/screen/transaksi/curren_screen.dart';
import 'package:loka_apps/screen/transaksi/next_screen.dart';
import 'package:loka_apps/util/color_swatch.dart';

class TransaksiScreen extends StatefulWidget {
  @override
  _TransaksiScreenState createState() => _TransaksiScreenState();
}

class _TransaksiScreenState extends State<TransaksiScreen> {
  List<String> _listMenu = ["Current", "Next Bill", "All"];

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 40,
            width: double.infinity,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.075);
                },
                itemCount: _listMenu.length,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        _onSelected(index);
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: _selectedIndex != null &&
                                      _selectedIndex == index
                                  ? ColorsSwatch.awsomeBlue
                                  : ColorsSwatch.softBlue),
                          color:
                              _selectedIndex != null && _selectedIndex == index
                                  ? ColorsSwatch.awsomeBlue
                                  : ColorsSwatch.softBlue,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(_listMenu[index],
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                          ),
                        ),
                      ),
                    )),
          ),
        ),
        _selectedIndex == 0
            ? CurrentScreen()
            : _selectedIndex == 1
                ? NextScreen()
                : AllScreen()
      ],
    );
  }
}
