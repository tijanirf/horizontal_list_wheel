import 'package:flutter/material.dart';
import 'package:horizontal_list_wheel/horizontal_list_wheel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Horizontal List Wheel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Horizontal List Wheel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController();
  bool isNormalList;

  @override
  void initState() {
    isNormalList = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: isNormalList ? _buildNormalList() : _buildCircularList(),
      ),
      floatingActionButton: RaisedButton(
        onPressed: () => _toggleList(),
        child: Text('Change List'),
      ),
    );
  }

  List _cardList = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Text('Title 0'),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Text('Title 1'),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Text('Title 2'),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Text('Title 3'),
      ),
    ),
  ];

  _toggleList() {
    setState(() {
      isNormalList = !isNormalList;
    });
  }

  _buildNormalList() {
    return HorizontalListWheel(
      controller: _scrollController,
      direction: Axis.horizontal,
      perspective: 0.005,
      itemExtent: 100,
      childCount: 10,
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
              ),
              child: Text('Title $index'),
            ),
          );
        },
      ),
    );
  }

  _buildCircularList() {
    return HorizontalListWheel(
      controller: _scrollController,
      direction: Axis.horizontal,
      perspective: 0.005,
      itemExtent: 100,
      childDelegate: ListWheelChildLoopingListDelegate(
        children: List.generate(_cardList.length, (index) {
          return _cardList[index];
        }),
      ),
    );
  }
}
