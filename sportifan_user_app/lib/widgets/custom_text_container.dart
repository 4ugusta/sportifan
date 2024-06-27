import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/constants/colors_all.dart';

class CustomTextWidget extends StatelessWidget {
  final String header;
  final String subject;
  const CustomTextWidget({super.key, required this.header, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2.0,
        color: ColorsAll.gold,
        radius: Radius.circular(12),
      
        child: Container(
      decoration: BoxDecoration(
        color: ColorsAll.litYel,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
          padding: EdgeInsets.all(8),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black45),),
          SizedBox(height: 8,),
         
          Text(subject,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12),)
        ],
       ),
        
      )),
    );
  
  }
}