import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobil_ik/Screens/Login/login_screen.dart';
import 'package:mobil_ik/Screens/Welcome/components/background.dart';
import 'package:mobil_ik/constants.dart';

import '../../../components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "HOŞGELDİNİZ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SvgPicture.asset(
              "assets/icons/login_chatbot.svg",
              height: size.height * 0.45,
            ),
            RoundedButton(
                text: "GİRİŞ YAP",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                }),
            // SizedBox(
            //   height: size.height * 0.005,
            // ),
            // RoundedButton(
            //   text: "KAYDOL",
            //   color: kPrimaryLightColor,
            //   textColor: Colors.white,
            //   press: () {
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //     builder: (context) {
            //     //       // return SignUpScreen();
            //     //     },
            //     //   ),
            //     // );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
