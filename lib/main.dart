import 'package:flutter/material.dart';
import 'package:flutter_clothing_store/app_styles.dart';
import 'package:flutter_clothing_store/size_config.dart';

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
          Row(
            children: [
              Expanded(
                  child: TextField(
                style: kEncodeSansRegular.copyWith(
                    color: kDarkGrey,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                controller: TextEditingController(),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 13),
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
              ))
            ],
          )
        ],
      ),
    );
  }
}
