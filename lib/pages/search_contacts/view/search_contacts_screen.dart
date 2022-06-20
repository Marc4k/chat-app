import 'package:chat_app/domain/contacts/contacts_impl.dart';
import 'package:chat_app/domain/contacts/models/contact_model.dart';
import 'package:chat_app/pages/home_screen/widget/search_bar.dart';
import 'package:chat_app/pages/search_contacts/widget/search_item_widget.dart';
import 'package:flutter/material.dart';

class SearchContactsScreen extends StatefulWidget {
  const SearchContactsScreen({Key? key}) : super(key: key);

  @override
  State<SearchContactsScreen> createState() => _SearchContactsScreenState();
}

List<ContactModel> searchItems = [];

class _SearchContactsScreenState extends State<SearchContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          Expanded(child: TextFormField(
            onChanged: (value) async {
              List<ContactModel> items =
                  await ContactsImpl().searchInContacts(value);
              setState(() {
                searchItems = items;
              });
            },
          ))
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: searchItems.length,
        itemBuilder: (context, index) {
          return SearchItemWidget(
              img: searchItems[index].pictureUrl,
              username: searchItems[index].username,
              onAdd: () {});
        },
      ),
    );
  }
}
