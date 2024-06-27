import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sportifan_user/widgets/add_player.dart';
import 'package:sportifan_user/widgets/added_player.dart';
import 'package:sportifan_user/widgets/custom_add_player_button.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sportifan_user/widgets/player.dart';
import 'package:sportifan_user/widgets/team_logo.dart';
import 'package:sizer/sizer.dart';

class CreateTeam extends StatefulWidget {
  final Function onTeamCreated;
  final TextEditingController teamController;
  final TextEditingController uidController;
  const CreateTeam({
    super.key,
    required this.teamController,
    required this.uidController,
    required this.onTeamCreated,
  });

  @override
  State<CreateTeam> createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  List<Player> players = [];
  Player? userPlayer;
  bool isAddPlayerVisible = false;

  @override
  void initState() {
    super.initState();
    userPlayer = Player(name: 'user', age: 23); // Initialize userPlayer here
  }

  void addPlayer(Player player) {
    setState(() {
      players.add(player);
      isAddPlayerVisible = false;
    });
  }

  void removePlayer(int index) {
    setState(() {
      players.removeAt(index);
    });
  }

  void removeUserPlayer() {
    setState(() {
      userPlayer = null;
    });
  }

  void createTeam() {
    widget.onTeamCreated();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController ageController = TextEditingController();
    TextEditingController playerNameController = TextEditingController();

    final GlobalKey addedPlayerKey = GlobalKey();
    double addedPlayerHeight =
        addedPlayerKey.currentContext?.size?.height ?? 6.h;
    return WillPopScope(
      onWillPop: () async {
        return await showCheckoutDialog(context, createTeam);
      },
      child: SafeArea(
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 3.h,
                          height: 3.h,
                          decoration: ShapeDecoration(
                            color: const Color.fromRGBO(248, 248, 248, 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                          ),
                          child: GestureDetector(
                            child: Icon(
                              Icons.navigate_before,
                              size: 3.h,
                              color: const Color.fromRGBO(35, 143, 32, 1),
                            ),
                            onTap: () async {
                              if (await showCheckoutDialog(
                                  context, createTeam)) {
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: (20 / 8).h,
                        ),
                        Text(
                          'Create Team',
                          style: TextStyle(
                            color: const Color(0xFF262626),
                            fontSize: 20.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Enter your team name',
                          style: TextStyle(
                            color: const Color(0xFF262626),
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        SizedBox(
                          height: (38 / 8).h,
                          child: TextField(
                            textAlign: TextAlign.left,
                            controller: widget.teamController,
                            cursorColor: const Color(0xFFBDDEBD),
                            decoration: InputDecoration(
                              hintText: '',
                              hintStyle: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 13.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: (7 / 8).h, horizontal: 1.5.h),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF238F20),
                                    width: (1 / 8).h),
                                borderRadius: BorderRadius.circular(1.h),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF238F20),
                                    width: (1 / 8).h),
                                borderRadius: BorderRadius.circular(1.h),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: (7 / 8).h,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text(
                      'Choose Team Logo  ',
                      style: TextStyle(
                        color: const Color(0xFF262626),
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  SizedBox(
                    height: 8.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 2.h,
                        ),
                        const TeamLogo(isActive: true, iconName: 'TeamIcon'),
                        SizedBox(
                          width: 2.h,
                        ),
                        const TeamLogo(isActive: false, iconName: 'TeamIcon2'),
                        SizedBox(
                          width: 2.h,
                        ),
                        const TeamLogo(isActive: false, iconName: 'TeamIcon5'),
                        SizedBox(
                          width: 2.h,
                        ),
                        const TeamLogo(isActive: false, iconName: 'TeamIcon3'),
                        SizedBox(
                          width: 2.h,
                        ),
                        const TeamLogo(isActive: false, iconName: 'TeamIcon4'),
                        SizedBox(
                          width: 2.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: (15 / 8).h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Team Members',
                          style: TextStyle(
                            color: const Color(0xFF262626),
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Add members using their phone number',
                          style: TextStyle(
                            color: const Color(0xFF727272),
                            fontSize: 10.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          height: 5.h,
                          child: TextField(
                            textAlign: TextAlign.left,
                            controller: widget.uidController,
                            cursorColor: const Color(0xFFBDDEBD),
                            decoration: InputDecoration(
                              hintText: '“XXX-XXXX”',
                              hintStyle: TextStyle(
                                color: const Color(0xFFBDDEBD),
                                fontSize: 13.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              contentPadding: EdgeInsets.only(
                                  top: (7 / 8).h, bottom: (9 / 8).h, left: 1.h),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF238F20),
                                    width: (1 / 8).h),
                                borderRadius: BorderRadius.circular(1.h),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF238F20),
                                    width: (1 / 8).h),
                                borderRadius: BorderRadius.circular(1.h),
                              ),
                              suffixIcon: Icon(
                                Icons.search,
                                color: const Color(0xFFBDDEBD),
                                size: 3.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: const Color(0xFFFBC400),
                      strokeWidth: (2 / 3.6).w,
                      radius: Radius.circular(1.h),
                      padding: EdgeInsets.zero,
                      child: IntrinsicHeight(
                        child: Container(
                          width: 100.w - (32 / 3.6).w,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDEDB3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1.h)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (userPlayer != null)
                                AddedPlayer(
                                  sNo: 1,
                                  playerName: 'user',
                                  age: 23,
                                  onDelete: removeUserPlayer,
                                ),
                              if (userPlayer == null && players.isEmpty)
                                Container(
                                  height: addedPlayerHeight,
                                  color: Colors.transparent,
                                ),
                              ...players.asMap().entries.map((entry) {
                                int index = entry.key;
                                Player player = entry.value;

                                return AddedPlayer(
                                  sNo: index + 1,
                                  playerName: player.name,
                                  age: player.age,
                                  onDelete: () => removePlayer(index),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (isAddPlayerVisible)
                    AddPlayer(
                      playerNameController: playerNameController,
                      ageController: ageController,
                      onAdd: addPlayer,
                    ),
                  AddPlayerButton(
                    onPressed: () {
                      setState(() {
                        isAddPlayerVisible =
                            true; // Show AddPlayer widget when button is clicked
                      });
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: CustomButton(
                      text: 'Save',
                      callback: () {},
                      height: (36 / 8).h,
                      width: 100.w - (32 / 3.6).w,
                      color: const Color(0xFF238F20),
                      fontSize: 10.sp,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> showCheckoutDialog(BuildContext context, Function createTeam) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 2.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.h), // Border radius here
        ),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.info_outline,
                        color: const Color.fromRGBO(255, 0, 0, 1),
                        size: 3.h,
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Icon(
                      Icons.close_sharp,
                      color: const Color.fromRGBO(115, 115, 115, 1),
                      size: 3.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Are your sure you want to discard ?',
                    style: TextStyle(
                      color: const Color(0xFF262626),
                      fontSize: 13.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    'Changes wont be saved !',
                    style: TextStyle(
                      color: const Color(0xFF727272),
                      fontSize: 13.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          createTeam();
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 0.h, horizontal: 0.h)),
                        ),
                        child: Container(
                          width: (137 / 3.6).w,
                          height: 6.h,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFF238F20)),
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Yes',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF238F20),
                                fontSize: 13.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 0.h, horizontal: 0.h)),
                        ),
                        child: Container(
                          width: (137 / 3.6).w,
                          height: 6.h,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF238F20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1.h)),
                          ),
                          child: Center(
                            child: Text(
                              'No',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  ).then((value) => value ?? false);
}
