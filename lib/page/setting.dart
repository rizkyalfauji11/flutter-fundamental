import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fundamental/provider/preference_provider.dart';
import 'package:flutter_fundamental/provider/schduling_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _bodySetting(context);
  }

  Widget _bodySetting(BuildContext context) {
    return Consumer<PreferencesProvider>(builder: (context, provider, child) {
      return SafeArea(
          child: ListTile(
        title: Text('Scheduling restaurant'),
        trailing: Consumer<SchedulingProvider>(
          builder: (context, scheduled, _) {
            return Switch.adaptive(
                value: provider.isDailyScheduleActive,
                onChanged: (value) async {
                  if (Platform.isIOS) {
                    Fluttertoast.showToast(
                        msg: 'Coming soon',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.yellow);
                  } else {
                    scheduled.scheduledRestaurant(value);
                    provider.enableScheduleRestaurant(value);
                  }
                });
          },
        ),
      ));
    });
  }
}
