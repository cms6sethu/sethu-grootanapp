import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grootanapps/widgets/buttonwidget.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../resuables/size.dart';

class Tabbarviewwidget extends StatefulWidget {
  const Tabbarviewwidget({super.key});

  @override
  State<Tabbarviewwidget> createState() => _TabbarviewwidgetState();
}

class _TabbarviewwidgetState extends State<Tabbarviewwidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            color: Colors.black,
            margin: const EdgeInsets.all(10),
            child: TabBar(
              controller: tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.purple,
              ),
              tabs: const [
                Tab(
                  child: Text('Today'),
                ),
                Tab(
                  child: Text('Yesterday'),
                ),
                Tab(
                  child: Text('Other'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return buildcontainer(
                      time: '2.55 PM',
                      ip: 'IP:123.123.123.123 ',
                      city: 'chennai',
                    );
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return buildcontainer(
                      time: '2.55 PM',
                      ip: 'IP:123.123.123.123 ',
                      city: 'chennai',
                    );
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return buildcontainer(
                      time: '2.55 PM',
                      ip: 'IP:123.123.123.123 ',
                      city: 'chennai',
                    );
                  },
                ),
              ],
            ),
          ),
          ButtonWidget(
            title: 'Save',
            onPress: () {},
          ),
        ],
      ),
    );
  }

  buildcontainer({
    required String time,
    required String ip,
    required String city,
    // required String image,
    SfBarcodeGenerator? qrcode,
  }) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(MySize.s10!),
          padding: EdgeInsets.all(MySize.s15!),
          height: Get.height / 8,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MySize.s10!),
            color: Colors.white24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    ip,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    city,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: MySize.s20,
          top: 0,
          child: Container(
            padding: EdgeInsets.all(MySize.s3),
            height: MySize.s100,
            width: MySize.s100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MySize.s10!),
              color: Colors.white,
            ),
            child: SfBarcodeGenerator(
              value: 'www.syncfusion.com',
              symbology: QRCode(),
              showValue: false,
            ),
          ),
        ),
      ],
    );
  }
}
