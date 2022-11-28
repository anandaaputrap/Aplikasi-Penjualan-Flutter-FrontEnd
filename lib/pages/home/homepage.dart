import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/models/usermodel.dart';
import 'package:projekakhir/providers/produkprovider.dart';
import 'package:projekakhir/widgets/productcard.dart';
import 'package:projekakhir/widgets/productlist.dart';
import 'package:provider/provider.dart';
import '../../providers/authprovider.dart';
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProdukProvider produkProvider = Provider.of<ProdukProvider>(context);


    Widget titlekategori(){
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultmargin,
          right: defaultmargin,
        ),
        child: Text(
          'Kategori Produk',
          style: primarytextcolor.copyWith(
            fontSize: 22,
            fontWeight: semibold,
          ),
        ),
      );
    }

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
                    'https://ui-avatars.com/api/${user.name}',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget searchass(){
      return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xAAE1E1E1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          decoration: InputDecoration(
            
            enabledBorder: InputBorder.none ,
            focusedBorder: InputBorder.none,
            hintText: "Cari Produk",
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
          ),
        ),
      );
    }


    Widget fuckingbanner(){
      return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: basicGreen,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text.rich(
          TextSpan(
            text: "Khusus Pengguna Baru\n",
            style: secondarytextcolor.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
            children: [
              TextSpan(
                text: "Diskon 50%",
                style: secondarytextcolor.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
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
                  'Semua Produk',
                  style: secondarytextcolor.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/wajan');
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
                    'Wajan',
                    style: primarytextcolor.copyWith(
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

    Widget produkpopulertitle(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultmargin,
          left: defaultmargin,
          right: defaultmargin,
        ),
        child: Text(
          'Produk Populer',
          style: primarytextcolor.copyWith(
            fontSize: 22,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget produkpopuler(){
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultmargin,
              ),
              Row(
                children: produkProvider.produk
                .map(
                  (produk) => ProductCard(produk),
                  )
                  .toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget pendatangbarutitle(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultmargin,
          left: defaultmargin,
          right: defaultmargin,
        ),
        child: Text(
          'Pendatang Baru',
          style: primarytextcolor.copyWith(
            fontSize: 22,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget pendatangbaru(){
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
        SizedBox(
          height: 5,
        ),
        Divider(
          thickness: 1,
          color: subtitle,
        ),
        searchass(),
        fuckingbanner(),
        titlekategori(),
        categorybar(),
        produkpopulertitle(),
        produkpopuler(),
        pendatangbarutitle(),
        pendatangbaru(),
      ],
    );
  }
}