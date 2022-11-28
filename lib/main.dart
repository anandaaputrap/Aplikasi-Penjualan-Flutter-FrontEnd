// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/pages/checkoutpage.dart';
import 'package:projekakhir/pages/checkoutsuksespage.dart';
import 'package:projekakhir/pages/detailchat.dart';
import 'package:projekakhir/pages/editprofilpage.dart';
import 'package:projekakhir/pages/home/historypage.dart';
import 'package:projekakhir/pages/keranjangpage.dart';
import 'package:projekakhir/pages/productpage.dart';
import 'package:projekakhir/pages/splashscreen.dart';
import 'package:projekakhir/pages/loginpage.dart';
import 'package:projekakhir/pages/daftarpage.dart';
import 'package:projekakhir/pages/home/halamanutama.dart';
import 'package:projekakhir/pages/wajanpage.dart';
import 'package:projekakhir/providers/authprovider.dart';
import 'package:projekakhir/providers/cartprovider.dart';
import 'package:projekakhir/providers/produkprovider.dart';
import 'package:projekakhir/providers/tranksaksiprovider.dart';
import 'package:projekakhir/providers/wishlistprovider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProdukProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(), 
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(), 
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(), 
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginPage(),
          '/daftar': (context) => DaftarPage(),
          '/home': (context) => MainPage(),
          '/detailchat': (context) => DetailChat(),
          '/editprofil': (context) => EditProfilePage(),
          // '/product': (context) => ProductPage(),
          '/keranjang': (context) => KeranjangPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkoutsukses': (context) => CheckoutSuksesPage(),
          '/history': (context) => HistoryPage(),
          '/wajan': (context) => WajanPage(), 
        },
      ),
    );
  }
}

