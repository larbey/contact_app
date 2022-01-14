import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'contact_page_model.dart';
import 'contacts_page.dart';
import 'recents_model.dart';
import 'recents_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> data = [
    {
      'image': 'assets/images/aiden.jpg',
      'name': 'Aiden Carter',
      'city': 'FortHood,Texas',
      'country': 'U.S.A',
      'mobile': '+254-288-3309',
      'email': 'aiden@gmail.com',
      'group': 'work',
    },
    {
      'image': 'assets/images/avery.jpg',
      'name': 'Avery Mitchell',
      'city': 'Cocoa Beach, Florida',
      'country': 'U.S.A',
      'mobile': '+321-328-4198',
      'email': 'avery@gmail.com',
      'group': 'friends',
    },
    {
      'image': 'assets/images/brian.jpg',
      'name': 'Brian Myers',
      'city': 'Auburn, NewYork',
      'country': 'U.S.A',
      'mobile': '+315-567-4028',
      'email': 'myers@gmail.com',
      'group': 'friends',
    },
    {
      'image': 'assets/images/brielle.jpg',
      'name': 'Brielle Sanders',
      'city': 'Grant City, Michigan',
      'country': 'U.S.A',
      'mobile': '+660-564-6031',
      'email': 'brielle@gmail.com',
      'group': 'family',
    },
    {
      'image': 'assets/images/bryce.jpg',
      'name': 'Bryce Collins',
      'city': 'Lake Elsinore, California',
      'country': 'U.S.A',
      'mobile': '+951-399-4857',
      'email': 'bryce@gmail.com',
      'group': 'friends',
    }
  ];

  final List recents = [
    {
      'image': 'assets/images/olivia.jpg',
      'name': 'Olivia Rivera',
      'city': 'Framingham',
      'country': 'U.S.A',
      'mobile': '+508-391-4878',
      'email': 'rivera@gmail.com',
      'group': 'work',
    },
    {
      'image': 'assets/images/logan.jpg',
      'name': 'Logan Johnson',
      'city': 'Gladstone, New Jersey',
      'country': 'U.S.A',
      'mobile': '+908-443-7716',
      'email': 'logan@gmail.com',
      'group': 'friends',
    },
    {
      'image': 'assets/images/ava.jpg',
      'name': 'Ava Grace',
      'city': 'Albuquerque',
      'country': 'U.S.A',
      'mobile': '+505-248-4134',
      'email': 'grace@gmail.com',
      'group': 'friends',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text('My Contacts',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 5, bottom: 5),
            child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/avatar.jpg')),
          ),
        ],
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search))),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Recent',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
          ),
          ListView.separated(
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RecentsPage(recent: recents[index]);
                    }));
                    },
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('${recents[index]['image']}'),
                    ),
                    title: Text('${recents[index]['name']}'),
                    subtitle: Text('${recents[index]['mobile']}'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)));
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: 3),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Contacts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
          ),
          GroupedListView<Map<String, String>, String>(
            controller: _scrollController,
            shrinkWrap: true,
            elements: data,
            groupBy: (element) => element['name'].toString().substring(0, 1),
            groupSeparatorBuilder: (String groupByValue) => SizedBox(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                groupByValue.substring(0, 1),
                textAlign: TextAlign.right,
              ),
            )),
            itemBuilder: (context, Map<String, String> element) {
              Contact contact = Contact.fromJson(element);
              return Column(children: [
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ContactsPage(contact: contact);
                    }));
                  },
                  leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('${element['image']}')),
                  title: Text('${element['name']}'),
                  subtitle: Text('${element['mobile']}'),
                  trailing: const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
                )
              ]);
            },
            itemComparator: (item1, item2) =>
                item1['name']!.compareTo(item2['name']!), // optional
            useStickyGroupSeparators: true, // optional
            floatingHeader: true, // optional
            order: GroupedListOrder.ASC, // optional
          ),
        ],
      )),
    );
  }
}
