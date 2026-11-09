

import 'package:flutter/material.dart';
import 'package:reader_tracker/components/book_tile.dart';
import 'package:reader_tracker/models/book.dart';

class BookShelf extends StatelessWidget {
  const BookShelf({
    super.key,
    required this._books,
  });

  final List<Book> _books;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _books.isEmpty ? 
          const Center(child: Text('No books found.')) :
          GridView.builder(
            itemCount: _books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.6,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            itemBuilder: (context, index) {
              Book book = _books[index];
              bool hasItem = book.imageLinks.containsKey('thumbnail');
              return BookTile(book: book, hasItem: hasItem);
            },
          )
      )
    );
  }
}