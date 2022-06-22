import 'package:chat_app/cubits/get_contacts_cubit.dart';
import 'package:chat_app/domain/contacts/models/contact_screen_models.dart';
import 'package:chat_app/pages/home_screen/widget/contac_item.dart';
import 'package:chat_app/pages/search_contacts/view/search_contacts_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

bool takeNewList = false;
List<ContactScreenModel> contactsSort = [];
List<ContactScreenModel> contactsList = [];
List<ContactScreenModel> tmp = [];

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Contacts",
          style: TextStyle(
            color: ColorChance().getTextColor(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return SearchContactsScreen();
              }));
              context.read<GetContactCubit>().getAllContacts();
            },
            icon: Icon(Icons.add),
            color: ColorChance().getTextColor(),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                contactsSort.clear();
                if (value.isNotEmpty) {
                  takeNewList = true;
                } else {
                  takeNewList = false;
                }

                if (tmp.isNotEmpty) {
                  contactsList = tmp;
                }

                for (var i = 0; i < contactsList.length; i++) {
                  if (contactsList[i].username.contains(value) == true) {
                    contactsSort.add(ContactScreenModel(
                        username: contactsList[i].username,
                        pictureUrl: contactsList[i].pictureUrl,
                        userId: contactsList[i].userId,
                        lastSeen: contactsList[i].lastSeen));
                  }
                }
                tmp = contactsList;
                context.read<GetContactCubit>().getAllContacts();
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFF7F7FC),
                enabledBorder: InputBorder.none,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: BlocBuilder<GetContactCubit, List<ContactScreenModel>>(
                builder: (context, contacts) {
                  if (takeNewList == false) {
                    contactsList = contacts;
                  } else {
                    contactsList = contactsSort;
                  }

                  if (contacts.isEmpty) {
                    return Text("Empty");
                  } else {
                    return ListView.builder(
                      itemCount: contactsList.length,
                      itemBuilder: (context, index) {
                        return ContactItem(data: contactsList[index]);
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


/*
                  var collection =
                      FirebaseFirestore.instance.collection('UserData');
                  collection
                      .doc('9FdMvQGHp5ermk2VqYEBxdbXI3A3')
                      .update({'userName': 'marcoo'}) // <-- Updated data
                      .then((_) => print('Success'))
                      .catchError((error) => print('Failed: $error'));*/