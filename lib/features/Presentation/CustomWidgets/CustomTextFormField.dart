// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String ContentType;
  final bool obscureText;
  final IconData prefixicon;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.ContentType,
    required this.obscureText,
    required this.prefixicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
      child: Card(
        elevation: 5,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          child: Center(
            child: TextFormField(
              controller: controller,
              style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 17),

              obscureText: obscureText,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: ContentType,
                hintTextDirection: TextDirection.ltr,
                hintStyle: GoogleFonts.aBeeZee(fontSize: 15),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
