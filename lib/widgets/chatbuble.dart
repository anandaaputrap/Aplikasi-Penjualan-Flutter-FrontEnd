import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool sender;
  final bool hasproduk;
  
  ChatBubble({
    this.sender = false,
    this.text = '',
    this.hasproduk = false
    });

  @override
  Widget build(BuildContext context) {

    Widget produkpreview() {
      return Container(
        width: 230,
        // height: 155,
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(sender ? 12 : 0),
            topRight: Radius.circular(sender ? 0 : 12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),  
            ),
          color: sender ? bgColor3 : inputtext,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/image_kompor.png',
                    width: 70,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kompor C',
                        style: secondarytextcolor.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        height: 4,
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
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: basicGreen,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Keranjang',
                    style: greencolor.copyWith(
                      // fontWeight: medium,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    backgroundColor: basicGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Beli',
                    style: secondarytextcolor.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: sender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasproduk ? produkpreview() : SizedBox(),
          Row(
            mainAxisAlignment: sender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(sender ? 12 : 0),
                      topRight: Radius.circular(sender ? 0 : 12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),  
                    ),
                    color: sender ? bgColor3 : inputtext,
                  ),
                  child: Text(
                    text,
                    style: secondarytextcolor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}