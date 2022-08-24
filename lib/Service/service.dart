import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobil_ik/Screens/Login/components/body.dart';

//Jet Sms Api kullanarak 4 basamaklı random sayı gönderme islemi


class Service {
  Future<dynamic> smsGonder(String title) async {
    String rndm = Random()
        .nextInt(9999)
        .toString()
        .padLeft(4, '0'); // 4 basamaklı random sayı

      final response = await http.post(
      Uri.parse('https://ws.jetsms.com.tr/api/sendsms'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      
      body: jsonEncode(<String, dynamic>{
        "user": "username",
        "password": "password",
        "originator": "originator",
        "smsmessages": [
          {"messagetext": rndm, "receipent": title, "messageid": "1"}
        ],
      }),
      );
      
    print(response.body);
    print('Response kodu');
    print(response.statusCode);

      }
}
