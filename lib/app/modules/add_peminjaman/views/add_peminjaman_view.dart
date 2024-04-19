import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinjam Buku'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.tglpinjamController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Tanggal Pinjam",
                      border: OutlineInputBorder(), // Example border decoration
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Tanggal pinjam tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.tglkembaliController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Tanggal Kembali",
                      border: OutlineInputBorder(), // Example border decoration
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Tanggal kembali tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            Obx(() {
              return controller.loading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () => controller.post(),
                child: const Text("Pinjam"),
              );
            }).paddingOnly(top: 20),
          ],
        ).paddingOnly(left: 20, right: 20),
      ),
    );
  }
}
