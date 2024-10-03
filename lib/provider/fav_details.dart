// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteList = favoriteProvider.favoriteList;

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Items",
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: favoriteList.length,
        itemBuilder: (_, index) {
          final itemTitle = favoriteList[index];
          final isFavorite = favoriteProvider.isItemFavorite(itemTitle);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.grey[200],
              title: Text(itemTitle),
              trailing: IconButton(
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                color: isFavorite ? Colors.red : Colors.grey,
                onPressed: () {
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
      ),
    );
  }
}
