import 'package:flutter/material.dart';
import 'package:project1/screens/home_page.dart';
import 'package:project1/screens/qr_page.dart';
//import 'package:flutter_test_app/widgets/shadowbox.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NextPage extends StatefulWidget {
  final String code;
  const NextPage({Key? key, required this.code}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  late final WebViewController controller;
  var loadingPercentage = 0;
  bool isError = false; // Flag to track if an error occurred

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
          Uri.parse('https://sandbox.directpay.lk/qr/validate/${widget.code}'));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.3,
                color: const Color(0xFF201B51),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(children: [
                    Image.asset(
                      "assets/LankaQR_Logo.png",
                      height: size.height * 0.15,
                    ),
                    const Text(
                      "Qr Code Validator",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.width * 1,
                child: loadingPercentage < 100
                    ? Center(
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white24,
                            child: const CircularProgressIndicator(
                              color: Colors.black,
                            )),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 10, right: 20, bottom: 10),
                        child: WebViewWidget(
                          controller: controller,
                        ),
                      ),
              ),
              SizedBox(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (c) => const HomePage()));
                              },
                              icon: const Icon(
                                Icons.home,
                              ),
                              iconSize: 40,
                              color: const Color(0xFF707070),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const QrPage()));
                              },
                              child: Container(
                                height: size.height * 0.06,
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF9F9F9),
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 4,
                                      offset: Offset(4, 8),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Text(
                                    "Back to Scanner",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF201B51),
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "This application developed by DirectPay for devolopers",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10),
                      ),
                      const Text(
                        "merchants and communiunity version 1.0 ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  )
                ),
              ],
            ),
          )
        );
  }
}
