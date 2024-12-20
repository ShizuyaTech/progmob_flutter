import 'package:flutter/material.dart';

class ListWithcards extends StatelessWidget {
  const ListWithcards({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> listsData = [
      ['Item 1', 'Item 2', 'Item 3'],
      ['Item A', 'Item B', 'Item C', 'Item D'],
      ['Item X', 'Item Y', 'Item Z'],
      ['Item P', 'Item Q', 'Item R'],
      ['Item M', 'Item N', 'Item U'],
    ];
    return Scaffold(
      appBar: AppBar(
          title: Text('Multiple List With Card'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: ListView.builder(
          itemCount: listsData.length,
          itemBuilder: (context, index) {
            return CardList(listData: listsData[index]);
          }),
    );
  }
}

class CardList extends StatelessWidget {
  // const CardList({super.key});
  const CardList({required this.listData});

  final List<String> listData;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'List ${listData[0]}',
            ),
          ),
          Divider(),
          ListView.builder(
              itemCount: listData.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listData[index]),
                );
              })
        ],
      ),
    );
  }
}
