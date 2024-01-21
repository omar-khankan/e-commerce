import 'package:e_commerce/core/enums/text_type.dart';
import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String enterText;
  final TextType? textType;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;
  const TextCustom({
    super.key,
    required this.enterText,
    this.textType,
    this.fontWeight,
    this.fontSize,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      enterText,
      style: getStyle(size),
    );
  }

  TextStyle getStyle(Size size) {
    TextStyle result = const TextStyle();
    switch (textType) {
      case TextType.title_text:
        result = TextStyle(
            fontSize: size.width / 15,
            fontWeight: fontWeight ?? FontWeight.bold,
            color: fontColor);
        break;
      case TextType.big_text:
        result = TextStyle(
            fontSize: size.width / 19,
            fontWeight: fontWeight ?? FontWeight.bold,
            color: fontColor);
        break;
      case TextType.stander_text:
        result = TextStyle(
            fontSize: size.width / 25,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: fontColor);
        break;
      case TextType.small_text:
        result = TextStyle(
            fontSize: size.width / 30,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: fontColor);
        break;
      case TextType.cutsom_text:
        result = TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        );
        break;
      default:
        result = TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        );
        break;
    }
    return result;
  }
}
