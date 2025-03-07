import 'package:asisten_tpm_4/models/game_store.dart';
import 'package:asisten_tpm_4/pages/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello, $username")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) => _gameStore(context, index),
          itemCount: gameList.length,
        ),
      ),
    );
  }

  Widget _gameStore(context, index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailPage(index: index)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(border: Border.all(width: 2)),
        child: Column(
          children: [
            Image.network(gameList[index].imageUrls[0]),
            Text(gameList[index].name),
          ],
        ),
      ),
    );
  }
}
