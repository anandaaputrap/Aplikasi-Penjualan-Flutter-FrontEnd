import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/models/cartmodel.dart';
import 'package:projekakhir/providers/cartprovider.dart';
import 'package:provider/provider.dart';

class KeranjangCard extends StatelessWidget {

  final CartModel cart;
  KeranjangCard(this.cart);

  @override
  Widget build(BuildContext context) {

    CartProvider cp = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: defaultmargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: topcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
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
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'Rp', decimalDigits: 0).format(cart.product.harga),
                      style: primarypricecolor,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      cp.addQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/icon_additem.png',
                      width: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: primarytextcolor.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: (){
                      cp.reduceQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/icon_reduceitem.png',
                      width: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: (){
              cp.removeCart(cart.id);
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_trash.png',
                  width: 10,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Hapus',
                  style: alertstyle.copyWith(
                    fontWeight: light,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}