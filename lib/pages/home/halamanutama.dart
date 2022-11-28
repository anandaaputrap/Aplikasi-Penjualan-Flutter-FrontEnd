import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/pages/home/homepage.dart';
import 'package:projekakhir/pages/home/chatpage.dart';
import 'package:projekakhir/pages/home/wishlistpage.dart';
import 'package:projekakhir/pages/home/profilepage.dart';
import 'package:projekakhir/pages/wajanpage.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget btnKeranjang(){
      return FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/keranjang');
        },
        backgroundColor: basicGreen,
        child: Image.asset(
          'assets/icon_cart.png',
          width: 20,
        ),
      );
    } 

    Widget customBottomnav(){
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30)
          ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value){
              print(value);
              setState(() {
                currentIndex = value;
              });
            },
            backgroundColor: fill,
            type: BottomNavigationBarType.fixed,
            items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/icon_home.png',
                  width: 21,
                  color: currentIndex == 0 ? basicGreen : Color(0xFF808191),
                  ),
              ),
                label: '',
              ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/icon_chat.png',
                  width: 21,
                  color: currentIndex == 1 ? basicGreen : Color(0xFF808191),
                  ),
              ),
                label: '',
              ),
              BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/icon_love.png',
                  width: 20,
                  color: currentIndex == 2 ? basicGreen : Color(0xFF808191),
                  ),
              ),
                label: '',
              ),
              BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/icon_profile.png',
                  width: 18,
                  color: currentIndex == 3 ? basicGreen : Color(0xFF808191),
                  ),
              ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }
    
    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: bgColor,
      floatingActionButton: btnKeranjang(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomnav(),
      body: body(),
    );
  }
}