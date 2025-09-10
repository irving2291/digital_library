import 'package:digital_library/digital_library_generated/digital_library.dart';
import 'package:flutter/material.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _isbnController = TextEditingController();
  final _synopsisController = TextEditingController();
  final _yearController = TextEditingController();
  final _pagesController = TextEditingController();
  final _coverUrlController = TextEditingController();

  List<String> selectedGenres = [];
  final List<String> availableGenres = [
    'Ficción',
    'No Ficción',
    'Ciencia',
    'Historia',
    'Biografía',
    'Fantasía',
    'Romance',
    'Misterio',
    'Thriller',
    'Ciencia Ficción',
    'Autoayuda',
    'Tecnología',
    'Arte',
    'Cocina',
    'Viajes',
  ];

  bool isLoading = false;

  Future<void> _saveBook() async {
    if (_formKey.currentState!.validate() && selectedGenres.isNotEmpty) {
      try {
        setState(() => isLoading = true);

        await DigitalLibraryConnector.instance
            .addBook(
              title: _titleController.text.trim(),
              author: _authorController.text.trim(),
              genre: selectedGenres,
            )
            .isbn(
              _isbnController.text.trim().isEmpty
                  ? null
                  : _isbnController.text.trim(),
            )
            .synopsis(
              _synopsisController.text.trim().isEmpty
                  ? null
                  : _synopsisController.text.trim(),
            )
            .publicationYear(
              _yearController.text.trim().isEmpty
                  ? null
                  : int.tryParse(_yearController.text.trim()),
            )
            .pages(
              _pagesController.text.trim().isEmpty
                  ? null
                  : int.tryParse(_pagesController.text.trim()),
            )
            .coverUrl(
              _coverUrlController.text.trim().isEmpty
                  ? null
                  : _coverUrlController.text.trim(),
            )
            .execute();

        setState(() => isLoading = false);

        _showMessage('Libro agregado exitosamente');
        if (mounted) Navigator.pop(context);
      } on Exception catch (_) {
        _showMessage('Error al agregar el libro');
      }
    } else if (selectedGenres.isEmpty) {
      _showMessage('Selecciona al menos un género');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Libro'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título *',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'El título es requerido';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _authorController,
              decoration: const InputDecoration(
                labelText: 'Autor *',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'El autor es requerido';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _isbnController,
              decoration: const InputDecoration(
                labelText: 'ISBN (opcional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Géneros *',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: availableGenres.map((genre) {
                return FilterChip(
                  label: Text(genre),
                  selected: selectedGenres.contains(genre),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedGenres.add(genre);
                      } else {
                        selectedGenres.remove(genre);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _synopsisController,
              decoration: const InputDecoration(
                labelText: 'Sinopsis (opcional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _yearController,
                    decoration: const InputDecoration(
                      labelText: 'Año publicación',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _pagesController,
                    decoration: const InputDecoration(
                      labelText: 'Páginas',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _coverUrlController,
              decoration: const InputDecoration(
                labelText: 'URL de portada (opcional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: isLoading ? null : _saveBook,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Guardar Libro',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _isbnController.dispose();
    _synopsisController.dispose();
    _yearController.dispose();
    _pagesController.dispose();
    _coverUrlController.dispose();
    super.dispose();
  }
}