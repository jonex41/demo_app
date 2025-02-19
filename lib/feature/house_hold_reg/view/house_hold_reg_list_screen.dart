import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class HouseHoldRegListScreen extends StatefulWidget {
  const HouseHoldRegListScreen({super.key});

  @override
  State<HouseHoldRegListScreen> createState() => _HouseHoldRegListScreenState();
}

class _HouseHoldRegListScreenState extends State<HouseHoldRegListScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  "Household register",
                  style: context.theme.appTextTheme.titleSmall24.copyWith(
                      color: AppPalette.black, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            15.height,
            _buildSectionTitle("Enlisted Household"),
            const SizedBox(height: 10),
            _buildSearchBar(),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return _buildUserCard(users[index]);
                },
              ),
            ),
          ],
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
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            _buildInfoRow("House No:", user["houseNo"]!),
            _buildInfoRow("Household No:", user["householdNo"]!),
            _buildInfoRow("Household head phone no.", user["phone"]!),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff027D52),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(
                    Icons.remove_red_eye,
                    size: 16,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "View",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    appRoute.push(const HouseHoldReg2Route());
                  },
                ),
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
                style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
          Text(value, style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }
}
