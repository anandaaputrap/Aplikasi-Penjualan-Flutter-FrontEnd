import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/providers/produkprovider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<ProdukProvider>(context, listen: false).getProduk();
    Navigator.pushNamed(context, '/login');
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Container(
          width: 430,
          height: 450,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logoo.png'),
            ),
          ),
        ),
      )   
    );
  }
}