import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBarWithoutSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: new Text(
        AppLocalizations.of(context)!.title,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(28),
        bottomRight: Radius.circular(28),
      )),
    );
  }
}
