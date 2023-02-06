import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resuables/size.dart';

class CustomWidget extends StatefulWidget {
  final Widget child;
  final String pageName;
  final Widget? backButton;
  const CustomWidget(
      {super.key,
      required this.child,
      required this.pageName,
      this.backButton});

  @override
  State<CustomWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height / 3,
                  width: Get.width,
                  padding: EdgeInsets.only(
                      top: MySize.s10!, left: MySize.s8!, right: MySize.s8!),
                  decoration: const BoxDecoration(color: Colors.purple),
                  child: widget.backButton ?? Container(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MySize.s100!),
                  child: Container(
                    width: Get.width,
                    height: Get.height / 1.1,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MySize.s34),
                        topRight: Radius.circular(MySize.s34),
                      ),
                    ),
                    child: widget.child,
                  ),
                ),
                Positioned(
                  top: Get.height / 11,
                  left: Get.width / 3.2,
                  child: Container(
                    height: MySize.s50,
                    width: MySize.s150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple.shade200,
                    ),
                    child: Center(
                      child: Text(
                        widget.pageName,
                        style: TextStyle(
                          fontSize: MySize.s20!,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
