import 'package:flutter/material.dart';
import 'package:flutter_session6/about_screen.dart';
import 'package:flutter_session6/more_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = TweenSequence(
      [
        TweenSequenceItem(
          tween: Tween<double>(begin: 0.8, end: 1.2),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: 1.2, end: 0.8),
          weight: 1,
        ),
      ],
    ).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      MyHomePageContent(_controller, _animation),
      AboutPage(),
      MorePage(),
    ];

    List<Map<String, dynamic>> _bottomNavBarItems = [
      {
        'icon': Icons.home_outlined,
        'selectedIcon': Icons.home,
        'label': 'Home',
      },
      {
        'icon': Icons.contacts_outlined,
        'selectedIcon': Icons.contacts,
        'label': 'About',
      },
      {
        'icon': Icons.info_outline,
        'selectedIcon': Icons.info,
        'label': 'More Info',
      },
    ];

    List<String> _appbar = ["Home", "About Me", "More Info"];

    return Scaffold(
      appBar: AppBar(
        title: Text(_appbar.elementAt(_currentIndex)),
        backgroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          child: Container(
            color: Colors.white.withOpacity(0.5), // Warna bottom border
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(1.0),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: List.generate(_bottomNavBarItems.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == index
                  ? _bottomNavBarItems[index]['selectedIcon']
                  : _bottomNavBarItems[index]['icon'],
              color: _currentIndex == index ? Colors.blue : Colors.white,
            ),
            label: _bottomNavBarItems[index]['label'],
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class MyHomePageContent extends StatelessWidget {
  final AnimationController _controller;
  final Animation<double> _animation;

  MyHomePageContent(this._controller, this._animation);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: child,
              );
            },
            child: Text(
              'Welcome To',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: child,
              );
            },
            child: Text(
              'My Portfolio!',
              style: TextStyle(
                fontSize: 28.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
