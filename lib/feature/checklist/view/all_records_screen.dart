import 'package:auto_route/auto_route.dart';
import 'package:demo_app/components/search_input_decorations.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class AllRecordsScreen extends StatefulWidget {
  const AllRecordsScreen({super.key});

  @override
  State<AllRecordsScreen> createState() => _AllRecordsScreenState();
}

class _AllRecordsScreenState extends State<AllRecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'All Records',
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
                    colorFilter: const ColorFilter.mode(
                        AppPalette.black, BlendMode.srcIn)),
              ),
            ),
          )),
      body: Container(
        color: AppPalette.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              25.height,
              TextFormField(
                //controller: searchKeyword,
                decoration: SearchInputDecoration.kFormStyle.copyWith(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search for user\'s name, House No',
                  hintStyle: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6A707F),
                      fontWeight: FontWeight.w400),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Color(0xff6A707F),
                  ),
                ),
                onChanged: (value) {
                  /* if (value.isNotEmpty) {
                          setState(() {
                           
                            filteredItems =
                                controller.patientsList.where((item) {
                              String fullName =
                                  "${item.firstname} ${item.surname}";
                              String searchValue = value.trim().toLowerCase();
                              String fullNameLower = fullName.toLowerCase();
                              return fullNameLower.contains(searchValue);
                            }).toList();
                          });
                        } else {
                          setState(
                              () => filteredItems = controller.patientsList);
                        } */
                },
              ),
              25.height,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 13.0, // spacing between rows
                      crossAxisSpacing: 13.0, // spacing between columns

                      children: const [
                        AllRecordsCard(
                            fullName: 'Hauwa Abdullahi Sani hiyiyuy',
                            recordsNumber: '789 Records'),
                        AllRecordsCard(
                            fullName: 'Hauwa Abdullahi Sani hiyiyuy',
                            recordsNumber: '789 Records'),
                        AllRecordsCard(
                            fullName: 'Hauwa Abdullahi Sani hiyiyuy',
                            recordsNumber: '789 Records'),
                        AllRecordsCard(
                            fullName: 'Abdulrahman Abdullahi Sani',
                            recordsNumber: '789 Records'),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AllRecordsCard extends StatelessWidget {
  final String fullName;
  final String recordsNumber;
  const AllRecordsCard(
      {super.key, required this.fullName, required this.recordsNumber});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppPalette.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppPalette.primary.primary100,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
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
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          fullName.substring(0, 1),
                          style: const TextStyle(
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
              ),
            ), //CircleAvatar
          ),
          4.height,
          Text(
            fullName,
            maxLines: 1,
            style: const TextStyle(
              color: AppPalette.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.24,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          4.height,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  recordsNumber,
                  style: TextStyle(
                    color: AppPalette.grey.gray370,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.24,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
