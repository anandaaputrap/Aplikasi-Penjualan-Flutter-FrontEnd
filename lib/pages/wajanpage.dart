import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/models/usermodel.dart';
import 'package:projekakhir/providers/produkprovider.dart';
import 'package:projekakhir/widgets/productlist.dart';
import 'package:provider/provider.dart';
import '../../providers/authprovider.dart';

class WajanPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProdukProvider produkProvider = Provider.of<ProdukProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultmargin,
          left: defaultmargin,
          right: defaultmargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, ${user.name}',
                    style: primarytextcolor.copyWith(
                      fontSize: 24,
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: primarytextcolor.copyWith(
                      fontSize: 16,  
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    user.profilePhotoUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categorybar(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultmargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultmargin,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: transparentC,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                    color: subtitle,
                  ),
                  ),
                  child: Text(
                    'Semua Produk',
                    style: secondarytextcolor.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: basicGreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Wajan',
                  style: primarytextcolor.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: transparentC,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitle,
                  ),
                ),
                child: Text(
                  'Kompor',
                  style: primarytextcolor.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: transparentC,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitle,
                  ),
                ),
                child: Text(
                  'Oven',
                  style: primarytextcolor.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: transparentC,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitle,
                  ),
                ),
                child: Text(
                  'Pisau',
                  style: primarytextcolor.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget wajantitle(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultmargin,
          left: defaultmargin,
          right: defaultmargin,
        ),
        child: Text(
          'Wajan',
          style: primarytextcolor.copyWith(
            fontSize: 22,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget wajanproduk(){
      return Container(
        margin: EdgeInsets.only(
          top: 14
        ),
        child: Column(
          children: produkProvider.produk
          .map(
            (produk) => ProductList(produk),
          )
          .toList()
        ),
      );
    }

   return ListView(
      children: [
         
        header(),
        categorybar(),
        wajantitle(),
        wajanproduk(),
      ],
    ); 
  }
}