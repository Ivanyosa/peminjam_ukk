import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_app/app/data/model/response_login.dart';
import 'package:peminjam_perpustakaan_app/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_app/app/data/provider/storange_provider.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';

import '../../../data/provider/storange_provider.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //TODO: Implement LoginController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    if (status == "Logged"){
      Get.offAllNamed(Routes.TABBAR);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  final loadingLogin = false.obs;
  login(String email,String password) async {
    loadingLogin(true);
      if (email.isEmpty || password.isEmpty){
        Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
      } else {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: dio.FormData.fromMap(
                {"name": email, "password": password}));
        if (response.statusCode == 200){
          final ResponseLogin responseLogin =
          ResponseLogin.fromJson(response.data);
          await StorageProvider.write(StorageKey.idUser,
              "${responseLogin.data?.id}");
          await StorageProvider.write(StorageKey.name,
              "${responseLogin.data?.name}");
          await StorageProvider.write(StorageKey.status, "logged");
          Get.offAllNamed(Routes.TABBAR);
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
      loadingLogin(false);
  }
}