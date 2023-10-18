import 'package:flutter/material.dart';
import '../../core/constant/colors.dart';

Widget buildMaterialTextField({
  required TextEditingController controller,
  required String labelText,
  bool obscureText = false,
  Widget? suffixIcon,
  FormFieldValidator<String>? validator,
}) {
  return SizedBox(
    width: 350,
    child: Material(
      elevation: 10,
      shadowColor: AppColors.buttonBackground,
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: AppColors.white,
          labelStyle: const TextStyle(
            color: AppColors.textColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.avatarColor,
            ),
          ),
          contentPadding: const EdgeInsets.all(15.0),
          suffixIcon: suffixIcon,
        ),
        obscureText: obscureText,
        validator: validator,
      ),
    ),
  );
}