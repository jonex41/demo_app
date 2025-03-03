import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class MaternalServiceList2Screen extends StatefulWidget {
  const MaternalServiceList2Screen({super.key});

  @override
  State<MaternalServiceList2Screen> createState() =>
      _HouseHoldRegListScreenState();
}

class _HouseHoldRegListScreenState extends State<MaternalServiceList2Screen> {
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        appRoute.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Assets.icons.backPage.svg(
                          height: 30,
                          width: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    20.width,
                    Text(
                      "Angwar Record`s",
                      overflow: TextOverflow.ellipsis,
                      style: context.theme.appTextTheme.bodyLarge18.copyWith(
                          color: AppPalette.black, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                15.height,
                // _buildSectionTitle("Enlisted Household"),
                //const SizedBox(height: 10),
                _buildSearchBar(),
                15.height,
                _topCard(),
                15.height,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          appRoute.push(const MaterDetailsRoute());
                        },
                        child: _buildUserCard(users[index]));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section title with background
  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: context.width(),
      // height: 4,
      decoration: BoxDecoration(
        color: const Color(0xffFEF6FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Search bar widget
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

  /// User card UI
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
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
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
                    Text(user["date"]!),
                    const SizedBox(width: 15),
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 5),
                    Text(user["time"]!),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// Helper function to format info rows
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xff7A7C7F))),
          ),
          Text(value, style: const TextStyle(color: Color(0xff7A7C7F))),
        ],
      ),
    );
  }

  Widget _topCard() {
    return Card(
      color: Colors.green[50], // Light green background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    'A',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "Pregnant Woman's Name:",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              "Angwar Hausa",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Age:",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const Text(
                  "32 years",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phone Number:",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const Text(
                  "08037867439",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.arrow_forward, size: 16),
              label: const Text("Add New Record"),
            ),
          ],
        ),
      ),
    );
  }
}
