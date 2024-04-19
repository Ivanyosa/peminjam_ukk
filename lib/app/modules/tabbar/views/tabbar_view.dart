import 'package:flutter/material.dart';
import 'package:peminjam_perpustakaan_app/app/modules/account/views/account_view.dart';
import 'package:peminjam_perpustakaan_app/app/modules/book/views/book_view.dart';
import 'package:peminjam_perpustakaan_app/app/modules/detailbook/views/detailbook_view.dart';
import 'package:peminjam_perpustakaan_app/app/modules/home/views/home_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../../../common/color_extenstion.dart';

class TabbarView extends StatefulWidget {
  const TabbarView({super.key});

  @override
  State<TabbarView> createState() => _TabbarViewState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _TabbarViewState extends State<TabbarView>
    with TickerProviderStateMixin {
  TabController? controller;

  int selectMenu = 0;
  late final Map b0bj;

  List menuArr = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Our Books", "icon": Icons.book},
    {"name": "Our Stores", "icon": Icons.storefront},
    {"name": "Careers", "icon": Icons.business_center},
    {"name": "Sell With Us", "icon": Icons.attach_money},
    {"name": "Newsletter", "icon": Icons.newspaper},
    {"name": "Pop-up Leasing", "icon": Icons.open_in_new},
    {"name": "Account", "icon": Icons.account_circle}
  ];

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      key: sideMenuScaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: media.width * 0.8,
        child: Container(
          decoration: BoxDecoration(
              color: TColor.dColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(media.width * 0.7),
              ),
              boxShadow: const [
                BoxShadow(color: Colors.black54, blurRadius: 15)
              ]),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    children: menuArr.map((mObj) {
                      var index = menuArr.indexOf(mObj);
                      return Container(
                        // margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        decoration: selectMenu == index
                            ? BoxDecoration(color: TColor.primary, boxShadow: [
                          BoxShadow(
                              color: TColor.primary,
                              blurRadius: 10,
                              offset: const Offset(0, 3))
                        ])
                            : null,
                        child: GestureDetector(
                          onTap: () {

                            if(index == 1) {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailbookView(bObj: {},)  ) );
                              sideMenuScaffoldKey.currentState?.closeEndDrawer();

                            }else if (index == 7) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const AccountView()));
                              sideMenuScaffoldKey.currentState
                                  ?.closeEndDrawer();
                            }

                            //

                            setState(() {
                              selectMenu = index;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                mObj["name"].toString(),
                                style: TextStyle(
                                    color: selectMenu == index
                                        ? Colors.white
                                        : TColor.text,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Icon(
                                mObj["icon"] as IconData? ?? Icons.home,
                                color: selectMenu == index
                                    ? Colors.white
                                    : Colors.white,
                                size: 33,
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList()),
                Container(
                  margin:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings,
                            color: TColor.subTitle,
                            size: 25,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Terns",
                          style: TextStyle(
                              color: TColor.subTitle,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Privacy",
                          style: TextStyle(
                              color: TColor.subTitle,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          const HomeView(),
          const BookView(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: TColor.BACK, // Sesuaikan dengan warna yang diinginkan// Ubah sesuai kebutuhan
        buttonBackgroundColor: Colors.lightBlueAccent, // Warna latar belakang tombol
        height: 50, // Sesuaikan tinggi yang diinginkan
        onTap: (index) {
          setState(() {
            controller?.index = index; // Update indeks controller
          });
        },
        items: <Widget>[
          _buildIcon(Icons.home, 0),
          _buildIcon(Icons.search, 1),
          _buildIcon(Icons.menu, 2),
          _buildIcon(Icons.shopping_bag, 3),
        ],
      ),
    );
  }
  Widget _buildIcon(IconData icon, int index) {
    return Icon(
      icon,
      color: controller?.index == index ? Colors.white : Colors.white,
    );
  }
}




