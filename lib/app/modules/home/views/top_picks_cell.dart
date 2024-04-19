
import 'package:flutter/material.dart';

import '../../../../common/color_extenstion.dart';

class TopPicksCell extends StatelessWidget {
  final Map iObj;
  const TopPicksCell({super.key, required this.iObj});

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;
    return SizedBox(
        // color: Colors.red,
        width: media.width * 0.32,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 2),
                        blurRadius: 5)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  // 'https://marketplace.canva.com/EAFY7T6tOE0/1/0/1003w/canva-oren-estetik-buku-cerita-pasangan-cinta-romantis-kartun-bagus-laGditSTCv0.jpg',
                  'http://192.168.216.225:8000/images/${iObj['img']}',
                  width: media.width * 0.32,
                  height: media.width * 0.50,
                  fit: BoxFit.cover,
                  // errorBuilder: (context, error, stackTrace) {
                  //   return ErrorWidget('Gagal memuat gambar');
                  // },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              iObj["name"].toString(),
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.text,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              iObj["author"].toString(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TColor.subTitle,
                fontSize: 11,
              ),
            )
          ],
        ));
  }
}