import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/providers/cartprovider.dart';
import 'package:projekakhir/widgets/keranjangcard.dart';
import 'package:provider/provider.dart';

class KeranjangPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    CartProvider cp = Provider.of<CartProvider>(context);

    header() {
      return AppBar(
        backgroundColor: topcolor,
        centerTitle: true,
        title: Text(
          'Keranjang',
          style: secondarytextcolor.copyWith(
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
        elevation: 0,
      );
    }

    Widget keranjangKosong() {
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
              style: primarytextcolor.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Segera Cari Barang Yang Anda Inginkan',
              style: primarytextcolor.copyWith(  
              ),
            ),
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
                  backgroundColor: basicGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Belanja Yuk',
                  style: secondarytextcolor.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget isi() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultmargin,
        ),
        children: cp.carts
        .map(
          (cart) => KeranjangCard(cart),
        )
        .toList(),
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 165,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultmargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primarytextcolor,
                  ),
                  Text(
                    NumberFormat.simpleCurrency(name: 'Rp', decimalDigits: 0).format(cp.totalPrice()),
                    style: primarypricecolor.copyWith(
                      fontWeight: semibold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 1,
              color: subtitle,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(
                horizontal: defaultmargin,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: TextButton.styleFrom(
                  backgroundColor: basicGreen,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Checkout',
                      style: secondarytextcolor.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: loved,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: header(),
      body: cp.carts.length == 0 ? keranjangKosong() : isi(),
      bottomNavigationBar: cp.carts.length == 0 ? SizedBox() : customBottomNav(),
    );
  }
}