import 'package:ets_ppb_h/database/booksDB.dart';
import 'package:ets_ppb_h/widget/BookCard.dart';
import 'package:flutter/material.dart';
import 'package:ets_ppb_h/model/book.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<Book> books;

  @override
  void initState() {
    super.initState();

    refreshBooks();
  }

  Future refreshBooks() async {
    books = await BooksDatabase.instance.readAllBooks();
  }

  @override
  void dispose() {
    BooksDatabase.instance.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Book Collections'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.pushNamed((context), '/add_book');
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index){
          return BookCard(book: books[index], index: index);
        },
      ),

    );
  }
}
