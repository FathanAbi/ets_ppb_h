import 'package:flutter/material.dart';
import 'package:ets_ppb_h/model/book.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.book,
    required this.index,
  }) : super(key: key);

  final Book book;
  final int index;



  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightGreenAccent,
      child: ListTile(
        onTap: (){
          print(book.title);
          Navigator.pushNamed(context, '/book_detail', arguments: {
            'id': book.id,
            'title': book.title,
            'dateAdded': book.dateAdded,
            'imageUri': book.imageUri,
            'description': book.description,

          });
        },
        hoverColor: Colors.lightBlueAccent,
        title: Text(
          book.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
