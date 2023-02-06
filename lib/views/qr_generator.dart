import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grootanapps/views/loged_user.dart';
import 'package:grootanapps/widgets/buttonwidget.dart';
import 'package:grootanapps/widgets/main_ui.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../resuables/size.dart';

class QRPage extends StatefulWidget {
  const QRPage({super.key});

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
      backButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: MySize.s25,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: MySize.s22,
              ),
            ),
          ),
        ],
      ),
      pageName: "PLUGIN",
      child: const QRCodeGenerator(),
    );
  }
}

class QRCodeGenerator extends StatelessWidget {
  const QRCodeGenerator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Stack(
            children: [
              Container(
                height: Get.height / 3.4,
                width: Get.width / 1.1,
                margin: const EdgeInsets.all(60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MySize.s20!),
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.purple,
                      Colors.grey,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Generated number',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MySize.s24,
                      ),
                    ),
                    SizedBox(
                      height: MySize.s15,
                    ),
                    Text(
                      '12345',
                      style: TextStyle(
                        fontSize: MySize.s30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MySize.s12,
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(MySize.s20!),
                    ),
                    height: MySize.s200,
                    width: MySize.s200,
                    child: SfBarcodeGenerator(
                      barColor: Colors.black,
                      value: 'www.syncfusion.com',
                      symbology: QRCode(),
                      showValue: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MySize.s40,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: MySize.s34, right: MySize.s34),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const Homescreen());
                  },
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MySize.s10!),
                        border: Border.all(color: Colors.white)),
                    child: const Center(
                      child: Text(
                        'Last login at Today, 11 AM',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MySize.s30,
                ),
                ButtonWidget(
                  title: "Save",
                  onPress: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
