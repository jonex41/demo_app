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
class ChildrenRegisteredScreen extends StatefulWidget {
  const ChildrenRegisteredScreen({super.key});

  @override
  State<ChildrenRegisteredScreen> createState() => _ChildrenRegisteredScreenState();
}

class _ChildrenRegisteredScreenState extends State<ChildrenRegisteredScreen> {
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
            'Children Registered',
            style: context.theme.appTextTheme.bodyMedium16.copyWith(
              color: AppPalette.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          //centerTitle: true,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              20.height,
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          appRoute.push(const ChildrenRegisteredDetailRoute());
                        },
                        child: _buildUserCard(users[index]));
                  },
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
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xff7A7C7F), fontSize: 13)),
          ),
          Text(value, style: const TextStyle(color: Color(0xff7A7C7F), fontSize: 13)),
        ],
      ),
    );
  }
}
