import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../configs/constants/Spaces.dart';

class AuthTextcontainer extends StatelessWidget {
  const AuthTextcontainer({
    Key? key,
    required this.issecure,
    required this.Content,
    required this.controller,
  }) : super(key: key);
  final String Content;
  final TextEditingController controller;
  final bool issecure;
 
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.sizeOf(context).width/1.1,
      child: TextFormField(
        controller: controller,
        obscureText: issecure,
        style: GoogleFonts.aldrich(color: Colors.white),
        decoration: InputDecoration(
          
          labelStyle: GoogleFonts.aldrich(color: Colors.white),
          labelText: Content,
          fillColor: Colors.white,
          hintText: Content,
          alignLabelWithHint: true,
          hintStyle: Spaces.Getstyle(13,Colors.white.withOpacity(0.5),FontWeight.bold),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            
            borderSide: const BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5),
          )
        ),
      ),
    );
  }
}
