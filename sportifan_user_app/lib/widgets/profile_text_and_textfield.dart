import 'package:flutter/material.dart';

class ProfileTextAndTextfield extends StatelessWidget {
  final String text;
  final String hintText;
  const ProfileTextAndTextfield(
      {super.key, required this.text, required this.hintText});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF727272),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 40,
            child: TextField(
              controller: controller,
              cursorColor: Color(0xFFB5B5B5),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xFFB5B5B5),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 7.0, horizontal: 19),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF238F20), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF238F20), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
