
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../resuables/size.dart';

class CustomTextFormFeild extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final GestureTapCallback? onTap;
  final int? maxLength;
  final String? errorText;
  final double? borderRadius;
  final double? hintfontsize;
  final Color? bordercolor;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final BorderSide? borderSide;
  final bool readOnly;
  final bool? enabled;
  final bool? isDense;
  final bool? isCollapsed;
  final AutovalidateMode? autovalidateMode;

  CustomTextFormFeild({
    Key? key,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
    this.maxLength,
    this.errorText,
    this.onTap,
    this.fillColor,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.readOnly = false,
    this.borderRadius,
    this.bordercolor,
    this.hintfontsize,
    this.borderSide,
    this.contentPadding,
    this.isDense,
    this.isCollapsed,
    this.enabled,
  }) : super(key: key);
  late ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Column(
      children: [
        TextFormField(
          enabled: enabled,
          autovalidateMode: autovalidateMode,
          onTap: onTap,
          maxLength: maxLength,
          controller: controller,
          inputFormatters: const [],
          readOnly: readOnly,
          decoration: InputDecoration(
            counterText: "",
            filled: true,
            fillColor: Colors.purple.shade100,
            errorText: errorText,
            hintText: hintText,
            isDense: isDense,
            isCollapsed: isCollapsed ?? false,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                    vertical: MySize.s10!, horizontal: MySize.s10!),
            enabledBorder: OutlineInputBorder(
              borderSide: borderSide ?? BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius ?? MySize.s10!),
            ),
            border: OutlineInputBorder(
              borderSide: borderSide ?? BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius ?? MySize.s10!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: borderSide ?? BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius ?? MySize.s10!),
            ),
          ),
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
        ),
      ],
    );
  }
}
