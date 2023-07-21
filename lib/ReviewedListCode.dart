import 'package:flutter/material.dart';


class ReviewedListCode extends StatefulWidget {
  @override
  _ReviewedListCodeScreenState createState() => _ReviewedListCodeScreenState();
}

class _ReviewedListCodeScreenState extends State<ReviewedListCode> {
  List<String> items = List.generate(50, (index) => 'Item ${index + 1}');
  int count = 0;

  void _incrementCount() {
    setState(() {
      count++;
    });
  }

  void _resetCount() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Reset App'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            subtitle: index == 0 ? Text('Clicked $count times') : null,
            onTap: () {
              if (index == 0) {
                _incrementCount();
                if (count == 3) {
                  _resetCount();
                }
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _resetCount();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
