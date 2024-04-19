import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:peminjam_perpustakaan_app/config/palette.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:peminjam_perpustakaan_app/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../../register/controllers/register_controller.dart';


class LoginView extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginView> {
  final LoginController controller = Get.put(LoginController()); // Inisialisasi controller di sini
  final RegisterController controllerregis = Get.put(RegisterController()); // Inisialisasi controller di sini

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  bool isSignupSection = true;

  void handleLogin() {
    String email = emailController.text;
    String password = passwordController.text;
    controller.login(email, password); // Panggil metode login di dalam controller dengan nilai username dan password
  }
  void handleRegis() {
    String email = emailController.text;
    String password = passwordController.text;
    String confirm = confirmpassController.text;
    String username = usernameController.text;
    controllerregis.register(username, email, password, confirm); // Panggil metode login di dalam controller dengan nilai username dan password
  }

  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(), // Initialize LoginController
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/loginn.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              // Trick to add the shadow for the submit button
              isSignupScreen
                  ? buildBottomHalfContainer2(
                false,
                usernameController,
                emailController,
                passwordController,
                confirmpassController,
              )
                  : buildBottomHalfContainer(false, emailController, passwordController),
              //Main Contianer for Login and Signup
              AnimatedPositioned(
                duration: Duration(milliseconds: 700),
                curve: Curves.bounceInOut,
                top: isSignupScreen ? 200 : 230,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.bounceInOut,
                  height: isSignupScreen ? 385 : 250,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5),
                      ]),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: !isSignupScreen
                                            ? Palette.activeColor
                                            : Palette.textColor1),
                                  ),
                                  if (!isSignupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "SIGNUP",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isSignupScreen
                                            ? Palette.activeColor
                                            : Palette.textColor1),
                                  ),
                                  if (isSignupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                        if (isSignupScreen) buildSignupSection(),
                        if (!isSignupScreen) buildSigninSection()
                      ],
                    ),
                  ),
                ),
              ),
              // Trick to add the submit button
              isSignupScreen
                  ? buildBottomHalfContainer2(
                false,
                usernameController,
                emailController,
                passwordController,
                confirmpassController,
              )
                  : buildBottomHalfContainer(false, emailController, passwordController),

            ],
          ),
        );
      },
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.person, "masukan username anda", false, true, emailController,
            controller.formKey,),
          buildTextField(
              MaterialCommunityIcons.lock_outline, "masukan password anda", true, false, passwordController,
              controller.formKey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text("Remember me",
                      style: TextStyle(fontSize: 12, color: Palette.textColor1))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField2(MaterialCommunityIcons.account_outline, "Buatlah user Name",
              false, false, usernameController),
          buildTextField2(
              MaterialCommunityIcons.email_outline, "Masukan Email", false, true, emailController),
          buildTextField2(
              MaterialCommunityIcons.lock_outline, "Buatlah Password", true, false, passwordController),
          buildTextField2(
              MaterialCommunityIcons.lock_outline, "Tulis ulang Password anda", true, false, confirmpassController),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dengan mengklik tombol di samping",
                        style: TextStyle(fontSize: 12, color: Palette.textColor1),
                      ),
                      SizedBox(height: 8), // Spasi antara dua teks
                      Text(
                        "Anda menyetujui semua kebijakan dari kami",
                        style: TextStyle(fontSize: 12, color: Palette.textColor1),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow, TextEditingController emailController, TextEditingController passwordController) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 500 : 437,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: showShadow
                ? [
              BoxShadow(
                color: Colors.black.withOpacity(.3),
                spreadRadius: 1.5,
                blurRadius: 10,
              )
            ]
                : [],
          ),
          child: GestureDetector(
            onTap: () {
              String email = emailController.text;
              String password = passwordController.text;
              controller.login(email, password);
              print('email: ${emailController.text}'); // Menggunakan string interpolation
              print('password: ${passwordController.text}');//encetak nilai dari TextField password
            },
            child: !showShadow
                ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo[400]!,
                    Colors.purple[200]!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            )
                : null,
          ),
        ),
      ),
    );
  }


  Widget buildBottomHalfContainer2(bool showShadow, TextEditingController usernameController, TextEditingController emailController, TextEditingController passwordController, TextEditingController confirmpassController) {
    return AnimatedPositioned(
        duration: Duration(milliseconds: 700),
        curve: Curves.bounceInOut,
        top: isSignupScreen ? 530 : 437,
        right: 0,
        left: 0,
        child: GestureDetector(
          onTap: () {
            String username = usernameController.text;
            String email = emailController.text;
            String password = passwordController.text;
            String confirm = confirmpassController.text;

            print('username: $username'); // Menggunakan string interpolation
            print('email: $email'); // Menggunakan string interpolation
            print('password: ${passwordController.text}');//encetak nilai dari TextField password
            print('confirmpassword: ${confirmpassController.text}');//encetak nilai dari TextField password

            // Mengirim nilai ke controller
            // controller.register(username,email, password , confirm );
          },
          child: Center(
            child: Container(
              height: 90,
              width: 90,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    if (showShadow)
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1.5,
                        blurRadius: 10,
                      )
                  ]),
              child: !showShadow
                  ? Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.purple[200]!, Colors.indigo[400]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1))
                    ]),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              )
                  : Center(),
            ),
          ),
        )
    );
  }

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail, TextEditingController controller, GlobalKey<FormState> formKey) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }



  Widget buildTextField2(
      IconData icon, String hintText, bool isPassword, bool isEmail, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }
}