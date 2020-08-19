import 'package:familysupermarket/screens/SearchScreen.dart';
import 'package:familysupermarket/screens/cartScreen.dart';
import 'package:familysupermarket/screens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/screens/supermarketscreen.dart';
import 'package:familysupermarket/screens/OrderScreen.dart';

int currentIndex = 0;
List<int> history = [0];

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFFA63F85),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFFE9E9E9),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 28),
          title: Text(
            '',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 30,
          ),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            size: 25,
          ),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 30),
          title: Text(
            '',
          ),
        ),
      ],
      onTap: (int index) {
        if (index == 0) {
          history.add(index);
          setState(() {
            currentIndex = index;
          });
          Navigator.pushNamed(context, SupermarketScreen.id).then((value) {
            history.removeLast();
            setState(() {
              currentIndex = history.last;
            });
          });
        } else if (index == 1) {
          history.add(index);
          setState(() {
            currentIndex = index;
          });
          Navigator.pushNamed(context, SearchScreen.id).then((value) {
            history.removeLast();
            setState(() {
              currentIndex = history.last;
            });
          });
        } else if (index == 2) {
          history.add(index);
          setState(() {
            currentIndex = index;
          });
          Navigator.pushNamed(context, CartScreen.id).then((value) {
            history.removeLast();
            setState(() {
              currentIndex = history.last;
            });
          });
        } else if (index == 3) {
          history.add(index);
          setState(() {
            currentIndex = index;
          });
          Navigator.pushNamed(context, ProfileSCreen.id).then((value) {
            history.removeLast();
            setState(() {
              currentIndex = history.last;
            });
          });
        }
      },
    );
  }
}
