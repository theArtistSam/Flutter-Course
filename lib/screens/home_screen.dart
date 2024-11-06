import 'package:flutter/material.dart';
import 'package:flutter_app/utils/enums.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of items for the dropdown

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  // Selected value
  MenuItems? _selectedValue;

  final box = Hive.box('dataBox');

  void emptyBox() {
    box.deleteFromDisk();
  }

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

  void add1000SampleItems() {
    for (int i = 1; i <= 1000; i++) {
      addData(
        name: 'Test $i',
        location: 'Test Location $i',
        category: 'Test Category $i',
      );
    }
  }

  @override
  void initState() {
    if (box.isEmpty) {
      add1000SampleItems();
    }
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
                    // reverse: true,
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
                DropdownButtonFormField<MenuItems>(
                  decoration: const InputDecoration(
                    labelText: 'Select Item',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: [
                    for (int i = 0; i < MenuItems.values.length; i++)
                      DropdownMenuItem<MenuItems>(
                        value: MenuItems.values[i],
                        child:
                            Text(MenuItems.values[i].toString().split(".")[1]),
                      )
                  ],
                  onChanged: (MenuItems? newValue) {
                    setState(() {
                      if (newValue == MenuItems.none) {
                        _selectedValue = null;
                      } else {
                        _selectedValue = newValue;
                      }
                    });
                  },
                ),
                TextButton(
                    onPressed: () {
                      // Add the data to hive
                      String name = _nameController.text;
                      String location = _locationController.text;
                      MenuItems? category = _selectedValue;
                      if (name.isNotEmpty &&
                          location.isNotEmpty &&
                          category != null) {
                        addData(
                          name: name,
                          location: location,
                          category: category.toString().split(".")[1],
                        );
                        _nameController.clear();
                        _locationController.clear();
                        _selectedValue = MenuItems.none;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Data added successfully!')),
                        );
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('One of the fields is empty!')),
                        );
                      }
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
