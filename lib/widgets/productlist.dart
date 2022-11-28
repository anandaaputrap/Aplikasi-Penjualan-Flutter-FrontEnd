import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/models/produkmodel.dart';
import 'package:projekakhir/pages/productpage.dart';

class ProductList extends StatelessWidget {

  final ProdukModel produk;
  ProductList(this.produk);

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
        margin: EdgeInsets.only(
          left: defaultmargin,
          right: defaultmargin,
          bottom: defaultmargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                    produk.galleries[0].url,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ), 
              // Image.asset(
              //   'assets/image_wajan.png',
              //   width: 120,
              //   height: 120,
              //   fit: BoxFit.cover,
              // ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk.category.nama_kategori,
                    style: primarytextcolor.copyWith(
                      fontSize: 12,
                      // fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\Stok : ${produk.stok_produk}',
                    style: primarytextcolor.copyWith(
                      fontSize: 12,
                      // fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    produk.nama_produk,
                    style: blacktext.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    NumberFormat.simpleCurrency(name: 'Rp', decimalDigits: 0).format(produk.harga),
                    style: primarypricecolor.copyWith(
                      // fontSize: 14,
                      fontWeight: medium,
                    ),
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