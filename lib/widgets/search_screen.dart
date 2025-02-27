import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _items = [
    'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry',
    'Fig', 'Grapes', 'Honeydew', 'Kiwi', 'Lemon'
  ];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items; // Initialize with all items
  }

  void _filterSearchResults(String query) {
    setState(() {
      _filteredItems = query.isEmpty
          ? _items
          : _items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100], // Light blue background
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.teal, // Darker blue app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _filterSearchResults,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white, // White background for text field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none, // No border
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _filteredItems.isEmpty
                  ? const Center(child: Text('No results found'))
                  : ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.teal, // White cards for better visibility
                    child: ListTile(
                      title: Text(_filteredItems[index]),
                      leading: const Icon(Icons.search, color: Colors.teal),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Selected: ${_filteredItems[index]}'),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
