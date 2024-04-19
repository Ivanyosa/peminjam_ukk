import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:peminjam_perpustakaan_app/app/data/model/response_book.dart';

import '../controllers/detailbook_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class DetailbookView extends StatefulWidget {
  final Map bObj;

  const DetailbookView({Key? key, required this.bObj}) : super(key: key);

  @override
  State<DetailbookView> createState() => _DetailbukuViewState();
}

class _DetailbukuViewState extends State<DetailbookView> {
  final DetailbookController _detailController = Get.put(DetailbookController());
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  double _rating = 3;
  bool _isScrolled = false;
  bool _isFavorite = false;
  bool _isMark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC1F3FF),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is ScrollUpdateNotification) {
            if (scrollInfo.metrics.pixels > 270) {
              setState(() {
                _isScrolled = true;
              });
            } else {
              setState(() {
                _isScrolled = false;
              });
            }
          }
          return false;
        },
        child: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: _isScrolled ? Colors.transparent : Color(0xFFC1F3FF),
                  expandedHeight: 330.0,
                  floating: false,
                  pinned: true,
                  iconTheme: IconThemeData(
                    color: _isScrolled ? Colors.black : Colors.white,
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 330,
                          color: Color(0xFFC1F3FF),
                        ),
                        Positioned(
                          left: 105,
                          top: 74,
                          child: Container(
                            width: 150,
                            height: 231,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                // 'http://192.168.43.225:8000/images/${_detailController.state?.image}',
                                'https://3.bp.blogspot.com/-vuZi7_cuI8g/XHnxajgQz7I/AAAAAAAAAnA/uVc4Ec1UJeYovHM0OMQWw_z8cJJZZEHxQCLcBGAs/s1600/download-novel-dilan-lengkap.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 8, bottom: 80),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 45),
                            child: SizedBox(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // '● ${_detailController.state?.judul}',
                                    '● Dilan & Milea',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 10),
                                      RatingBar.builder(
                                        // initialRating: _detailController.state?.rating?.toDouble() ?? 0.0,
                                        initialRating: 4.5,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 18,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          setState(() {
                                            _rating = rating;
                                          });
                                          print(rating);
                                        },
                                      ),
                                      SizedBox(width: 7),
                                      Text(
                                        // '${_detailController.state?.rating}',
                                        '${_rating}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                      SizedBox(width: 55),
                                      Text(
                                        // 'Stok : ${_detailController.state?.stok}',
                                        'Stok : 10',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 10),
                                      Text(
                                        'Penulis :',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Irfan Ghafur',
                                        // '${_detailController.state?.penulis}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 10),
                                      Text(
                                        'Penerbit :',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Monsta',
                                        // '${_detailController.state?.penerbit}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 10),
                                      Text(
                                        'Tahun Terbit :',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        '2024-02-11',
                                        // '${_detailController.state?.tanggalPublikasi}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    '● SINOPSIS',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      // '      ${_detailController.state?.sinopsis}',
                                      'Milea (Vanesha Prescilla) bertemu dengan Dilan (Iqbaal Ramadhan) di sebuah SMA di Bandung. Itu adalah tahun 1990, saat Milea pindah dari Jakarta ke Bandung. Perkenalan yang tidak biasa kemudian membawa Milea mulai mengenal keunikan Dilan lebih jauh. Dilan yang pintar, baik hati dan romantis... semua dengan caranya sendiri. Cara Dilan mendekati Milea tidak sama dengan teman-teman lelakinya yang lain, bahkan Beni, pacar Milea di Jakarta. Bahkan cara berbicara Dilan yang terdengar kaku, lambat laun justru membuat Milea kerap merindukannya jika sehari saja ia tak mendengar suara itu. Perjalanan hubungan mereka tak selalu mulus. Beni, gank motor, tawuran, Anhar, Kang Adi, semua mewarnai perjalanan itu. Dan Dilan... dengan caranya sendiri...selalu bisa membuat Milea percaya ia bisa tiba di tujuan dengan selamat. Tujuan dari perjalanan ini. Perjalanan mereka berdua. Katanya, dunia SMA adalah dunia paling indah. Dunia Milea dan Dilan satu tingkat lebih indah daripada itu.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                        fontFamily: 'SF Pro Text',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '● ULASAN',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      // SizedBox(height: 5),
                                      // ListView.builder(
                                      //   shrinkWrap: true,
                                      //   physics: NeverScrollableScrollPhysics(),
                                      //   itemCount: _detailController.state?.ulasan?.length ?? 0,
                                      //   itemBuilder: (context, index) {
                                      //     var ulasanItem = _detailController.state?.ulasan?[index];
                                      //     return Padding(
                                      //       padding: EdgeInsets.symmetric(vertical: 8.0).copyWith(left: 10.0),
                                      //       child: Row(
                                      //         crossAxisAlignment: CrossAxisAlignment.start,
                                      //         children: [
                                      //           CircleAvatar(
                                      //             radius: 25,
                                      //             backgroundImage: NetworkImage('http://192.168.43.225:8000/images/${ulasanItem?.user?.image ?? ''}'),
                                      //           ),
                                      //           SizedBox(width: 10),
                                      //           Expanded(
                                      //             child: Column(
                                      //               crossAxisAlignment: CrossAxisAlignment.start,
                                      //               children: [
                                      //                 Text(
                                      //                   ulasanItem?.user?.name ?? '',
                                      //                   style: TextStyle(
                                      //                     fontWeight: FontWeight.bold,
                                      //                   ),
                                      //                 ),
                                      //                 SizedBox(height: 5),
                                      //                 Text(ulasanItem?.ulasan ?? ''),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     );
                                      //   },
                                      // ),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextField(
                                                controller: commentController,
                                                decoration: InputDecoration(
                                                  hintText: 'Tambahkan komentar...',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.send),
                                              onPressed: () {
                                                // Aksi saat tombol kirim ditekan
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 12,
              child: Container(
                height: 60,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Aksi saat tombol "Pinjam" ditekan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFC1F3FF),
                        minimumSize: Size(160, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'PINJAM',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isFavorite ? Colors.red[400] : Colors.grey[200],
                          minimumSize: Size(10, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _isFavorite ? Icons.favorite : Icons.favorite_outline,
                              size: 20,
                              color: _isFavorite ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isMark = !_isMark;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isMark ? Colors.yellow : Colors.grey[200],
                          minimumSize: Size(10, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _isMark ? Icons.bookmark_add : Icons.bookmark_add_outlined,
                              size: 20,
                              color: _isMark ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

