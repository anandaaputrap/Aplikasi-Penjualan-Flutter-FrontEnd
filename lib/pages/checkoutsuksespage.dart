import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';

class CheckoutSuksesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    header() {
      return AppBar(
        backgroundColor: topcolor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Checkout Berhasil'
        ),

      );
    }

    Widget isi() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_emptycart.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Transaksi Berhasil',
              style: primarytextcolor.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Tetap di Rumah Hingga Pesananmu Datang, Terimakasih :)',
              style: primarytextcolor.copyWith(
                
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 196,
              height: 44,
              margin: EdgeInsets.only(
                top: defaultmargin,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                style: TextButton.styleFrom(
                  backgroundColor: basicGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Pesan Lagi',
                  style: secondarytextcolor.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  )
                ),
              ),
            ),
            Container(
              width: 196,
              height: 44,
              margin: EdgeInsets.only(
                top: 12,
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff39374B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Lihat Pesanan Saya',
                  style: secondarytextcolor.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  )
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: header(),
      body: isi(),
    );
  }
}