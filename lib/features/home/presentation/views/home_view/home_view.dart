import 'package:chec_nest/features/home/presentation/views/home_view/widgets/home_view_body.dart';
import 'package:chec_nest/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:chec_nest/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'All Deals',),
      body: const HomeViewBody(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectedIndex == 0 ? Colors.orange : Colors.grey),
            label: 'Home',
            tooltip: 'Home',
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border,
                color: _selectedIndex == 1 ? Colors.orange : Colors.grey),
            label: 'Favorites',
            tooltip: 'Favorites',
          ),          BottomNavigationBarItem(
            icon: Icon(Icons.inbox,
                color: _selectedIndex == 2 ? Colors.orange : Colors.grey),
            label: 'Inbox',
            tooltip: 'Inbox',
          ),          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,
                color: _selectedIndex == 3 ? Colors.orange : Colors.grey),
            label: 'Account',
            tooltip: 'Account',
          ),
          // Add other BottomNavigationBarItems here
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),

    );
  }
}



