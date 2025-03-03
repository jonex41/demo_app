import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class ChildrenRegisteredDetailScreen extends StatefulWidget {
  const ChildrenRegisteredDetailScreen({super.key});

  @override
  State<ChildrenRegisteredDetailScreen> createState() => _ChildrenRegisteredDetailScreenState();
}

class _ChildrenRegisteredDetailScreenState extends State<ChildrenRegisteredDetailScreen> {
  final List<Map<String, String>> users = [
    {
      "name": "Kabir Bunkure",
      "houseNo": "CHIPS/260102/01/01",
      "householdNo": "CHIPS/260102/01/01002",
      "phone": "+234702*******",
      "date": "04/04/2023",
      "time": "05:38PM"
    },
    {
      "name": "Tanko Ali",
      "houseNo": "CHIPS/260102/01/01",
      "householdNo": "CHIPS/260102/01/01002",
      "phone": "+234702*******",
      "date": "04/04/2023",
      "time": "05:38PM"
    },
    {
      "name": "Amirah Usman",
      "houseNo": "CHIPS/260102/01/01",
      "householdNo": "CHIPS/260102/01/01002",
      "phone": "+234702*******",
      "date": "04/04/2023",
      "time": "05:38PM"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Angwar’s Record',
            style: context.theme.appTextTheme.bodyMedium16.copyWith(
              color: AppPalette.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppPalette.white,
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: InkWell(
              onTap: () => appRoute.pop(),
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset("assets/images/back.svg",
                    colorFilter: const ColorFilter.mode(AppPalette.black, BlendMode.srcIn)),
              ),
            ),
          )),
      body: Container(
        color: AppPalette.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildSearchBar(),
                    20.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xffEEFFF9),
                        border: Border.all(width: 1.5, color: AppPalette.primary.primary80),
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 54,
                            height: 54,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 54,
                                    height: 54,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFF2ECE96),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'H',
                                    style: TextStyle(
                                      color: Color(0xFFFEFEFE),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          10.height,
                          Text(
                            'Child’s Name',
                            style: context.theme.appTextTheme.bodyMedium16.copyWith(
                              fontSize: 13,
                              color: AppPalette.grey.gray350,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          5.height,
                          Text(
                            'Maryam Abdullahi',
                            style: context.theme.appTextTheme.bodyMedium16.copyWith(
                              color: AppPalette.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          5.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Caregiver’s Name:',
                                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                  fontSize: 13,
                                  color: AppPalette.grey.gray350,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Asma\'u Umar',
                                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                  fontSize: 13,
                                  color: AppPalette.grey.gray350,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          5.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Caregiver’s Contact:',
                                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                  fontSize: 13,
                                  color: AppPalette.grey.gray350,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '08037867439',
                                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                  fontSize: 13,
                                  color: AppPalette.grey.gray350,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: AppPalette.white,
                                      backgroundColor: AppPalette.primary.primary400,
                                      padding: const EdgeInsets.all(5.0),
                                      fixedSize: const Size(180, 45),
                                      textStyle: context.theme.appTextTheme.bodyMedium16.copyWith(
                                          fontSize: 14,
                                          color: AppPalette.white,
                                          fontWeight: FontWeight.w700),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8))),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Add New Record',
                                        style: TextStyle(color: AppPalette.white, fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: AppPalette.white,
                                        size: 20,
                                      )
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    20.height,
                    Expanded(
                      child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                appRoute.push(const ChildrenRegisteredViewRoute());
                              },
                              child: _buildUserCard(users[index]));
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search for users",
        prefixIcon: const Icon(Icons.search),
        //suffixIcon: const Icon(Icons.filter_1_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }

  Widget _buildUserCard(Map<String, String> user) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user["name"]!,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            const SizedBox(height: 5),
            _buildInfoRow("House No:", user["houseNo"]!),
            _buildInfoRow("Household No:", user["householdNo"]!),
            _buildInfoRow("Household head phone no.", user["phone"]!),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                10.height,
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      user["date"]!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 15),
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 5),
                    Text(user["time"]!, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xff7A7C7F), fontSize: 12)),
          ),
          Text(value, style: const TextStyle(color: Color(0xff7A7C7F), fontSize: 12)),
        ],
      ),
    );
  }
}
