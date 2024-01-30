import 'package:flutter/material.dart';
import 'package:project1/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
         // fit: StackFit.expand,
          children: [
            Column(
              children: [
                Container(
                  width: size.width ,
                  height: size.height * 0.69,
                  child: Image.asset(
                    'assets/Loading_Screen_Image.png',
                    fit: BoxFit.fitWidth,
                    height: size.height * 1,
                  ),
                ),
                Container(
                   // alignment: Alignment.bottomCenter,
                    width: size.width * 1,
                    height: size.height * 0.31,
                    color: const Color(0xff201B51),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: Image.asset(
                            'assets/LankaQR_Logo.png',
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                          ),
                        ),
                        const Text(
                          'Qr Code Validator',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'From',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          'Direct Pay',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
