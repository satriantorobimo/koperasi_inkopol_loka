import 'package:flutter/material.dart';
import 'package:loka_apps/screen/otp/otp_screen.dart';

class InputPhoneNumberScreen extends StatefulWidget {
  @override
  _InputPhoneNumberScreenState createState() => _InputPhoneNumberScreenState();
}

class _InputPhoneNumberScreenState extends State<InputPhoneNumberScreen> {
  TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Color(0xFF93C48B), shape: BoxShape.circle),
                  child: Center(
                      child: Text('LOKA',
                          style:
                              TextStyle(fontSize: 25, color: Colors.white)))),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Masukkan Nomor Telepon Seluler Anda',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: 250,
                      child: Text(
                        'Kami akan kirim SMS berisi kode untuk verifikasi nomor Anda',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      autocorrect: true,
                      keyboardType: TextInputType.number,
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        hintText: 'Contoh : 08123456789',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 8),
                  height: 45,
                  child: RaisedButton(
                    color: Color(0xFF93C48B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => OtpScreen(
                                phoneNumber:
                                    _phoneNumberController.text.toString())),
                      );
                    },
                    child: Text("Verifikasi",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
