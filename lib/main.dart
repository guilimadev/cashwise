// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:cashwise/pages/expanses.dart';
import 'package:cashwise/pages/home.dart';
import 'package:cashwise/pages/analysis.dart';
import 'package:cashwise/pages/wallet.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(fontFamily: 'Prompt');

    return MaterialApp(
      title: 'Alimenta Brasil',
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Color.fromRGBO(7, 29, 65, 1),
          secondary: Color.fromRGBO(212, 229, 255, 1),
          tertiary: Color.fromRGBO(171, 50, 24, 1),
          onTertiary: Color.fromRGBO(255, 222, 215, 1),
          background: Color.fromRGBO(43, 40, 40, 1),
          onBackground: Color.fromRGBO(255, 255, 255, 1),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(7, 29, 65, 1),
            fontSize: MediaQuery.of(context).size.height * 0.035,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: MediaQuery.of(context).size.height * 0.025,
          ),
          titleSmall: TextStyle(
              fontFamily: 'Prompt',
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: MediaQuery.of(context).size.height * 0.015,
              fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(7, 29, 65, 1),
            fontSize: MediaQuery.of(context).size.height * 0.02,
          ),
        ),
      ),
      home: MyHomePageState(
        index: 0,
      ),
    );
  }
}

class MyHomePageState extends StatefulWidget {
  final int index;

  const MyHomePageState({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<MyHomePageState> createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends State<MyHomePageState> {
  final _pageController = PageController(initialPage: 0);

  final List<Widget> _children = [
    Home(),
    WalletPage(),
    Analysis(),
    Expanses(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children:
              List.generate(_children.length, (index) => _children[index]),
        ),
        extendBody: true,
        bottomNavigationBar: (_children.length <= 4)
            ? AnimatedNotchBottomBar(
                color: Theme.of(context).colorScheme.background,
                showShadow: false,
                itemLabelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: MediaQuery.of(context).size.height * 0.013),
                pageController: _pageController,
                bottomBarItems: [
                  BottomBarItem(
                    inActiveItem: FaIcon(
                      FontAwesomeIcons.house,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    activeItem: FaIcon(
                      FontAwesomeIcons.house,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                  BottomBarItem(
                    inActiveItem: FaIcon(
                      FontAwesomeIcons.wallet,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    activeItem: FaIcon(
                      FontAwesomeIcons.wallet,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                  BottomBarItem(
                    inActiveItem: FaIcon(
                      FontAwesomeIcons.chartColumn,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    activeItem: FaIcon(
                      FontAwesomeIcons.chartColumn,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                  BottomBarItem(
                    inActiveItem: FaIcon(
                      FontAwesomeIcons.dollarSign,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    activeItem: FaIcon(
                      FontAwesomeIcons.dollarSign,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    if (index == 2) {
                      currentpage = 2;
                    } else if (index == 1) {
                      currentpage = 1;
                    } else if (index == 3) {
                      currentpage = 3;
                    } else {
                      currentpage = 0;
                    }
                  });

                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                  );
                },
              )
            : null);
  }
}
