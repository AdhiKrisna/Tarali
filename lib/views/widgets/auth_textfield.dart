import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint;
  final String helper;
  final double pFontSize, pLabelSize;
  final bool isNumber, isDense, isPassword;

  const AuthTextField({
    required this.controller,
    required this.label,
    required this.hint,
    this.helper = '',
    this.pFontSize = 0.02,
    this.pLabelSize = 0.02,
    this.isNumber = false,
    this.isDense = true,
    this.isPassword = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LocalController localC = Get.put(LocalController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * pLabelSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Obx(
          () => TextFormField(
            controller: controller,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            obscureText:
                localC.isShowPassword.isFalse && isPassword ? true : false,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * pFontSize,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: white,
              hintText: hint,
              helperText: helper == '' ? null : helper,
              isDense: isDense,
              contentPadding:  const EdgeInsets.all(10),
              hintStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * pFontSize,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: greyText,
                ),
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () => localC.togglePassword(),
                      icon: Icon(
                        localC.isShowPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    )
                  : null,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class LocalController extends GetxController {
  RxBool isShowPassword = false.obs;
  void togglePassword() {
    isShowPassword.value = !isShowPassword.value;
  }
}
