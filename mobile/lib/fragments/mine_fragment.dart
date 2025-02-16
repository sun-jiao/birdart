import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/l10n.dart';
import '../entity/user_profile.dart';
import '../pages/login_page.dart';
import '../pages/settings_page.dart';
import '../pages/profile_page.dart';

class MineFragment extends StatefulWidget {
  const MineFragment({Key? key}) : super(key: key);

  @override
  State<MineFragment> createState() => _MineFragmentState();
}

class _MineFragmentState extends State<MineFragment>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 覆写`wantKeepAlive`返回`true`

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(title: Text(BdL10n.current.myTitle)),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                if (UserProfile.logged) {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserProfilePage()))
                      .then((value) => setState(() {}));
                } else {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()))
                      .then((value) => setState(() {}));
                }
              },
              child: Row(
                children: [
                  if (UserProfile.logged)
                    Container(
                      width: 72,
                      height: 72,
                      margin: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/icon/icon.png'),
                            fit: BoxFit.fill),
                      ),
                    )
                  else
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: ClipOval(
                        child: SvgPicture.asset('assets/svg/robin.svg',
                            width: 72, height: 72, semanticsLabel: 'icon'),
                      ),
                    ),
                  if (UserProfile.logged)
                    Text(
                      UserProfile.name,
                      style: const TextStyle(fontSize: 20),
                    )
                  else
                    Text(
                      '${BdL10n.current.myLogin}/${BdL10n.current.myRegister}',
                      style: const TextStyle(fontSize: 20),
                    ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black12,
            ),
            buildButtons(),
            const Divider(
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }

  // 构建按钮部分
  Widget buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getSettingsItem(
            Icons.settings_rounded, BdL10n.current.mySettings, context,
            onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SettingsPage()));
        }),
        getSettingsItem(
            Icons.cloud_download_rounded, BdL10n.current.myData, context,
            onTap: () {}),
        getSettingsItem(Icons.info_rounded, BdL10n.current.myAbout, context,
            onTap: () {
          showAboutDialog(context: context);
        }),
        getSettingsItem(
            Icons.code_rounded, BdL10n.current.myOpenSource, context,
            onTap: () async {
          final url = Uri.parse('https://github.com/birdarts/birdart');
          if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
            throw Exception('Could not launch $url');
          }
        }),
      ],
    );
  }

  Widget getSettingsItem(IconData iconData, String title, BuildContext context,
          {Function()? onTap}) =>
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                size: 30,
                color: Colors.black87,
              ),
              Text(title),
            ],
          ),
        ),
      );
}
