//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:project1/screens/home_page.dart';
import 'package:project1/screens/next_page.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  late MobileScannerController cameraController;

  @override
  void initState() {
    super.initState();
    cameraController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

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
                  alignment: Alignment.topCenter,
                  width: size.width * 1,
                  height: size.height * 0.75,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Column(
                    children: [
                      Image.asset('assets/LankaQR_Banner.png'),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width * 0.7,
                          height: size.height * 0.4,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 2)),
                          child: MobileScanner(
                              controller: cameraController,
                              allowDuplicates: false,
                              onDetect: (barcode, args) {
                                if (barcode.rawValue == null) {
                                  debugPrint('Failed to scan Barcode');
                                } else {
                                  final String code = barcode.rawValue!;
                                  debugPrint('Barcode found! $code');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NextPage(code: code)),
                                  );
                                }
                              }),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: size.width * 0.1,
                          height: size.height * 0.05,
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
                          child: IconButton(
                            color: Colors.white,
                            icon: ValueListenableBuilder(
                              valueListenable: cameraController.torchState,
                              builder: (context, state, child) {
                                switch (state as TorchState) {
                                  case TorchState.on:
                                    return const Icon(Icons.flash_on,
                                        color: Colors.yellow);
                                  case TorchState.off:
                                    return const Icon(Icons.flash_on,
                                        color: Colors.grey);
                                }
                              },
                            ),
                            alignment: Alignment.center,
                            iconSize: 28.0,
                            onPressed: () => cameraController.toggleTorch(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text('Place above square direct to the QR code.',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    const SizedBox(height: 20),
                    const Text('You will be re-direct to the result screen',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    const Text('automatically.',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF9F9F9)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      child: const Text(
                        'Back to Dashboard',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}
