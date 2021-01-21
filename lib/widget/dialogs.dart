
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void showMessage(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}

Future<void> showInfoDialog(BuildContext context, String title, String description, {IconData icon = FontAwesomeIcons.info, String info = "Info", Function onDismissed}) async {
  showDialog(
    context: context,
    child: SimpleDialog(
      title: ListTile(
        title: Text(info),
        leading: FaIcon(icon),
      ),
      children: <Widget>[
        ListTile(
          title: Text(title),
          subtitle: Text(description)
        )
      ]
    )
  ).then((value) {
    if (onDismissed != null) {
      onDismissed();
    }
  });
}

Future<void> showErrorDialog(BuildContext context, String title, String description, {IconData icon = FontAwesomeIcons.exclamationCircle, String error = "Error", Function onDismissed}) async {
  showDialog(
    context: context,
    child: SimpleDialog(
      title: ListTile(
        title: Text(error),
        leading: FaIcon(icon),
      ),
      children: <Widget>[
        ListTile(
          title: Text(title),
          subtitle: Text(description)
        )
      ]
    )
  ).then((value) {
    if (onDismissed != null) {
      onDismissed();
    }
  });
}

void showProgressDialog(BuildContext context, String title, String description) {

  showDialog(
    context: context,
    barrierDismissible: false,
    child: SimpleDialog(
      title: Text(title),
      children: <Widget>[
        CircularProgressIndicator(),
        Text(description),
      ],
    )
  );
}

void hideProgressDialog(BuildContext context) {
  Navigator.pop(context);
}

void showFormDialog(BuildContext context, String title, {GlobalKey<FormState> key, List<Widget> fields, List<Widget> actions}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text(title),
          actions: actions,
          content: Form(
              key: key,
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: fields
                  )
              )
          )
      );
    }
  );
}