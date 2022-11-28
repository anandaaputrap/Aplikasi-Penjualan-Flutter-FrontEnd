import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';

class ChatList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/detailchat');
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/logoo_chat.png',
                  width: 44,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dapoerpedia',
                        style: primarytextcolor.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Jika Ada Yang Ingin Ditanyakan',
                        style: blacktext.copyWith(
                          fontWeight: light,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Silahkan Hubungi WA 085733024976',
                        style: blacktext.copyWith(
                          fontWeight: light,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // Text(
                //   '09:48',
                //   style: primarytextcolor.copyWith(
                //     fontSize: 10,
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 1,
              color: Color(0xff2b2939),
            ),
          ],
        ),
      ),
    );
  }
}
