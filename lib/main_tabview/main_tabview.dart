import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

int _selectedIndex = 0;

class _MainTabViewState extends State<MainTabView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) => states.contains(WidgetState.selected)
                ? TextStyle(
                    color: Tcolor.primaryColor,
                    fontFamily: 'BentoSans',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2)
                : TextStyle(color: Tcolor.buttonText, fontFamily: 'BentoSans'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: NavigationBar(
            height: 60,
            elevation: 0,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            indicatorColor: Tcolor.primaryColor,
            backgroundColor: Colors.black,
            destinations: <NavigationDestination>[
              NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: Tcolor.buttonText,
                  ),
                  label: 'Inicio'),
              NavigationDestination(
                  icon: Icon(
                    Icons.store,
                    color: Tcolor.buttonText,
                  ),
                  label: 'Lojas'),
              NavigationDestination(
                  icon: Icon(
                    Icons.shopify,
                    color: Tcolor.buttonText,
                  ),
                  label: 'Pedido'),
              NavigationDestination(
                  icon: Icon(
                    Icons.account_circle_rounded,
                    color: Tcolor.buttonText,
                  ),
                  label: 'Usuario'),
            ],
          ),
        ),
      ),
      body: SafeArea(
        // top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            HomeView(),
            Container(
              color: Colors.red[300],
            ),
            Container(
              color: Colors.red[500],
            ),
            Container(
              color: Colors.green[300],
            ),
          ],
        ),
      ),
    );
  }
}
