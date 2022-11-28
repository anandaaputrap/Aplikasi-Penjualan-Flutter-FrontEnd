import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/models/produkmodel.dart';
import 'package:projekakhir/providers/wishlistprovider.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {

  final ProdukModel produk;
  WishlistCard(this.produk);

  @override
  Widget build(BuildContext context) {

    WishlistProvider wp = Provider.of<WishlistProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: topcolor,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              produk.galleries[0].url,
              width: 80,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produk.nama_produk,
                  style: primarytextcolor.copyWith(
                    fontWeight: semibold,
                  ),
                ),
                Text(
                  NumberFormat.simpleCurrency(name: 'Rp', decimalDigits: 0).format(produk.harga),
                  style: primarypricecolor,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              wp.setProduk(produk);
            },
            child: Image.asset(
              'assets/icon_wishlistblue.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}