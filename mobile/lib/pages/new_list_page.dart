import 'package:birdart/l10n/l10n.dart';
import 'package:flutter/material.dart';

class NewListPage extends StatefulWidget {
  const NewListPage({super.key});

  @override
  State<NewListPage> createState() => _NewListPageState();
}

class _NewListPageState extends State<NewListPage> {
  Map<String, int> records = {};

  List<String> birds = List.generate(20, (index) => '鸟 $index');

  void _onCompleted() {
    // TODO: save list
  }

  void _getExpectedList() {
    // TODO: generate possible birds list
  }

  @override
  void initState() {
    _getExpectedList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
        ),
        title: const Row(
          children: [
            Icon(Icons.my_location_rounded),
            SizedBox(width: 8),
            Text('10 min'),
            SizedBox(width: 8),
            Text('10.0 km'),
            SizedBox(width: 8),
            Icon(Icons.add_location_rounded),
            SizedBox(width: 8),
            Text('观鸟点名称'),
          ],
        ),
        bottom: AppBar(
          backgroundColor: Colors.pink.shade50, // todo use theme color scheme,
          leading: null,
          leadingWidth: 0,
          centerTitle: false,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: ListTile(
            leading: IconButton(
              icon: const Icon(Icons.add_rounded),
              onPressed: () {},
            ),
            title: TextField(
              decoration: InputDecoration(
                hintText: BdL10n.current.newListSearch,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            IconButton(
                icon: const Icon(Icons.comment_rounded), onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.settings_rounded), onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.check_rounded), onPressed: _onCompleted),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: BdL10n.current.save,
        child: const Icon(Icons.save_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          final name = birds[index];
          return ListTile(
            leading: IconButton(
              icon: records.containsKey(name)
                  ? Text(records[name].toString())
                  : const Icon(Icons.add_rounded),
              onPressed: () {
                setState(() {
                  if (records.containsKey(name)) {
                    records[name] = records[name]! + 1;
                  } else {
                    records[name] = 1;
                  }
                });
              },
            ),
            title: Text(name),
          );
        },
      ),
    );
  }
}
