import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grootanapps/widgets/main_ui.dart';
import 'package:grootanapps/widgets/tabbarview.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../resuables/size.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Homescreen> {
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
      pageName: "LAST LOGIN",
      child: const Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Tabbarviewwidget(),
      ),
    );
  }
}





