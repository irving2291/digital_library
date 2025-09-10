import 'package:digital_library/app/view/add_book_page.dart';
import 'package:digital_library/digital_library_generated/digital_library.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> books = [];
  String selectedGenre = 'Todos';

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    final result = await DigitalLibraryConnector.instance
        .getAllBooks()
        .execute();

    setState(() => books = result.data.books.map((e) => e.toJson()).toList());
  }

  Future<void> _searchBooks() async {
    if (_searchController.text.isNotEmpty) {
      final result = await DigitalLibraryConnector.instance
          .searchBooks(searchTerm: _searchController.text)
          .execute();

      setState(() => books = result.data.books.map((e) => e.toJson()).toList());
    } else {
      await _loadBooks();
    }
  }

  Future<void> _filterByGenre(String genre) async {
    if (genre == 'Todos') {
      await _loadBooks();
    } else {
      final result = await DigitalLibraryConnector.instance
          .getBooksByGenre(genre: genre)
          .execute();

      setState(() {
        books = result.data.books.map((e) => e.toJson()).toList();
        selectedGenre = genre;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Library'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await DigitalLibraryConnector.instance.seedBooks().execute();
              await _loadBooks();
            },
            icon: const Icon(Icons.download),
            tooltip: 'Poblar Base de Datos',
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar por título o autor...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _loadBooks();
                  },
                ),
              ),
              onSubmitted: (_) => _searchBooks(),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children:
                  [
                        'Todos',
                        'Ficción',
                        'No Ficción',
                        'Ciencia',
                        'Historia',
                        'Biografía',
                      ]
                      .map(
                        (genre) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(genre),
                            selected: selectedGenre == genre,
                            onSelected: (_) => _filterByGenre(genre),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
          Expanded(
            child: books.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.book, size: 64, color: Colors.grey),
                        const Text(
                          'No hay libros en tu biblioteca',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => AddBookScreen(),
                            ),
                          ).then((_) => _loadBooks()),
                          icon: const Icon(Icons.add),
                          label: const Text('Agregar primer libro'),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          leading: book['coverUrl'] != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    book['coverUrl'] as String,
                                    width: 50,
                                    height: 70,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.book, size: 50),
                                  ),
                                )
                              : const Icon(Icons.book, size: 50),
                          title: Text(
                            book['title'] as String,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Por: ${book['author']}'),
                              if (book['genre'] != null &&
                                  (book['genre'] as List<String>).isNotEmpty)
                                Text(
                                  'Géneros: ${(book['genre'] as List<String>).join(', ')}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              if (book['rating'] != null &&
                                  (book['rating'] as double) > 0)
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      ' ${(book['rating'] as double).toStringAsFixed(1)}',
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          isThreeLine: true,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (context) => AddBookScreen()),
        ).then((_) => _loadBooks()),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}