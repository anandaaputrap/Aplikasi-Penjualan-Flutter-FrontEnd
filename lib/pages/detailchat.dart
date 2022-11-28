import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/widgets/chatbuble.dart';

class DetailChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: topcolor,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/logoo_chat.png',
                width: 30,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dapoerpedia',
                    style: primarytextcolor.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Online',
                    style: primarytextcolor.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget produkRev(){
      return Container(
        width: 225,
        height: 74,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: bgColor3,
            border: Border.all(
              color: basicGreen,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/image_kompor.png',
                  width: 54,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kompor C',
                      style: secondarytextcolor,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Rp.30.000',
                      style: primarypricecolor.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/icon_close.png',
                width: 22,
              ),
            ],
          ),
      );
    }

    Widget chatInput() {
      return Container(
        margin:EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            produkRev(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      // vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: inputtext,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Tulis Pesan Disini',
                          hintStyle: secondarytextcolor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/icon_sendbutton.png',
                  width: 45,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget chatContent() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultmargin,
        ),
        children: [
          ChatBubble(
            sender: true,
            text: 'Permisi, Apakah barang ini masih tersedia?',
            hasproduk: true,
          ),
          ChatBubble(
            sender: false,
            text: 'Halo, barang ini tersedia',
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor2,
      appBar: header(), 
      bottomNavigationBar: chatInput(),
      body: chatContent(),
    );
  }
}