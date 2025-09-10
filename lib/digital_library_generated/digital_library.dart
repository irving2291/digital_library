library digital_library_generated;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'dart:convert';

part 'add_book.dart';

part 'create_user.dart';

part 'add_to_reading_list.dart';

part 'update_reading_status.dart';

part 'seed_books.dart';

part 'get_all_books.dart';

part 'search_books.dart';

part 'get_books_by_genre.dart';

part 'get_user_reading_list.dart';







class DigitalLibraryConnector {
  
  
  AddBookVariablesBuilder addBook ({required String title, required String author, required List<String> genre, }) {
    return AddBookVariablesBuilder(dataConnect, title: title,author: author,genre: genre,);
  }
  
  
  CreateUserVariablesBuilder createUser ({required String name, required String email, }) {
    return CreateUserVariablesBuilder(dataConnect, name: name,email: email,);
  }
  
  
  AddToReadingListVariablesBuilder addToReadingList ({required String userId, required String bookId, required String status, }) {
    return AddToReadingListVariablesBuilder(dataConnect, userId: userId,bookId: bookId,status: status,);
  }
  
  
  UpdateReadingStatusVariablesBuilder updateReadingStatus ({required String readingListId, required String status, }) {
    return UpdateReadingStatusVariablesBuilder(dataConnect, readingListId: readingListId,status: status,);
  }
  
  
  SeedBooksVariablesBuilder seedBooks () {
    return SeedBooksVariablesBuilder(dataConnect, );
  }
  
  
  GetAllBooksVariablesBuilder getAllBooks () {
    return GetAllBooksVariablesBuilder(dataConnect, );
  }
  
  
  SearchBooksVariablesBuilder searchBooks ({required String searchTerm, }) {
    return SearchBooksVariablesBuilder(dataConnect, searchTerm: searchTerm,);
  }
  
  
  GetBooksByGenreVariablesBuilder getBooksByGenre ({required String genre, }) {
    return GetBooksByGenreVariablesBuilder(dataConnect, genre: genre,);
  }
  
  
  GetUserReadingListVariablesBuilder getUserReadingList ({required String userId, }) {
    return GetUserReadingListVariablesBuilder(dataConnect, userId: userId,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-central1',
    'digital-library',
    'digitallibrary',
  );

  DigitalLibraryConnector({required this.dataConnect});
  static DigitalLibraryConnector get instance {
    return DigitalLibraryConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}

