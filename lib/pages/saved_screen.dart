import 'package:flutter/material.dart';
import 'package:reader_tracker/db/database_helper.dart';
import 'package:reader_tracker/models/book.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saved Screen')),
      body: FutureBuilder<List<Book>>(
        future: DatabaseHelper.instance.readAllBooks(),
        builder: (context, snapshot) => snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Book book = snapshot.data![index];
                  return Card(
                    child: ListTile(
                      title: Text(book.title),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete), 
                        onPressed: () async {
                          try {
                              int savedInt = await DatabaseHelper.instance
                                .deleteBook(book.id);
                            SnackBar snackBar = SnackBar(
                              content: Text("Book deleted"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            setState(() {});
                          } catch (e) {
                            print("Error: $e");
                          }
                        },
                      ),
                      leading: Image.network(
                        book.imageLinks['thumbnail'] ?? '',
                        fit: BoxFit.cover,
                      ),
                      subtitle: Column(
                        children: [
                          Text(book.authors.join(', ')),
                          ElevatedButton.icon(
                            onPressed: () async {
                              try {
                                  int savedInt = await DatabaseHelper.instance
                                    .toggleFavoriteStatus(book.id, book.isFavorite);
                                SnackBar snackBar = SnackBar(
                                  content: Text("Book toggled as favorite: $savedInt"),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } catch (e) {
                                print("Error: $e");
                              }
                            },
                            icon: const Icon(Icons.favorite),
                            label: const Text('Add to favorites'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
