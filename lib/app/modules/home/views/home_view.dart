import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/modules/book/controllers/book_controller.dart';
import 'package:peminjam_perpustakaan_app/app/modules/login/controllers/login_controller.dart';

import '../../../data/provider/storange_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _homeController = Get.put(HomeController());
  final LoginController _loginController = Get.put(LoginController());
  final name = StorageProvider.read(StorageKey.name);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(
        init: BookController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.blue[800],
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            children: [
                              // Gambar lingkaran untuk foto profil
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage('https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg'), // Ganti dengan URL gambar profil Anda
                                  ),
                                ),
                              ),
                              SizedBox(width: 10), // Menambahkan jarak antara gambar dan teks
                              Text(
                                "Halo $name ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Berita Terpanas',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ImageSliderWidget(),
                            Text(
                              'Daftar Buku',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            controller.obx((state) => GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 0.7,
                              ),
                              itemCount: state!.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (ctx, index) {
                                return Card(
                                  elevation: 4,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.DETAIL_BOOK,
                                          parameters: {'id': (state[index].id ?? 0).toString(), 'judul': state[index].judul ?? ""});
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center, // Teks menjadi di tengah secara horizontal
                                        mainAxisAlignment: MainAxisAlignment.end, // Menetapkan konten di bagian bawah

                                        children: [
                                          Image.network(
                                            'https://3.bp.blogspot.com/-vuZi7_cuI8g/XHnxajgQz7I/AAAAAAAAAnA/uVc4Ec1UJeYovHM0OMQWw_z8cJJZZEHxQCLcBGAs/s1600/download-novel-dilan-lengkap.jpg',
                                            width: 150,
                                            height: 250,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 8,),
                                          Text(
                                            "${state[index].judul} ",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "${state[index].penulis} ",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),


                                  ),
                                );
                              },
                            ),
                            ),
                          ],
                        ),
                      ),


                    ),

                    // SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}

class ImageSliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ImageSlideshow(
          width: double.infinity,
          height: 200,
          initialPage: 0,
          indicatorColor: Colors.blue,
          indicatorBackgroundColor: Colors.grey,
          children: [
            Image.network(
              'https://3.bp.blogspot.com/-vuZi7_cuI8g/XHnxajgQz7I/AAAAAAAAAnA/uVc4Ec1UJeYovHM0OMQWw_z8cJJZZEHxQCLcBGAs/s1600/download-novel-dilan-lengkap.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://img.id.my-best.com/product_images/8a72fce9c8e95e7a33b9c351f994b7b8.png?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=1338b132d02a4673e1ae016774278eee',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://awsimages.detik.net.id/community/media/visual/2021/12/08/peluncuran-novel-buya-hamka-karya-a-fuadi_43.jpeg?w=1200',
              fit: BoxFit.cover,
            ),
          ],
          onPageChanged: (value) {
            print('Page changed: $value');
          },
          autoPlayInterval: 3000,
        ),
      ),
    );
  }
}
