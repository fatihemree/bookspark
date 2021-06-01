import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/product/widget/bottomSheet/bottomSheet.dart';
import 'package:fluttermvvmtemplate/views/book_detail/book_detail_view.dart';
// import 'package:fluttermvvmtemplate/views/oldHome/home_view.dart';
import 'package:fluttermvvmtemplate/views/home/home_view.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    // OldHomeView(),
    BookDetail(),
    // Center(child: Text('Keşfet...')),
    Center(child: Text('Kitaplar...')),
    Center(child: Text('Chart Menu...')),
    Center(child: Text('Profil...')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: false,
      bottomNavigationBar: Container(
        height: context.height * .08,
        color: context.colors.surface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            bottomNavigationBarItem(context, 'home', 0),
            bottomNavigationBarItem(context, 'discovery', 1),
            addOpenSheetPage(context, 'add'),
            bottomNavigationBarItem(context, 'chartMenu', 2),
            bottomNavigationBarItem(context, 'user', 3),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  Expanded bottomNavigationBarItem(BuildContext context, String icon, int index,
      {Color color}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _onItemTapped(index);
        },
        child: SvgPicture.asset(
          'asset/svg/${icon}.svg',
          color: _selectedIndex == index
              ? context.colors.primaryVariant
              : context.colors.secondary,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  Expanded addOpenSheetPage(BuildContext context, String icon) {
    return Expanded(
      child: BottomSheetWidget(
        child: SvgPicture.asset(
          'asset/svg/${icon}.svg',
          // color: _selectedIndex == index
          // ? context.colors.primaryVariant
          // :
          color: context.colors.secondary,
          width: 24,
          height: 24,
        ),
        heightPercent: .4,
        // isOpen: (isOpen)=> ,
        headerTitle: 'Kitap Ekle',
        bottomSheet: Container(
          child: Text('fatih'),
        ),
        // headerTitle: 'Okuyanlar',
      ),
    );
  }
}
