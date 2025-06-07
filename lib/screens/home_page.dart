import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/screens/last_page.dart';
import 'package:project1/screens/next_page.dart';
import 'package:project1/screens/qr_page.dart';
import 'package:flutter/services.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String path;

  Future<void> _scanQRFromGallery(String path) async {
  try {
    String barcode = await scanner.scanPath(path);
    debugPrint("Scanned QR code: $barcode");
    Navigator.push(context,
      MaterialPageRoute(builder: (context) =>  NextPage(code: barcode,)),
    );

  } catch (e) {
    debugPrint("Error while scanning QR code: $e");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LastPage()),
    );
  }
}


  Future<void> _openGallery() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      debugPrint('Image path: ${pickedFile.path}');
      setState( (){
        path = pickedFile.path;
      });
      
    }
  }
  // void _navigateToResultScreen(String scannedQR) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => NextPage(code:scannedQR),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(fit: StackFit.expand, children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/Home_Screen.png',
            fit: BoxFit.fitWidth,
            height: size.height * 0.45,
          ),
        ),
        Column(
          children: [
            FractionalTranslation(
              translation: const Offset(0.0, 0.6),
              child: Image.asset(
                'assets/LankaQR_Logo.png',
                width: size.width * 0.3,
                height: size.height * 0.15,
                alignment: Alignment.topCenter,
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              'Qr Code Validator',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Use this application to validate any LankaQR codes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const Text(
              'easily. fast. and accurately.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Positioned(
          top: 290,
          left: 10,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () {
                SystemNavigator.pop();
              },
              child: SizedBox(
                  width: size.width * 0.1,
                  height: size.height * 0.05,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: Colors.white,
                        child: const Center(
                          child: Icon(
                            Icons.power_settings_new,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ),
                      ))),
            ),
          ),
        ),
        Positioned(
          top: 400,
          left: 50,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QrPage()),
                  );
                },
                child: Container(
                  width: size.width * 0.7,
                  height: size.height * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Image.asset(
                            'assets/Qr_Logo.png',
                            height: size.height * 0.07,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                          child: Text.rich(TextSpan(
                              text: 'SCAN ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              children: <InlineSpan>[
                            TextSpan(
                                text: 'QR ',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'CODE',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])
                          ])))
                    ],
                  ),
                )),
          ),
        ),
        Column(
          children: [
            const FractionalTranslation(
                translation: Offset(0.0, 29.0),
                child: Center(
                  child: Text('Scan QR code from Gallery.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black)),
                )),
            const SizedBox(height: 550),
            const Text('Once upload the QR to the app, you will be',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black)),
            const SizedBox(height: 1),
            const Text('redirect to the result screen.',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black)),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _openGallery,
                      child: Container(
                        alignment: Alignment.center,
                        height: size.height * 0.08,
                        width: size.width * 0.6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(4, 8),
                              ),
                            ]),
                        child: const Text('Choose QR Code',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: GestureDetector(
                          onTap: (){_scanQRFromGallery(path);},
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width * 0.15,
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(0, 6),
                                  ),
                                ]
                              ),
                              child: const Center(
                                  child: Icon(
                                    Icons.upload,
                                    color: Colors.black,
                                    size: 24.0,
                                  ),
                                ),
                          ),
                        )),
                  ]),
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
                color: Colors.black)
            ),
          ],
        )
      ])),
    );
  }
}
