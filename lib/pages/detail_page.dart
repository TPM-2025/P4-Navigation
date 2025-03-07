import 'package:asisten_tpm_4/models/game_store.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameList[widget.index].name),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.network(gameList[widget.index].imageUrls[0]),
          SizedBox(height: 12),
          Text(
            gameList[widget.index].name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(gameList[widget.index].about),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await launchUrl(Uri.parse(gameList[widget.index].linkStore));
            },
            child: Text("Go to store page"),
          ),
        ],
      ),
    );
  }
}
