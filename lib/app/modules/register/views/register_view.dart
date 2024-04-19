import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Register'),
      //   centerTitle: true,
      // ),
      // body: Center(
      //     child: Form(key: controller.formKey,
      //       child: Column(
      //         children: [
      //           TextFormField(
      //             controller: controller.usernameController,
      //             decoration: InputDecoration(hintText: "Masukan username"),
      //             validator: (value) {
      //               if (value!.isEmpty) {
      //                 return "username tidak boleh kosong";
      //               }
      //               return null;
      //             },
      //           ),
      //           TextFormField(
      //             controller: controller.emailController,
      //             decoration: InputDecoration(hintText: "Masukan email"),
      //             validator: (value) {
      //               if (value!.isEmpty) {
      //                 return "email tidak boleh kosong";
      //               }
      //               return null;
      //             },
      //           ),TextFormField(
      //             controller: controller.passwordController,
      //             decoration: InputDecoration(hintText: "Masukan Password"),
      //             validator: (value) {
      //               if (value!.isEmpty) {
      //                 return "Password tidak boleh kosong";
      //               }
      //               return null;
      //             },
      //           ),TextFormField(
      //             controller: controller.confirm_passwordController,
      //             decoration: InputDecoration(hintText: "Masukan Password"),
      //             validator: (value) {
      //               if (value!.isEmpty) {
      //                 return "password harus sama ";
      //               }
      //               return null;
      //             },
      //           ),
      //           Obx(() =>
      //           controller.loadingRegister.value?
      //           CircularProgressIndicator():
      //           ElevatedButton(onPressed: () {
      //             controller.register(username,email,pasword,confirm_password );
      //           }, child: Text("Register")))
      //         ],
      //       ),
      //     )),
    );
  }
}
