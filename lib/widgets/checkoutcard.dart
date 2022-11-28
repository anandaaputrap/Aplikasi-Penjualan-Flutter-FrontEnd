import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/models/cartmodel.dart';

class CheckoutCard extends StatelessWidget {

  final CartModel cart;
  CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(
        top: 12,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: topcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              
            ),
            child: Image.network(
              cart.product.galleries[0].url,
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
                  cart.product.nama_produk,
                  style: primarytextcolor.copyWith(
                    fontWeight: semibold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  NumberFormat.simpleCurrency(name: 'Rp', decimalDigits: 0).format(cart.product.harga),
                  style: primarypricecolor,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            '${cart.quantity} Barang',
            style: primarytextcolor.copyWith(
              fontSize:12,
            ),
          ),
        ],
      ),
    );
  }
}