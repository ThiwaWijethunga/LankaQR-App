import 'package:flutter/material.dart';
import 'package:project1/screens/home_page.dart';
import 'package:project1/screens/qr_page.dart';

class LastPage extends StatefulWidget {
  const LastPage({Key? key}) : super(key: key);

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(fit: StackFit.expand, children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.3,
                color: const Color(0xff201B51),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Image.asset(
                        'assets/LankaQR_Logo.png',
                        width: size.width * 0.4,
                        height: size.height * 0.2,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Qr Code Validator',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Scan Result',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'assets/Cross.png',
                      width: size.width * 0.3,
                      height: size.height * 0.2,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'Validation Failed',
                      style: TextStyle(fontSize: 24, color: Color(0xffD84200)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'No Data Found',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QrPage()));
                    },
                    child: Container(
                        width: size.width * 0.6,
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              offset: Offset(4, 8),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 50.0),
                          child: Text(
                            'Back to Scanner',
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      child: const Icon(
                        Icons.home,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                      'This application developed by DirectPay for developers,',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black)),
                  const SizedBox(height: 5),
                  const Text(
                    'merchants and community. Version 1.0',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black
                    )
                  ),
                ],
              )
            ],
          )
        ]
      )));
  }
}
