import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/widgets/chatlist.dart';

class ChatPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget header(){
      return AppBar(
        backgroundColor: topcolor,
        centerTitle: true,
        title: Text(
          'Pesan',
          style: primarytextcolor.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat(){
      return Expanded(
        child: Container(
          width: double.infinity,
          color: bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_headset.png',
                width: 80,
              ),
              SizedBox(
                height: 20 ,
              ),
              Text(
                'Tidak Ada Pesan?',
                style: primarytextcolor.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Anda Belum Melakukan Transaksi',
                style: primarytextcolor,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: basicGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Lihat Toko',
                    style: secondarytextcolor.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget isi(){
      return Expanded(
        child: Container(
          width: double.infinity,
          color: bgColor,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultmargin,
            ),
            children: [
              ChatList(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        isi(),
      ],
    );
  }
}