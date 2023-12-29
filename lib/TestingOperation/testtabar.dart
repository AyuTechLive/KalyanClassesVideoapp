import 'package:flutter/material.dart';

class TestTabBar extends StatefulWidget {
  const TestTabBar({super.key});

  @override
  State<TestTabBar> createState() => _TestTabBarState();
}

class _TestTabBarState extends State<TestTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3, // Define the number of tabs
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBar(
                backgroundColor: Colors.white,
                      bottom: TabBar(
                   dividerColor: Colors.amber,
                   indicatorColor:Color(0xFF7455F7) ,
                   indicatorSize: TabBarIndicatorSize.label, 
                   labelColor: Color(0xFF7455F7),
                   
                   
                   
                     
              tabs: [
                Tab(text: 'Lectures'), // Tab 1
                Tab(text: 'Notes'), // Tab 2
                Tab(text: 'Test'), // Tab 3
              ],
                      ),
                    ),
            )
            )
            );
            
  }
}
