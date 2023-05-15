import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:ncg_shopping_app/views/screens/sidebar_screens/categories_screen.dart';
import 'package:ncg_shopping_app/views/screens/sidebar_screens/dashboard_screen.dart';
import 'package:ncg_shopping_app/views/screens/sidebar_screens/orders_screen.dart';
import 'package:ncg_shopping_app/views/screens/sidebar_screens/products_screen.dart';
import 'package:ncg_shopping_app/views/screens/sidebar_screens/upload_banner.dart';
import 'package:ncg_shopping_app/views/screens/sidebar_screens/vendor_screen.dart';
import 'package:ncg_shopping_app/views/screens/sidebar_screens/withdrawal_screen.dart';

class WelcomeDashBoard extends StatefulWidget {
  const WelcomeDashBoard({Key? key}) : super(key: key);

  @override
  State<WelcomeDashBoard> createState() => _WelcomeDashBoardState();
}

class _WelcomeDashBoardState extends State<WelcomeDashBoard> {
  //Widget _selectedItem = DashboardScreen();
  Widget _selectedItem = DashboardScreen();

  screenSelector(item) {
    switch (item) {
      case 'Dashboard':
        setState(() {
          _selectedItem = DashboardScreen();
        });
        break;
      case 'Products':
        setState(() {
          _selectedItem = ProductScreen();
        });
        break;
      case 'Categories':
        setState(() {
          _selectedItem = CategoriesScreen();
        });
        break;
      case 'Orders':
        setState(() {
          _selectedItem = OrderScreen();
        });
        break;
      case 'Vendors':
        setState(() {
          _selectedItem = VendorScreen();
        });
        break;
      case 'Withdrawal':
        setState(() {
          _selectedItem = WithdrawaScreen();
        });
        break;
      case 'Upload Banner':
        setState(() {
          _selectedItem = UploadBanner();
        });
        break;
      default:
        setState(() {
          _selectedItem = DashboardScreen();
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Color.fromARGB(255, 221, 216, 216),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vendor Dashboard'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: DashboardScreen.routeName,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Vendor',
            route: VendorScreen.routeName,
            icon: CupertinoIcons.person_3,
          ),
          AdminMenuItem(
            title: 'Withdrawal',
            route: WithdrawaScreen.routeName,
            icon: CupertinoIcons.money_euro,
          ),
          AdminMenuItem(
            title: 'Orders',
            icon: CupertinoIcons.shopping_cart,
            route: OrderScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Categories',
            icon: Icons.category,
            route: CategoriesScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Products',
            icon: CupertinoIcons.cart,
            route: ProductScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Upload Banner',
            icon: CupertinoIcons.add,
            route: UploadBanner.routeName,
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) => screenSelector(item.title),
        width: 250,
        backgroundColor: Colors.tealAccent,
        borderColor: Color.fromARGB(255, 215, 28, 28),
        textStyle: const TextStyle(color: Colors.black, fontSize: 20),
        activeBackgroundColor: Color.fromARGB(255, 218, 215, 215),
        activeIconColor: Colors.black,
        activeTextStyle: const TextStyle(color: Colors.blueGrey, fontSize: 20),
        iconColor: Colors.black,
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff1428db),
          child: const Center(
            child: Text(
              'Multi Vendor Admin Dashboard',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff1428db),
          child: const Center(
            child: Text(
              '@2023 - NOFLIE CONSULTING GROUP',
              style: TextStyle(
                color: Colors.white,
                decorationColor: Colors.amber,
                fontSize: 11,
              ),
            ),
          ),
        ),
      ),
      body: _selectedItem,
      
    );
  
  }
}
