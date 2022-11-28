import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/providers/wishlistprovider.dart';
import 'package:projekakhir/widgets/wishlistcard.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    WishlistProvider wp = Provider.of<WishlistProvider>(context);

    Widget header(){
      return AppBar(
        backgroundColor: topcolor,
        centerTitle: true,
        title: Text(
          'Favorit',
          style: primarytextcolor,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget wishlistkosong() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_love2.png',
                width: 74,
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                'Belum Memilik Barang Favorit?',
                style: primarytextcolor.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Mari Kita Cari Barang Favoritmu',
                style: primarytextcolor,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 24,
                    ),
                    backgroundColor: basicGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Cari Barang',
                    style: secondarytextcolor.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget isi() {
      return Expanded(
        child: Container(
          color: bgColor,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultmargin,
            ),
            children: wp.wishlist
            .map((produk) => WishlistCard(produk),
            )
            .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // wishlistkosong(),
        wp.wishlist.length == 0 ? wishlistkosong() : isi(),
      ],
    );   
  }
}