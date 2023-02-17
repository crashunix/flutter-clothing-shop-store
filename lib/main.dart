import 'package:flutter/material.dart';
import 'package:flutter_clothing_store/app_styles.dart';
import 'package:flutter_clothing_store/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    "All Items",
    "Dress",
    "Hat",
    "Watch",
  ];

  List<String> icons = [
    'all_items_icon',
    'dress_icon',
    'hat_icon',
    'watch_icon'
  ];

  List<String> images = [
    'image-01',
    'image-02',
    'image-03',
    'image-04',
    'image-05'
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hello, Welcome 👋',
                        style: kEncodeSansRegular.copyWith(
                            color: kDarkBrown,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5)),
                    Text('Albert Stevano',
                        style: kEncodeSansBold.copyWith(
                            color: kDarkBrown,
                            fontSize: SizeConfig.blockSizeHorizontal! * 4))
                  ],
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: kGrey,
                  backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/women/90.jpg'),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  style: kEncodeSansRegular.copyWith(
                      color: kDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 13),
                      prefixIcon: const IconTheme(
                          data: IconThemeData(color: kDarkGrey),
                          child: Icon(Icons.search)),
                      hintText: 'Search clothes...',
                      border: kInputBorder,
                      errorBorder: kInputBorder,
                      disabledBorder: kInputBorder,
                      focusedBorder: kInputBorder,
                      focusedErrorBorder: kInputBorder,
                      enabledBorder: kInputBorder,
                      hintStyle: kEncodeSansRegular.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5)),
                )),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 49,
                  width: 49,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: kBlack),
                  child: SvgPicture.asset('assets/filter_icon.svg'),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                        color: current == index ? kBrown : kWhite,
                        borderRadius: BorderRadius.circular(8),
                        border: current == index
                            ? null
                            : Border.all(color: kLightGrey, width: 1)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            "assets/${icons[index]}${current == index ? '_selected' : '_unselected'}.svg")
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
