import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/models/usermodel.dart';
import 'package:projekakhir/providers/authprovider.dart';
import 'package:projekakhir/services/profilservice.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final nomorController = TextEditingController();
  final alamatController = TextEditingController();
  final passController = TextEditingController();

  String _token = "";

  simpanHandler(UserModel user) async {
    user.name = nameController.text;
    user.email = emailController.text;
    user.username = usernameController.text;
    user.nomor = nomorController.text;
    user.alamat = alamatController.text;

    if (await ProfileService()
        .updateProfile(user, passController.text, usernameController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Berhasil Update Profile',
            textAlign: TextAlign.center,
          ),
        ),
      );
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: topcolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: basicGreen,
            ),
          ),
        ],
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: primarytextcolor.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: nameController,
              style: primarytextcolor,
              decoration: InputDecoration(
                hintText: '${user.name}',
                hintStyle: primarytextcolor,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: primarytextcolor.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: usernameController,
              style: primarytextcolor,
              decoration: InputDecoration(
                hintText: '${user.username}',
                hintStyle: primarytextcolor,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: primarytextcolor.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: emailController,
              style: primarytextcolor,
              decoration: InputDecoration(
                hintText: '${user.email}',
                hintStyle: primarytextcolor,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primarytextcolor.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: passController,
              obscureText: true,
              style: primarytextcolor,
              decoration: InputDecoration(
                hintText: '',
                hintStyle: primarytextcolor,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget nomorInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor',
              style: primarytextcolor.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: nomorController,
              obscureText: false,
              style: primarytextcolor,
              decoration: InputDecoration(
                hintText: '${user.nomor}',
                hintStyle: primarytextcolor,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget alamatInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat',
              style: primarytextcolor.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: alamatController,
              obscureText: false,
              style: primarytextcolor,
              decoration: InputDecoration(
                hintText: '${user.alamat}',
                hintStyle: primarytextcolor,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget submitInput() {
      return Container(
          margin: EdgeInsets.only(
            top: 10,
          ),
          child: TextButton(
            child: Text("Simpan"),
            onPressed: (() {
              setState(() {
                _token = user.token;
              });
              simpanHandler(user);
            }),
          ));
    }

    Widget content() {
      return SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultmargin,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(
                  top: defaultmargin,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://ui-avatars.com/api/${user.name}'),
                  ),
                ),
              ),
              nameInput(),
              usernameInput(),
              emailInput(),
              nomorInput(),
              alamatInput(),
              passInput(),
              submitInput()
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: true,
    );
  }
}