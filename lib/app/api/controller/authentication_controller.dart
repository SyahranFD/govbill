import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthenticationController {

  static final isLoading = false.obs;
  static late String token = '';


  static final box = GetStorage();

  static Future register({
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {

      var data = {
        'username': username,
        'email': email,
        'password': password,
        'phone_number': phoneNumber,
      };

      var response = await http.post(
        Uri.parse('${url}/users/register'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 201) {

        token = json.decode(response.body)['token'];
        box.write('token', token);
        print(token);
        Get.offAllNamed('/');
      } else {

        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {

      var data = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('${url}/users/login'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 200) {

        token = json.decode(response.body)['token'];
        box.write('token', token);
        print(token);
        return "success";
      } else {
<<<<<<< HEAD
        return json.decode(response.body)['message'];
=======
        isLoading.value = false;
        errorLogin.value = errorLogin.value + 1;
        print(errorLogin.value);
        if (errorLogin.value == 3) {
          Future.delayed(
            Duration(seconds: 5),
            () => errorLogin.value = 0,
          );
        }
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print(json.decode(response.body));
>>>>>>> c4a4a9fdc3e3a2bdadf0efe2234c33da2084d7b5
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
    return null;
  }

  static Future logout() async {
    try {

      var response = await http.delete(
        Uri.parse('${url}/users/logout'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {

        box.remove('token');
        Get.offAllNamed('/login');
      } else {

        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
  }
}
