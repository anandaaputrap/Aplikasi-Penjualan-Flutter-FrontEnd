import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/models/transactionmodel.dart';
import 'package:projekakhir/providers/tranksaksiprovider.dart';
import 'package:provider/provider.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel ts;
  TransactionCard(this.ts);
  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        margin: EdgeInsets.only(
          top: defaultmargin,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: topcolor,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
            //    ClipRRect(
            //   borderRadius: BorderRadius.circular(12),
            //   child: 
            //   Image.network(
            //     transaction.galleries[0].url,
            //     width: 80,
            //   ),
            // ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Status : " + ts.status,
                      style: primarytextcolor.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      "Harga : " + '\Rp.${ts.total_harga}',
                      style: primarypricecolor,
                    ),
                    Text(
                      "Metode Pembayaran : " + ts.metode_pembayaran,
                      style: primarytextcolor.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    // Text(
                    //   "Address : " + transaction.address.toString(),
                    //   style: primaryTextStyle.copyWith(
                    //     fontWeight: medium,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
