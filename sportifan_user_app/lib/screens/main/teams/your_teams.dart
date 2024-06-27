import 'package:flutter/material.dart';
import 'package:sportifan_user/constants/colors_all.dart';
import 'package:sportifan_user/screens/homeview.dart';
import 'package:sportifan_user/screens/main/teams/create_team.dart';
import 'package:sportifan_user/screens/main/teams/edit_team.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sportifan_user/widgets/team_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class YourTeams extends ConsumerStatefulWidget {
  const YourTeams({super.key});

  @override
  ConsumerState<YourTeams> createState() => _YourTeamsState();
}

class _YourTeamsState extends ConsumerState<YourTeams> {
  List<String> teamNames = [
    'TeamIcon',
    'TeamIcon2',
    'TeamIcon3',
    'TeamIcon4',
    'TeamIcon5',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController teamController = TextEditingController();
    TextEditingController uidController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: IndexedStack(
          index: _currentIndex,
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
                    padding: EdgeInsets.all(0.5.h),
                    decoration: ShapeDecoration(
                      color: const Color.fromRGBO(248, 248, 248, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.25.h),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        ref.read(counterProvider.notifier).update(0);
                      },
                      child: Icon(
                        Icons.navigate_before,
                        size: 3.h,
                        color: ColorsAll.greenCol,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: (20 / 8).h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Your Teams',
                        style: TextStyle(
                          color: const Color(0xFF262626),
                          fontSize: 20.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.5.h, vertical: 0.5.h),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = 1; // Add this line
                            });
                          },
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentIndex =
                                    1; // This line changes the _currentIndex to 1, which corresponds to the CreateTeam widget in the IndexedStack
                              });
                            },
                            child: Text(
                              'New Team +',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF238F20),
                                fontSize: 8.5.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  teamNames.isEmpty
                      ? SizedBox(
                          width: 100.w - (32 / 3.6).w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 4.h,
                              ),
                              SizedBox(
                                width: (212.18 / 3.6).w,
                                height: (169 / 8).h,
                                child: Image.asset(
                                  'assets/images/empty_teams.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                'Oh So Empty !',
                                style: TextStyle(
                                  color: const Color(0xFFFF0000),
                                  fontSize: 20.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                'Create custom teams using phone number',
                                style: TextStyle(
                                  color: const Color(0xFF727272),
                                  fontSize: 10.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              CustomButton(
                                text: 'Create Team',
                                callback: () {},
                                height: (36 / 8).h,
                                width: 100.w - (32 / 3.6).w,
                                color: const Color(0xFF238F20),
                                fontSize: 10.sp,
                              )
                            ],
                          ))
                      : Column(
                          children: teamNames
                              .map((teamName) => TeamCard(
                                    iconName: teamName,
                                    onDelete: () async {
                                      bool shouldDelete =
                                          await deleteDialog(context);
                                      if (shouldDelete) {
                                        setState(() {
                                          teamNames.remove(teamName);
                                        });
                                      }
                                    },
                                    onEdit: () {
                                      setState(() {
                                        _currentIndex =
                                            2; // Index of EditScreen in the IndexedStack
                                      });
                                    },
                                  ))
                              .toList(),
                        ),
                ],
              ),
            ),
            CreateTeam(
              teamController: teamController,
              uidController: uidController,
              onTeamCreated: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            EditTeam(
              teamController: teamController,
              uidController: uidController,
              onTeamEdited: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<bool> deleteDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 2.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.h), // Border radius here
        ),
        backgroundColor: const Color(0xFFF7F7F7),
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
                    'Are your sure you want to delete',
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
                    'team KKR ?',
                    style: TextStyle(
                      color: const Color(0xFF262626),
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
                          Navigator.of(context).pop(true);
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 0.h, horizontal: 0.h)),
                        ),
                        child: Container(
                          width: (137 / 3.6).w,
                          height: 6.h,
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFF238F20)),
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                          ),
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
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF238F20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1.h)),
                          ),
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
