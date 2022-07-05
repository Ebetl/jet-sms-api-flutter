import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobil_ik/Screens/Login/components/background.dart';
import 'package:mobil_ik/Service/service.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';
import '../../Signup/signup_screen.dart';
import '../../Verify/verify.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  get otpPin => null;

  get verID => null;
  Future<void> verifyPhone(String number, BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: Duration(minutes: 1),
      verificationCompleted: (PhoneAuthCredential credential) {
        showSnackBarText("Auth Completed!", context);
      },
      verificationFailed: (FirebaseAuthException e) {
        showSnackBarText("Auth Failed!", context);
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText("OTP Sent", context);
        var verID = verificationId;
        setState(() {
          var screenState = 1;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        showSnackBarText("Time Out!", context);
      },
    );
  }
  Future<void> verifyOTP() async {
    await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verID, smsCode: otpPin));
  }
  @override
  Widget build(BuildContext context) {
    // TextEditingController usernameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    // final otpController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneController,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10)),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                suffixIcon: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 32,
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Service().smsGonder(phoneController.text);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Verify()),
                  );
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 20, 61, 41)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Şifre Gönder',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

void showSnackBarText(String text, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
