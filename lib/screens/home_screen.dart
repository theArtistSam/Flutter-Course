import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of items for the dropdown

  final List<String> _items = ['None', 'Folder 1', 'Folder 2', 'Folder 3'];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  // Selected value
  String? _selectedValue;

  final box = Hive.box('dataBox');

  void addData({
    required String name,
    required String location,
    required String category,
  }) {
    box.add({
      'name': name,
      'location': location,
      'category': category,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                showDragHandle: true,
                context: context,
                builder: (context) {
                  return _bottomSheet();
                });
          }),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, Box box, _) {
                if (box.isEmpty) {
                  return const Center(child: Text('No Data Available'));
                } else {
                  return ListView.builder(
                    reverse: true,
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      final data = box.getAt(index) as Map;

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          title: Text(data['name']),
                          subtitle: Text(
                              'Location: ${data['location']}\nCategory: ${data['category']}'),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomSheet() {
    return Wrap(
      children: [
        SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      hintText: "Enter name...",
                      contentPadding: EdgeInsets.all(10)
                      // hintStyle: Text
                      ),
                  onChanged: (value) {},
                ),
                TextField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                      hintText: "Enter location...",
                      contentPadding: EdgeInsets.all(10)
                      // hintStyle: Text
                      ),
                  onChanged: (value) {},
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Select Folder',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: _items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue == 'None' ? null : newValue;
                    });
                  },
                ),
                TextButton(
                    onPressed: () {
                      // Add the data to hive
                      String name = _nameController.text;
                      String location = _locationController.text;
                      String category = _selectedValue!;
                      if (name.isNotEmpty &&
                          location.isNotEmpty &&
                          category.isNotEmpty) {
                        addData(
                            name: name, location: location, category: category);
                      }
                      _nameController.clear();
                      _locationController.clear();
                      _selectedValue = 'None';
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Data added successfully!')),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text("Add Data")),
              ],
            ),
          ),
        )
      ],
    );
  }
}
