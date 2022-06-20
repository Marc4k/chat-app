import 'package:chat_app/pages/search_contacts/view/search_contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../domain/contacts/contacts_impl.dart';
import '../widget/search_bar.dart';

//         context.read<HomeScreenChanceCubit>().changeToStatistics();

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

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
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return SearchContactsScreen();
              }));
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
            SearchBar(
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}




/*
    context.read<GetContactsInSearchCubit>().getSearchItems();
    return BlocBuilder<GetContactsInSearchCubit, List<String>>(
      builder: (context, items) {
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(items[index]));
          },
        );
      },
    );
*/