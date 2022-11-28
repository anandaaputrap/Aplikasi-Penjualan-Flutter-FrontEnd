import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';
import 'package:projekakhir/models/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:avatars/avatars.dart';

import '../../providers/authprovider.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        backgroundColor: topcolor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
              defaultmargin,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network('https://ui-avatars.com/api/${user.name}'),
                  // child: Avatar(
                  //   sources: [
                  //     NetworkSource(user.profilePhotoUrl),
                  //   ],
                  //   shape: AvatarShape.circle(100),
                  // ),
                ),
                SizedBox(
                  width: 16,
                ),
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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false
                    );
                  },
                  child: Image.asset(
                    'assets/icon_buttonexit.png',
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget listmenuitem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: primarytextcolor.copyWith(
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: textt,
            ),
          ],
        ),
      );
    }

    Widget isi() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultmargin,
          ),
          decoration: BoxDecoration(
            color: bgColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Akun',
                style: primarytextcolor.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/editprofil');
                },
                child: listmenuitem(
                  'Edit Profil',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/history');
                },
                child: listmenuitem(
                'Pesanan Anda',
                ),
              ),
              listmenuitem(
                'Bantuan',
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Umum',
                style: primarytextcolor.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
              listmenuitem(
                'Kebijakan Privasi',
              ),
              listmenuitem(
              'Syarat Layanan',
              ),
              listmenuitem(
                'Penilaian Aplikasi',
              ),
            ],
          ),
        ),
      );
    }


    return Column(
      children: [
        header(),
        isi(),
      ],
    );
  }
}