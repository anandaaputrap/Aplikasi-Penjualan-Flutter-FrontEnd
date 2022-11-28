import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/providers/authprovider.dart';
import 'package:projekakhir/providers/cartprovider.dart';
import 'package:projekakhir/providers/tranksaksiprovider.dart';
import 'package:projekakhir/widgets/checkoutcard.dart';
import 'package:projekakhir/widgets/loadinganimation.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  bool isload = false;

  @override
  Widget build(BuildContext context) {

    CartProvider cp = Provider.of<CartProvider>(context);
    TransactionProvider tp = Provider.of<TransactionProvider>(context);
    AuthProvider ap = Provider.of<AuthProvider>(context);

    handleCheckout() async{

      setState(() {
        isload = true;
      });

      if(await tp.checkout(
        ap.user.token,
        cp.carts, 
        cp.totalPrice(),
        ap.user,
        cp.subTotal(),
        )) {
          cp.carts = [];
          Navigator.pushNamedAndRemoveUntil(context, '/checkoutsukses', (route) => false);
        }

      setState(() {
        isload = false;
      });
    } 

    header() {
      return AppBar(
        backgroundColor: topcolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout',

        ),
      );
    }

    Widget isi() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultmargin,
        ),
        children: [
          //listitem
          SizedBox(
            height:30,
          ),
          Container(
            margin: EdgeInsets.only(
              top: defaultmargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar Barang',
                  style: primarytextcolor.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Column(
                  children: cp.carts
                  .map(
                    (cart) => CheckoutCard(cart),
                  )
                  .toList(),
                ),
              ],
            ),
          ),
          //Note: Alamat
          Container(
            margin: EdgeInsets.only(
              top: defaultmargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: topcolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Alamat',
                  style: primarytextcolor.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icon_storelocation.png',
                          width: 40,
                        ),
                        Image.asset(
                          'assets/icon_line.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/icon_address.png',
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lokasi Toko',
                          style: primarytextcolor.copyWith(
                            fontWeight: light,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Surabaya',
                          style: primarytextcolor.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: defaultmargin,
                        ),
                        Text(
                          'Tujuan',
                          style: primarytextcolor.copyWith(
                            fontWeight: light,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          ap.user.alamat,
                          style: primarytextcolor.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: defaultmargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: topcolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Pembayaran',
                  style: primarytextcolor.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Produk',
                      style: primarytextcolor.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${cp.totalItems()} Produk',
                      style: primarytextcolor.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Harga Produk',
                      style: primarytextcolor.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'Rp', decimalDigits: 0).format(cp.totalPrice()),
                      style: primarytextcolor.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Biaya Pengiriman',
                      style: primarytextcolor.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Rp.20.000',
                      style: primarytextcolor.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xff2e3141),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: primarytextcolor.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'Rp', decimalDigits: 0).format(cp.subTotal()),
                      style: primarypricecolor.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //checkoutbutton
          SizedBox(
            height: defaultmargin,
          ),
          Divider(
            thickness: 1,
            color: Color(0xff2e3141),
          ),
          isload 
          ? Container(
            margin: EdgeInsets.only(
              bottom: 30,
            ),
            child: LoadingAnimation()
            ) 
          : Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: defaultmargin,
            ),
            child: TextButton(
              onPressed: handleCheckout,
              style: TextButton.styleFrom(
                backgroundColor: basicGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Checkout',
                style: secondarytextcolor.copyWith(
                  fontWeight: semibold,
                  fontSize: 16,
                ),
              ),
            )
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: header(),
      body: isi(),
    );
  }
}