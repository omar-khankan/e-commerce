import 'package:e_commerce/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? textFormFieldHintText;
  final String? lableText;
  final Color? fillColor;
  final IconData? suffIcon;
  final Color? suffIconColor;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    super.key,
    this.textFormFieldHintText,
    this.lableText,
    this.fillColor,
    this.suffIcon,
    this.suffIconColor,
    this.isPassword,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword ?? false,
      obscuringCharacter: "*",
      decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.red),
          labelText: lableText,
          labelStyle: const TextStyle(color: Colors.white),
          hintText: textFormFieldHintText,
          hintStyle: const TextStyle(color: AppColors.whitecolor),
          filled: true,
          fillColor: fillColor,
          suffixIcon: suffIcon != null
              ? Icon(
                  suffIcon,
                  color: suffIconColor,
                )
              : null),
    );
  }
}
