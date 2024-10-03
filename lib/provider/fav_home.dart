// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:network_connectivity/provider/provider.dart';
import 'package:provider/provider.dart';

import 'fav_details.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

class FavoriteHomeScreen extends StatefulWidget {
  const FavoriteHomeScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteHomeScreen> createState() => _FavoriteHomeScreenState();
}

class _FavoriteHomeScreenState extends State<FavoriteHomeScreen> {
  Future<List<Empty>>? carBrandFuture;

  @override
  void initState() {
    super.initState();
    carBrandFuture = fetchImage();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Data",
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_rounded,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FavoritePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: carBrandFuture,
        builder: (context, AsyncSnapshot<List<Empty>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            return buildListView(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget buildListView(List<Empty> carbrand) {
    return ListView.builder(
      itemCount: carbrand.length,
      itemBuilder: (_, i) {
        final itemTitle = carbrand[i].title;
        final isFavorite =
            Provider.of<FavoriteProvider>(context).isItemFavorite(itemTitle);
        return Container(
          margin:
              const EdgeInsets.only(bottom: 0, right: 20, top: 10, left: 20),
          color: Colors.grey[200],
          child: isLoading
              ? const CircularProgressIndicator()
              : ListTile(
                  title: Text(
                    itemTitle,
                    style: GoogleFonts.poppins(
                        color: Colors.deepPurple, fontSize: 13),
                  ),
                  leading: IconButton(
                    icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border),
                    color: isFavorite ? Colors.red : Colors.grey,
                    onPressed: () {
                      final favoriteProvider =
                          Provider.of<FavoriteProvider>(context, listen: false);

                      if (isFavorite) {
                        favoriteProvider.removeFromFavorites(itemTitle);
                      } else {
                        favoriteProvider.addToFavorites(itemTitle);
                      }
                    },
                  ),
                ),
        );
      },
    );
  }

  Future<List<Empty>> fetchImage() async {
    const url = 'https://jsonplaceholder.typicode.com/todos/?';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    print(body);
    List<Empty> carDetailScreenData = emptyFromJson(body);

    return carDetailScreenData;
  }
}
