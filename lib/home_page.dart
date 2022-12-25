import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List myTiles = [
    'A',
    'B',
    'C',
    'D',
  ];

  void updateMyTiles(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }

      final tile = myTiles.removeAt(oldIndex);

      myTiles.insert(newIndex, tile);

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag & Drop List'),
      ),
      body: ReorderableListView(
        children: [
          for (final tile in myTiles)
            ListTile(
              key: ValueKey(tile),
              title: Text(tile),
            ),
        ],
        onReorder: (oldIndex, newIndex) => () {},

      ),
    );
  }
}
