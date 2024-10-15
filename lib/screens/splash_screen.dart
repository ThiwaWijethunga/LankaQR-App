import 'package:app_links/src/app_links.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  final AppLinks appLinks;

  const SplashScreen({Key? key, required this.appLinks}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Uri? _initialUri;

  @override
  void initState() {
    _fetchInitialLink();

    super.initState();
    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => const HomePage()),
    //   );
    // });
  }

  Future<void> _fetchInitialLink() async {
    try {
      final initialUri = await widget.appLinks.getInitialLink();
      setState(() {
        _initialUri = initialUri;
      });
    } catch (e) {
      print('Failed to get initial link: $e');
    }
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  HomePage(uri:_initialUri.toString())),
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
                SizedBox(
                  width: size.width,
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
                          padding: const EdgeInsets.only(top: 20),
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
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
