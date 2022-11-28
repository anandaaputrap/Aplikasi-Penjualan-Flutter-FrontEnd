import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projekakhir/models/usermodel.dart';
import 'package:projekakhir/providers/authprovider.dart';
import 'package:projekakhir/providers/tranksaksiprovider.dart';
import 'package:projekakhir/widgets/transactioncard.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:projekakhir/colors.dart';


class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    TransactionProvider transactionProvider = Provider.of<TransactionProvider>(context);
    transactionProvider.getTransactions(user);
    print('Jumlah Produk Homepage: ${transactionProvider.transactions.length}');

    Widget header() {
      return AppBar(
        backgroundColor: topcolor,
        centerTitle: true,
        title: Text(
          'Histori Pembelian',
        ),
        elevation: 0,
      );
    }

    Widget emptyCart() {
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
              'Keranjang Kosong',
              style: blacktext.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            // Text(
            //   'Let\'s Find your favorite product',
            //   style: subtitleTextStyle,
            // ),
            Container(
              width: 154,
              height: 44,
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                style: TextButton.styleFrom(
                  backgroundColor: bgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Kembali Ke Home',
                  style: primarytextcolor.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultmargin),
        children: transactionProvider.transactions
            .map(
              (transaction) => TransactionCard(transaction),
            )
            .toList(),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: header(),
      body: transactionProvider.transactions.length == 0 ? emptyCart() : content(),
      bottomNavigationBar:
          transactionProvider.transactions.length == 0 ? SizedBox() : null,
    );
  }
}