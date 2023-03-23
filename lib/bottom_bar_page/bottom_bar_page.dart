import 'package:flutter/material.dart';
import 'package:lendmark/main.dart';

class NavigatorAllPage extends StatefulWidget {
  final int index;

  const NavigatorAllPage({Key? key, this.index = 0}) : super(key: key);

  @override
  State<NavigatorAllPage> createState() => _NavigatorAllPageState();
}

class _NavigatorAllPageState extends State<NavigatorAllPage> {
  int _bottomNavIndex = 0;
  List widgetList = [];

  @override
  void initState() {
    _bottomNavIndex = widget.index;
    widgetList = [const first(), const second()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _bottomNavIndex,
          children: const [first(), second()],
        ),
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: Colors.white,
              size: 30,
            ),
            label: 'Featured',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: Colors.white,
              size: 30,
            ),
            label: 'List',
          ),
        ],
        currentIndex: _bottomNavIndex,
        onTap: (int index) {
          setState(
            () {
              _bottomNavIndex = index;
              if (_bottomNavIndex == 0)
              {
                print("HI");
                (widgetList[_bottomNavIndex] as first).createState().initState();
              }
              else
              {
                print("Hello");
                (widgetList[_bottomNavIndex] as second).createState().initState();
              }
            },
          );
        },
      ),
    );
  }
}
