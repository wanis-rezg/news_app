import 'package:flutter/material.dart';
 
class CustomTextFormField extends StatelessWidget {
 const CustomTextFormField({super.key,
 required this.controller,

required this.hintText,
required this.label,
required this.validator,
this.maxLines,
this.obscureText,
this.suffix,
});

final String hintText;
final TextEditingController? controller;
final String label;
final Function(String?)? validator;
final int? maxLines;
final bool? obscureText;
final Widget? suffix;


   @override
   Widget build(BuildContext context) {
    return Column
    (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),),
SizedBox(height: 10,),
        TextFormField(
          controller: controller,
          validator:validator != null
                  ? (String? value) => validator!(value)
                  : null,
          maxLines: maxLines,
          obscureText: obscureText??false,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffix,
          ),
      
        ),
      ],
    );
  }
}