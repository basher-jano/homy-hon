import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:homy_hon/core/utils/textStyles.dart';

class TextFormProperty extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final int? maxlines;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool isObscure;
  final TextAlign? textAlign;
  final bool? readOnly;
  final double? horizntalPadding;
  final double? verticalPadding;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;
  final double? height;
  final double? width;
  final double? borderRadius;
  final VoidCallback? onComplete;
  final Function(String value)? onChanged;

  const TextFormProperty(
      {Key? key,
      this.borderRadius,
      this.labelText,
      this.errorText,
      this.isObscure = false,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.fillColor,
      this.hintText,
      this.hintStyle,
      this.textStyle,
      this.keyboardType,
      this.height,
      this.readOnly,
      this.onComplete,
      this.onChanged,
      this.width,
      this.textAlign,
      this.horizntalPadding,
      this.verticalPadding,
      this.maxlines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        height: height,
        width: width,
        child: TextFormField(
          textAlign: textAlign ?? TextAlign.center,
          onChanged: (value) {
            if (onChanged != null) onChanged!(value);
          },
          validator: (value) {  
            print("sad");
            if (value!.isEmpty) {
              return "this field is requierd";
            }
            return null;
          },
          onEditingComplete: onComplete,
          readOnly: readOnly ?? false,
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          style: textStyle,
          obscureText: isObscure,
          controller: controller,
          cursorColor: Colors.deepOrange,
          maxLines: maxlines ?? 4,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: horizntalPadding ?? 20.0,
                vertical: verticalPadding ?? 10),
            hintStyle: hintStyle,
            hintText: hintText,
            prefixIcon: prefixIcon,
            filled: true,
            enabled: true,
            fillColor: fillColor ?? Colors.grey.withOpacity(0.15),
            border: InputBorder.none,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 8.0)),
                borderSide: const BorderSide(
                  color: Colors.white,
                )),
            disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.15),
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 8.0)),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.15),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 8.0)),
                borderSide: const BorderSide(
                  color: Colors.white,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 4.0)),
                borderSide: const BorderSide(color: Colors.red)),
            labelText: labelText,
            labelStyle: TextStyles.textStyle16,
            errorText: errorText,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
