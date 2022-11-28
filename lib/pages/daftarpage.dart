import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/providers/authprovider.dart';
import 'package:projekakhir/widgets/loadinganimation.dart';
import 'package:provider/provider.dart';

class DaftarPage extends StatefulWidget {

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  TextEditingController namacontroller = TextEditingController(text: '');

  TextEditingController usernamecontroller = TextEditingController(text: '');

  TextEditingController emailcontroller = TextEditingController(text: '');

  TextEditingController nomorcontroller = TextEditingController(text: '');

  TextEditingController alamatcontroller = TextEditingController(text: '');

  TextEditingController passwordcontroller = TextEditingController(text: '');

  bool isload = false;

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handledaftar() async {

      setState(() {
        isload = true;
      });

      if(await authProvider.register(
        name: namacontroller.text,
        username: usernamecontroller.text,
        email: emailcontroller.text,
        nomor: nomorcontroller.text,
        alamat: alamatcontroller.text,
        password: passwordcontroller.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: btnremove,
            content: Text(
              'Gagal Register',
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
        margin: EdgeInsets.only(top:50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daftar',
            style: primarytextcolor.copyWith(
              fontSize: 24,
              fontWeight: semibold,
            ),
            ),
            SizedBox(
              height: 2,
            ),
            Text('Silahkan Daftar Terlebih Dahulu',
            style:primarytextcolor,
            ),
          ],
        )
      );
    }

    Widget fullNameInput(){
      return Container(
        margin: EdgeInsets.only(top:50),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Lengkap',
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
                    Image.asset('assets/icon_name.png', width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: namacontroller,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan Nama Lengkap',
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

    Widget usernameInput(){
      return Container(
        margin: EdgeInsets.only(top:10),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username',
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
                    Image.asset('assets/icon_username.png', width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: usernamecontroller,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan Username',
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

    Widget emailInput(){
      return Container(
        margin: EdgeInsets.only(top:10),
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

    Widget nomorInput(){
      return Container(
        margin: EdgeInsets.only(top:10),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nomor',
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
                        controller: nomorcontroller,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan Nomor',
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

    Widget alamatInput(){
      return Container(
        margin: EdgeInsets.only(top:10),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Alamat',
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
                        controller: alamatcontroller,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan Alamat',
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
        margin: EdgeInsets.only(top:10),
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
                        obscureText: true,
                        controller: passwordcontroller,
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

    Widget buttonDaftar(){
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top:30),
        child: TextButton(
          onPressed: handledaftar,
          style: TextButton.styleFrom(
            backgroundColor: basicGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
          ),
          
          child: Text(
            'Daftar',
            style: secondarytextcolor.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget socialmedia(){
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Text(
              'Silahkan Daftar Dengan Email dan Password \nAtau Dengan Sosial Media',
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

    Widget footer(){
      return Container(
        margin: EdgeInsets.only(bottom: 30, top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sudah Punya Akun? ',
            style: primarytextcolor.copyWith(
              fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text(
                'Login',
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
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultmargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(),
                  fullNameInput(),
                  usernameInput(),
                  emailInput(),
                  nomorInput(),
                  alamatInput(),
                  passwordInput(),
                  isload ? LoadingAnimation() : buttonDaftar(),
                  socialmedia(),
                  footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}