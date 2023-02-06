import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resuables/size.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final GestureTapCallback onPress;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.purpleAccent,
      shape:
          OutlineInputBorder(borderRadius: BorderRadius.circular(MySize.s10!)),
      height: MySize.s50,
      minWidth: Get.width,
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: MySize.s20),
      ),
    );
  }
}
