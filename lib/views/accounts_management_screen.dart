import 'package:flutter/material.dart';
import 'package:smart_home/presenters/language_presenter.dart';
import 'package:smart_home/presenters/user_presenter.dart';
import 'package:smart_home/views/custom_button.dart';
import 'package:smart_home/models/user.dart';
import 'package:smart_home/views/build_user_info.dart';

class AccountsManagementScreen extends StatefulWidget {
  const AccountsManagementScreen({super.key});

  @override
  State<AccountsManagementScreen> createState() =>
      _AccountsManagementScreenState();
}

class _AccountsManagementScreenState extends State<AccountsManagementScreen> {
  User? userSelected;

  updateUserSelected(User newSelected) {
    setState(() {
      userSelected = newSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
        LanguagePresenter.language.accountsManagement,
      ))),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomButton(
                context: context,
                action: () {
                  addNewUser();
                },
                height: 50,
                content: LanguagePresenter.language.addNewUser,
                icon: Icons.person_add_alt,
              )),
          if (userSelected != null)
            BuildUserInfo(iconButtonLogOut: false, user: userSelected!),
          buildListUser()
        ],
      ),
    );
  }

  Widget buildListUser() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(LanguagePresenter.language.listAccount,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  decoration: const BoxDecoration(color: Colors.grey),
                  children: [
                    TableCell(
                      child: Center(
                          child: Text(LanguagePresenter.language.userName)),
                    ),
                    TableCell(
                      child: Center(
                          child: Text(LanguagePresenter.language.fullName)),
                    ),
                    TableCell(
                      child: Center(
                          child: Text(LanguagePresenter.language.permission)),
                    ),
                    TableCell(
                      child: Center(
                          child: Text(LanguagePresenter.language.blocked)),
                    ),
                  ],
                ),
                for (int i = 0; i < UserPresenter.users.length; i++)
                  TableRow(
                    decoration: BoxDecoration(
                      color: UserPresenter.users[i] == userSelected
                          ? Colors.blue
                          : null,
                    ),
                    children: [
                      TableCell(
                          child: InkWell(
                        onTap: () {
                          updateUserSelected(UserPresenter.users[i]);
                        },
                        child: Center(
                            child: Text(UserPresenter.users[i].userName)),
                      )),
                      TableCell(
                          child: InkWell(
                        onTap: () {
                          updateUserSelected(UserPresenter.users[i]);
                        },
                        child: Center(
                            child: Text(UserPresenter.users[i].fullName)),
                      )),
                      TableCell(
                          child: InkWell(
                        onTap: () {
                          updateUserSelected(UserPresenter.users[i]);
                        },
                        child: Center(
                            child: Text(UserPresenter.getStringPermission(
                                UserPresenter.users[i]))),
                      )),
                      TableCell(
                          child: InkWell(
                        onTap: () {
                          updateUserSelected(UserPresenter.users[i]);
                        },
                        child: Center(
                            child: Checkbox(
                                onChanged: (valua) {
                                  updateUserSelected(UserPresenter.users[i]);
                                },
                                value: UserPresenter.users[i].blocked)),
                      )),
                    ],
                  ),
              ],
            ),
          ],
        ));
  }

  addNewUser() {
    //goto signup screen
  }
}
