import 'package:flutter/material.dart';

class GridViewLearning extends StatelessWidget {
  const GridViewLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => Container(
        height: 150,
        width: 150,
        color: Colors.green,
        child: Text('Hello'),
      ),
    );
  }
}
