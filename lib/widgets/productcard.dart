import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/models/produkmodel.dart';
import 'package:projekakhir/pages/productpage.dart';

class ProductCard extends StatelessWidget {

  final ProdukModel produk;
  ProductCard(this.produk);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => ProductPage(produk),
          ),
        );
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: defaultmargin,
        ),
        decoration: BoxDecoration(
          color: loved,
          borderRadius: BorderRadius.circular(20), 
             
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.network( 
              produk.galleries[0].url, 
              width: 225, 
              height: 150, 
              fit: BoxFit.cover, 
            ),
            // Image.asset(
            //   'assets/image_wajan.png',
            //   width: 215,
            //   height: 150,
            //   // fit: BoxFit.cover,
            // ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk.category.nama_kategori,
                    style: primarytextcolor.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    produk.nama_produk,
                    style: blacktext.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    NumberFormat.simpleCurrency(name: 'Rp', decimalDigits: 0).format(produk.harga),
                    style: primarypricecolor.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}