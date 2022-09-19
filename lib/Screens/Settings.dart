import 'package:expenses_management/Utils/CommonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/Colors.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildCustomAppBar(
          centerTitle: true,
          title: 'Settings',
          trailing: const SizedBox(),
          context: context),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Currency()));
              },
              title: Text(
                'Currency',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 16),
              ),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'USD',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: grey91919F),
                    ),
                    Icon(Icons.arrow_forward_ios_sharp),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Language()));
              },
              title: Text(
                'Language',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 16),
              ),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'English',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: grey91919F),
                    ),
                    Icon(Icons.arrow_forward_ios_sharp),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThemeList()));
              },
              title: Text(
                'Theme',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 16),
              ),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Dark',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: grey91919F),
                    ),
                    Icon(Icons.arrow_forward_ios_sharp),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Security()));
              },
              title: Text(
                'Security',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 16),
              ),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Fingerprint',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: grey91919F),
                    ),
                    Icon(Icons.arrow_forward_ios_sharp),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications()));
              },
              title: Text(
                'Notification',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 16),
              ),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
          ],
        ),
      ),
    );
  }
}

class Currency extends StatefulWidget {
  const Currency({Key? key}) : super(key: key);

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  List<String> currencyList = [
    'United States (USD)',
    'Indonesia (IDR)',
    'Japan (JPY)',
    'Russia (RUB)',
    'Germany (EUR)',
    'Korea (WON)'
  ];

  int currency = 0;
  List<int> currencyCheck = [0, 1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          centerTitle: true,
          context: context,
          trailing: const SizedBox(),
          title: 'Currency'),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return RadioListTile(
              groupValue: currency,
              controlAffinity: ListTileControlAffinity.trailing,
              value: currencyCheck[index],
              onChanged: (value) {
                setState(() {
                  currency = currencyCheck[index];
                });
              },
              title: Text(
                currencyList[index],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 14),
              ),
              activeColor: green219653,
            );
          },
          shrinkWrap: true,
          primary: false,
          itemCount: currencyList.length,
        ),
      ),
    );
  }
}

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List<String> languageList = [
    'English (EN)',
    'Indonesian (ID)',
    'Arabic (AR)',
    'Chinese (ZH)',
    'Dutch (NL)',
    'French (FR)',
    'German (DE)',
    'Italian (IT)',
    'Korean (KO)',
    'Portuguese (PT)',
    'Russian (RU)',
    'Spanish (ES)'
  ];

  int language = 0;
  List<int> languageCheck = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          centerTitle: true,
          context: context,
          trailing: const SizedBox(),
          title: 'Language'),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return RadioListTile(
              groupValue: language,
              value: languageCheck[index],
              onChanged: (value) {
                setState(() {
                  language = languageCheck[index];
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text(
                languageList[index],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 14),
              ),
              activeColor: green219653,
            );
          },
          shrinkWrap: true,
          primary: false,
          itemCount: languageList.length,
        ),
      ),
    );
  }
}

class ThemeList extends StatefulWidget {
  const ThemeList({Key? key}) : super(key: key);

  @override
  State<ThemeList> createState() => _ThemeListState();
}

class _ThemeListState extends State<ThemeList> {
  List<String> themeList = ['Light', 'Dark', 'Use Device Theme'];
  List<int> themeCheck = [0, 1, 2];
  int theme = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          centerTitle: true,
          context: context,
          trailing: const SizedBox(),
          title: 'Theme'),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return RadioListTile(
              groupValue: theme,
              value: themeCheck[index],
              onChanged: (value) {
                setState(() {
                  theme = themeCheck[index];
                });
              },
              title: Text(
                themeList[index],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 14),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: green219653,
            );
          },
          shrinkWrap: true,
          primary: false,
          itemCount: themeList.length,
        ),
      ),
    );
  }
}

class Security extends StatefulWidget {
  const Security({Key? key}) : super(key: key);

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  List<String> securityList = ['PIN', 'Fingerprint', 'Face ID'];
  List<int> securityCheck = [0, 1, 2];
  int security = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          centerTitle: true,
          context: context,
          trailing: const SizedBox(),
          title: 'Security'),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return RadioListTile(
              groupValue: security,
              value: securityCheck[index],
              onChanged: (value) {
                setState(() {
                  security = securityCheck[index];
                });
              },
              title: Text(
                securityList[index],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 14),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: green219653,
            );
          },
          shrinkWrap: true,
          primary: false,
          itemCount: securityList.length,
        ),
      ),
    );
  }
}

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<String> notificationList = [
    'Expense Alert',
    'Budget',
    'Tips & Articles'
  ];
  List<String> notificationListSubtitle = [
    "Get notification about you’re expense",
    "Get notification when you’re budget exceeding the limit",
    "Small & useful pieces of pratical financial advice"
  ];
  List<bool> notificationCheck = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          centerTitle: true,
          context: context,
          trailing: const SizedBox(),
          title: 'Notifications'),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SwitchListTile(
              value: notificationCheck[index],
              onChanged: (value) {
                setState(() {
                  notificationCheck[index] = value;
                });
              },
              subtitle: Text(
                notificationListSubtitle[index],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 13,color: grey91919F),
              ),
              title: Text(
                notificationList[index],
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 14),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: green219653,
            );
          },
          shrinkWrap: true,
          primary: false,
          itemCount: notificationList.length,
        ),
      ),
    );
  }
}
