final String tableBooks = 'books'; // name of table

// class for the fields
class BooksFields {

  static final List<String> values = [
    id, title, dateAdded, imageUri, description,
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String dateAdded = 'dateAdded';
  static final String imageUri = 'imageUri';
  static final String description = 'description';
}

// class for storing book
class Book {
  // fields
  final int? id;
  final String title;
  final DateTime dateAdded;
  final String imageUri;
  final String description;


  const Book({
    this.id,
    required this.title,
    required this.dateAdded,
    required this.imageUri,
    required this.description,
  });

  Book copy ({
    int? id,
    String? title,
    DateTime? dateAdded,
    String? imageUri,
    String? description,
  }) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        dateAdded: dateAdded ?? this.dateAdded,
        imageUri: imageUri ?? this.imageUri,
        description: description ?? this.description,
      );

  Map<String, Object?> toJson() => {
    BooksFields.id: id,
    BooksFields.title: title,
    BooksFields.dateAdded: dateAdded.toIso8601String(),
    BooksFields.imageUri: imageUri,
    BooksFields.description: description,
  };

  static Book fromJson(Map<String, Object?> json) => Book(
    id: json[BooksFields.id] as int?,
    title: json[BooksFields.title] as String,
    dateAdded: DateTime.parse(json[BooksFields.dateAdded] as String),
    imageUri: json[BooksFields.imageUri] as String,
    description: json[BooksFields.description] as String,
  );
}