import 'package:flutter/material.dart';
 
class CustomTextFormField extends StatefulWidget {
 const CustomTextFormField({super.key,
 required this.controller,

required this.hintText,
required this.label,
required this.validator,
this.maxLines=1,
this.obscureText=false,
this.suffix,
});

final String hintText;
final TextEditingController? controller;
final String label;
final Function(String?)? validator;
final int? maxLines;
final bool obscureText;
final Widget? suffix;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isVisible = false;
   @override
   Widget build(BuildContext context) {
    return Column
    (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),),
SizedBox(height: 10,),
        TextFormField(
          controller: widget.controller,
          validator:widget.validator != null
                  ? (String? value) => widget.validator!(value)
                  : null,
          maxLines: widget.maxLines,
          obscureText:
          widget.obscureText &&
           !_isVisible,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.obscureText ? IconButton(onPressed: (){
                  _isVisible = !_isVisible;
                  
                  setState(() {});
                }, 
                icon: _isVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off)) : null,
             
          )
      
        ),
      ],
    );
  }
}