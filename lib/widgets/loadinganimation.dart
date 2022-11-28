import 'package:flutter/material.dart';
import 'package:projekakhir/colors.dart';

class LoadingAnimation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top:30),
        child: TextButton(
          onPressed: () {

          },
          style: TextButton.styleFrom(
            backgroundColor: basicGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
          ),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(
                    loved,
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
            Text(
              'Loading',
              style: secondarytextcolor.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}