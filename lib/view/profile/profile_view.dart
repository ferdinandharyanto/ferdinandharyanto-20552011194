import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,

      // ),
      // extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          builTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget builTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        )
      ],
    );
  }

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'Ferdinand Haryanto',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            'Frontend Developer',
            style:
                TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.5)),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.instagram,
                  "https://www.instagram.com/fharyanto__/"),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.facebook,
                  "https://www.facebook.com/ferdinand.haryanto.3/"),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.linkedin,
                  "https://www.linkedin.com/in/ferdinand-haryanto-b4a789215/"),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.github,
                  "https://github.com/ferdinandharyanto"),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          buildAbout(),
          const SizedBox(height: 16)
        ],
      );

  Widget buildAbout() => Container(
        padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('About',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
            SizedBox(height: 16),
            Text(
              "hi everyone, I'm Ferdinand Haryanto - 20552011194 a student from STTB campus. I'm just learning flutter for the first time and I think it's fun too. but I still have a lot to learn. I have experience in the IT field on the frontend of the website. therefore, this mobile learning can add my insight about IT.",
              style: TextStyle(fontSize: 18, height: 1.4),
            )
          ],
        ),
      );

  Widget buildSocialIcon(IconData icon, linkData) => CircleAvatar(
      radius: 25,
      child: Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
            onTap: () => {launchUrl(Uri.parse(linkData))},
            child: Center(
              child: Icon(icon, size: 32),
            )),
      ));

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          "lib/assets/images/background.jpg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      child: const CircleAvatar(
        backgroundImage: AssetImage('lib/assets/images/profile.jpg'),
        radius: 65,
      ));
}
