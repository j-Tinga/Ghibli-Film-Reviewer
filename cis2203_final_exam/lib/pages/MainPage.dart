import 'package:cis2203_final_exam/pages/LibraryPage.dart';
import 'package:cis2203_final_exam/pages/WatchListPage.dart';
import 'package:cis2203_final_exam/pages/ReviewsPage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //init variables
  PageController _pageController = PageController();
  List<Widget> _screens = [LibraryPage(), WatchListPage(), ReviewsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books,
              color: _selectedPage == 0 ? Colors.blue : Colors.grey,
            ),
            title: Text('Library',
                style: TextStyle(
                  color: _selectedPage == 0 ? Colors.blue : Colors.grey,
                )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
              color: _selectedPage == 1 ? Colors.blue : Colors.grey,
            ),
            title: Text('Watch List',
                style: TextStyle(
                  color: _selectedPage == 1 ? Colors.blue : Colors.grey,
                )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stars,
              color: _selectedPage == 2 ? Colors.blue : Colors.grey,
            ),
            title: Text('Review',
                style: TextStyle(
                  color: _selectedPage == 2 ? Colors.blue : Colors.grey,
                )),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: _onPageTapped,
      ),
    );
  }

  int _selectedPage = 0;
  void _onPageChanged(int current_index) {
    setState(() {
      _selectedPage = current_index;
    });
  }

  void _onPageTapped(int selectedPage) {
    _pageController.jumpToPage(selectedPage);
  }
}
