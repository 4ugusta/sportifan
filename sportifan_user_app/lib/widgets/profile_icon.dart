import 'package:flutter/material.dart';
import 'package:sportifan_user/screens/main/profile.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileIcon extends StatefulWidget {
  final ValueNotifier<String> selectedAvatar;
  final String faceName;
  final VoidCallback onTap;

  const ProfileIcon({
    Key? key,
    required this.selectedAvatar,
    required this.faceName,
    required this.onTap,
  }) : super(key: key);

  @override
  _ProfileIconState createState() => _ProfileIconState();
}

class _ProfileIconState extends State<ProfileIcon> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: widget.selectedAvatar,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: widget.onTap,
          child: SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/face/${widget.faceName}.svg',
                  height: 64.0,
                  width: 64.0,
                ),
                Visibility(
                  visible: value == widget.faceName,
                  child: Positioned(
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                        shadows: [
                          BoxShadow(
                            color: Color(0x28000000),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Icon(
                        Icons.check_circle_outline_rounded,
                        size: 16,
                        color: Color.fromRGBO(35, 143, 32, 1),
                      ),
                    ),
                    right: 0,
                    top: 0,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
