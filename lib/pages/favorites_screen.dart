import 'package:flutter/material.dart';
import 'package:reader_tracker/db/database_helper.dart';
import 'package:reader_tracker/models/book.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: DatabaseHelper.instance.getFavorites(), 
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<Book> favoriteBooks = snapshot.data!;
            return ListView.builder(
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                Book book = favoriteBooks[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(book.imageLinks['thumbnail'] ?? '', fit: BoxFit.cover,),
                    title: Text(book.title),
                    trailing: const Icon(Icons.favorite, color: Colors.red,),
                  ),
                );
              }
            );
          } else {
            return const Center(
              child: Text('No favorites yet.'),
            );
          }
        })
      ),
    );
  }
}