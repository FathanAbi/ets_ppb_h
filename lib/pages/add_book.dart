import 'package:flutter/material.dart';
import 'package:ets_ppb_h/model/book.dart';
import 'package:ets_ppb_h/database/booksDB.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final formkey = GlobalKey<FormState>();

  String title = '';

  String imageUri = '';

  String description = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Book'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan Judul Buku',
                  ),
                  validator: (value){
                    // if(value!.isEmpty || !RegExp(r'^[a-z A-Z]').hasMatch(value!))
                    if(value!.isEmpty){
                      return 'Judul wajib diisi';
                    } else {
                      title = value;
                      return null;
                    }
                  },
                ),
                SizedBox(height: 30,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan URL cover buku',
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'URL cover buku wajib diisi';
                    } else {
                      imageUri = value;
                      return null;
                    }
                  },
                ),
                SizedBox(height: 30,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan Deskirpsi Buku',
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Deskripsi wajib diisi';
                    } else {
                      description = value;
                      return null;
                    }
                  },
                ),
                SizedBox(height: 30,),
                TextButton(
                    onPressed: () async {
                      if(formkey.currentState!.validate()){

                        Book book = Book(title: title, dateAdded: DateTime.now(), imageUri: imageUri, description: description);

                        Book employee_copy = await BooksDatabase.instance.create(book);

                        print(employee_copy.id);

                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Submit')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
