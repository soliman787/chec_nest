import 'package:chec_nest/features/home/presentation/manager/category_product_cubit/category_product_cubit.dart';
import 'package:chec_nest/features/home/presentation/views/category_view/widgets/category_view_body.dart';
import 'package:chec_nest/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:chec_nest/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatefulWidget {
  final String category;

  const CategoryView({super.key, required this.category});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    super.initState();
    // Fetch the categorized products when the widget is initialized
    context
        .read<CategoryProductCubit>()
        .fetchCategorizedProducts(category: widget.category);
  }

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
      appBar: CustomAppBar(
        title: widget.category,
      ),
      body: const CategoryViewBody(),
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
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox,
                color: _selectedIndex == 2 ? Colors.orange : Colors.grey),
            label: 'Inbox',
            tooltip: 'Inbox',
          ),
          BottomNavigationBarItem(
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
