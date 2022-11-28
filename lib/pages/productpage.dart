import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/models/produkmodel.dart';
import 'package:projekakhir/providers/cartprovider.dart';
import 'package:projekakhir/providers/wishlistprovider.dart';
import 'package:projekakhir/widgets/keranjangcard.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {

  final ProdukModel produk;
  ProductPage(this.produk);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List foto = [
    'assets/image_kompor.png',
    'assets/image_kompor.png',
    'assets/image_kompor.png',
    ];

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {

    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context); 
    CartProvider cp = Provider.of<CartProvider>(context);

    Future<void> showPopUpDialog() async{
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultmargin),
          child: AlertDialog(
            backgroundColor: chatinner,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: loved,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_success.png',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hore :)',
                    style: secondarytextcolor.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Produk Berhasil Ditambahkan',
                    style: secondarytextcolor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: basicGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/keranjang');
                      },
                      child: Text(
                        'Lihat Keranjang',
                        style: secondarytextcolor.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentindex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(
          horizontal: 2
          ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentindex == index ? basicGreen : Color(0xffc4c4c4),
        ),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultmargin,
              right: defaultmargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: unloveinne,
                )
              ],
            ),
          ),
          CarouselSlider(
            items: widget.produk.galleries
                .map(
                  (image) => Image.network(
                    image.url,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentindex = index;
                  });
                }
              ),
            ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: foto.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget isi() {
      return Container(
        width:double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: bgColor,
        ),
        child: Column(
          children: [

            //Note:Header
            Container(
              margin: EdgeInsets.only(
                left: defaultmargin,
                right: defaultmargin,
                top: defaultmargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.produk.nama_produk,
                          style: primarytextcolor.copyWith(
                            fontSize: 18,
                            fontWeight: semibold,
                          ),
                        ),
                        Text(
                          widget.produk.category.nama_kategori,
                          style: primarytextcolor.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '\Stok : ${widget.produk.stok_produk}',
                          style: primarytextcolor.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistProvider.setProduk(widget.produk);
                      if(wishlistProvider.isWishlist(widget.produk)){
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: bgColor5,
                          content: Text(
                            'Ditambahkan Ke Favorit',
                            textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: btnremove,
                          content: Text(
                            'Dihapus Dari Favorit',
                            textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      wishlistProvider.isWishlist(widget.produk)
                       ? 'assets/icon_wishlistblue.png'
                       : 'assets/icon_wishlist.png',
                      width: 46,
                    ),
                  ),
                ],
              ),
            ),
            //Note:BoxPrice
            Container(
              margin: EdgeInsets.only(
                left: defaultmargin,
                right: defaultmargin,
                top: 20,
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: topcolor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga',
                    style: primarytextcolor.copyWith(
                      // fontSize: 12,
                    ),
                  ),
                  Text(
                    NumberFormat.simpleCurrency(name: 'Rp', decimalDigits: 0).format(widget.produk.harga),
                    style: primarypricecolor.copyWith(
                      fontWeight: semibold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            //Note:BoxDescription
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: defaultmargin,
                right: defaultmargin,
                top: defaultmargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: primarytextcolor.copyWith(
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.produk.deskripsi,
                    style: primarytextcolor.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            //Note:Button
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: defaultmargin,
                right: defaultmargin,
                top: defaultmargin,
                bottom: defaultmargin,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/detailchat');
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/icon_chat2.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                height: 54,
                child: TextButton(
                  onPressed: () {
                    cp.addCart(widget.produk);
                    showPopUpDialog();
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: basicGreen,
                  ),
                  child: Text(
                    'Tambah Ke Keranjang',
                    style: secondarytextcolor.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                      ),
                    ),
                  ),
                ),
              ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    

    return Scaffold(
      backgroundColor: bgColor4,
      body: ListView(
        children: [
          header(),
          isi(),
        ],
      ),
    );
  }
}