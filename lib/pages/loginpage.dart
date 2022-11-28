import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/widgets/loadinganimation.dart';
import 'package:provider/provider.dart';

import '../providers/authprovider.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailcontroller = TextEditingController(text: '');

  TextEditingController passwordcontroller = TextEditingController(text: '');

  bool isload = false;


  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handlelogin() async {

      setState(() {
        isload = true;
      });

      if(await authProvider.login(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: btnremove,
            content: Text(
              'Gagal Login',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isload = false;
      });
    }

    Widget header(){
      return Container(
        margin: EdgeInsets.only(top:30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login',
            style: primarytextcolor.copyWith(
              fontSize: 24,
              fontWeight: semibold,
            ),
            ),
            SizedBox(
              height: 2,
            ),
            Text('Silahkan Login Terlebih Dahulu Menggunakan Email dan Password',
            style:primarytextcolor,
            ),
          ],
        )
      );
    }

    Widget emailInput(){
      return Container(
        margin: EdgeInsets.only(top:70),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email',
            style: primarytextcolor.copyWith(
              fontSize: 16,
              fontWeight: medium,
            )
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16
              ),
              decoration: BoxDecoration(
                color: fill,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/icon_email.png', width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan Email',
                          hintStyle: primarytextcolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      );
    }

    Widget passwordInput(){
      return Container(
        margin: EdgeInsets.only(top:20),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Password',
            style: primarytextcolor.copyWith(
              fontSize: 16,
              fontWeight: medium,
            )
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16
              ),
              decoration: BoxDecoration(
                color: fill,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/icon_pass.png', width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan Password',
                          hintStyle: primarytextcolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      );
    }

    Widget socialmedia(){
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Text(
              'Atau Login Dengan Sosial Media',
              style : primarytextcolor.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment : MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/search.png",
                   width: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Image.asset(
                  "assets/facebook.png",
                   width: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Image.asset(
                  "assets/twitter.png",
                   width: 30,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget buttonLogin(){
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top:30),
        child: TextButton(
          onPressed: handlelogin,
          style: TextButton.styleFrom(
            backgroundColor: basicGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
          ),
          // onPressed: (){},
          child: Text(
            'Login',
            style: secondarytextcolor.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget footer(){
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Belum Punya Akun? ',
            style: primarytextcolor.copyWith(
              fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/daftar');
              },
              child: Text(
                'Daftar',
                style: greencolor.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultmargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                emailInput(),
                passwordInput(),
                isload ? LoadingAnimation() : buttonLogin(),
                socialmedia(),
                Spacer(),
                footer(),

            ],
          ),
        ),
      ),
    );
  }
}