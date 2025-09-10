# digital_library_generated SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
DigitalLibraryConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### GetAllBooks
#### Required Arguments
```dart
// No required arguments
DigitalLibraryConnector.instance.getAllBooks().execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetAllBooksData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DigitalLibraryConnector.instance.getAllBooks();
GetAllBooksData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = DigitalLibraryConnector.instance.getAllBooks().ref();
ref.execute();

ref.subscribe(...);
```


### SearchBooks
#### Required Arguments
```dart
String searchTerm = ...;
DigitalLibraryConnector.instance.searchBooks(
  searchTerm: searchTerm,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<SearchBooksData, SearchBooksVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DigitalLibraryConnector.instance.searchBooks(
  searchTerm: searchTerm,
);
SearchBooksData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String searchTerm = ...;

final ref = DigitalLibraryConnector.instance.searchBooks(
  searchTerm: searchTerm,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetBooksByGenre
#### Required Arguments
```dart
String genre = ...;
DigitalLibraryConnector.instance.getBooksByGenre(
  genre: genre,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetBooksByGenreData, GetBooksByGenreVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DigitalLibraryConnector.instance.getBooksByGenre(
  genre: genre,
);
GetBooksByGenreData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String genre = ...;

final ref = DigitalLibraryConnector.instance.getBooksByGenre(
  genre: genre,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetUserReadingList
#### Required Arguments
```dart
String userId = ...;
DigitalLibraryConnector.instance.getUserReadingList(
  userId: userId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetUserReadingListData, GetUserReadingListVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DigitalLibraryConnector.instance.getUserReadingList(
  userId: userId,
);
GetUserReadingListData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String userId = ...;

final ref = DigitalLibraryConnector.instance.getUserReadingList(
  userId: userId,
).ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### AddBook
#### Required Arguments
```dart
String title = ...;
String author = ...;
String genre = ...;
DigitalLibraryConnector.instance.addBook(
  title: title,
  author: author,
  genre: genre,
).execute();
```

#### Optional Arguments
We return a builder for each query. For AddBook, we created `AddBookBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class AddBookVariablesBuilder {
  ...
   AddBookVariablesBuilder isbn(String? t) {
   _isbn.value = t;
   return this;
  }
  AddBookVariablesBuilder synopsis(String? t) {
   _synopsis.value = t;
   return this;
  }
  AddBookVariablesBuilder publicationYear(int? t) {
   _publicationYear.value = t;
   return this;
  }
  AddBookVariablesBuilder pages(int? t) {
   _pages.value = t;
   return this;
  }
  AddBookVariablesBuilder coverUrl(String? t) {
   _coverUrl.value = t;
   return this;
  }

  ...
}
DigitalLibraryConnector.instance.addBook(
  title: title,
  author: author,
  genre: genre,
)
.isbn(isbn)
.synopsis(synopsis)
.publicationYear(publicationYear)
.pages(pages)
.coverUrl(coverUrl)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<AddBookData, AddBookVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DigitalLibraryConnector.instance.addBook(
  title: title,
  author: author,
  genre: genre,
);
AddBookData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String title = ...;
String author = ...;
String genre = ...;

final ref = DigitalLibraryConnector.instance.addBook(
  title: title,
  author: author,
  genre: genre,
).ref();
ref.execute();
```


### CreateUser
#### Required Arguments
```dart
String name = ...;
String email = ...;
DigitalLibraryConnector.instance.createUser(
  name: name,
  email: email,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateUserData, CreateUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DigitalLibraryConnector.instance.createUser(
  name: name,
  email: email,
);
CreateUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String name = ...;
String email = ...;

final ref = DigitalLibraryConnector.instance.createUser(
  name: name,
  email: email,
).ref();
ref.execute();
```


### AddToReadingList
#### Required Arguments
```dart
String userId = ...;
String bookId = ...;
String status = ...;
DigitalLibraryConnector.instance.addToReadingList(
  userId: userId,
  bookId: bookId,
  status: status,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<AddToReadingListData, AddToReadingListVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DigitalLibraryConnector.instance.addToReadingList(
  userId: userId,
  bookId: bookId,
  status: status,
);
AddToReadingListData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String userId = ...;
String bookId = ...;
String status = ...;

final ref = DigitalLibraryConnector.instance.addToReadingList(
  userId: userId,
  bookId: bookId,
  status: status,
).ref();
ref.execute();
```


### UpdateReadingStatus
#### Required Arguments
```dart
String readingListId = ...;
String status = ...;
DigitalLibraryConnector.instance.updateReadingStatus(
  readingListId: readingListId,
  status: status,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateReadingStatusData, UpdateReadingStatusVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DigitalLibraryConnector.instance.updateReadingStatus(
  readingListId: readingListId,
  status: status,
);
UpdateReadingStatusData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String readingListId = ...;
String status = ...;

final ref = DigitalLibraryConnector.instance.updateReadingStatus(
  readingListId: readingListId,
  status: status,
).ref();
ref.execute();
```


### SeedBooks
#### Required Arguments
```dart
// No required arguments
DigitalLibraryConnector.instance.seedBooks().execute();
```



#### Return Type
`execute()` returns a `OperationResult<SeedBooksData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DigitalLibraryConnector.instance.seedBooks();
SeedBooksData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = DigitalLibraryConnector.instance.seedBooks().ref();
ref.execute();
```

