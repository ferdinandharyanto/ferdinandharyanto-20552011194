import 'package:apk_1/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:apk_1/view/profile/profile_view.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final screen = [
    Column(
      children: <Widget>[
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hai, Ferdinand Haryanto",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text("How are you today?",
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal))
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 40),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              CustomCard(
                  title: "Settings",
                  image: "lib/assets/images/technical-support.png"),
              CustomCard(
                  title: "Contents", image: "lib/assets/images/content.png")
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Categories",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
            child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: const [
            ListTile(
              title: Text("Informative"),
              trailing: Text(
                "50",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
            ),
            ListTile(
              title: Text("Educative"),
              trailing: Text(
                "50",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
            ),
            ListTile(
              title: Text("Entertainment"),
              trailing: Text(
                "50",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
            ),
          ],
        ))
        // Expanded(
        //     child: ListView.builder(
        //   itemCount: 3,
        //   itemBuilder: (context, index) {
        //     return Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: ListTile(
        //         title: Text(),
        //         subtitle: Text("Category 1"),
        //       ),
        //     );
        //   },
        // ))
      ],
    ),
    // const Text("1"),
    // Text("2")
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'STTB',
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
              icon: const Icon(
                Icons.login_outlined,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const LoginPage())));
              },
            ),
            // CircleAvatar(
            //   backgroundImage: AssetImage('lib/assets/images/profile.jpg'),
            //   radius: 20,
            // ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: screen[_selectedIndex],
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff4338CA), Color(0xff6D28D9)])),
          child: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconBottomBar(
                            text: "Home",
                            icon: Icons.home,
                            selected: _selectedIndex == 0,
                            onPressed: () {
                              setState(() {
                                _selectedIndex = 0;
                              });
                            }),
                        IconBottomBar(
                            text: "Profile",
                            icon: Icons.account_circle_outlined,
                            selected: _selectedIndex == 1,
                            onPressed: () {
                              setState(() {
                                _selectedIndex = 1;
                              });
                            }),
                      ])),
            ),
          )),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  const IconBottomBar(
      {required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? Colors.white : Colors.grey,
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected ? Colors.white : Colors.grey),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.title, required this.image});
  String title;
  String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
          child: Wrap(
        spacing: 20.0,
        runSpacing: 20.0,
        children: [
          SizedBox(
            width: 160.0,
            height: 160.0,
            child: Card(
              color: const Color.fromARGB(255, 227, 227, 227),
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      image,
                      width: 100.0,
                    ),
                    const SizedBox(height: 10.0),
                    Text(title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                  ],
                ),
              )),
            ),
          )
        ],
      )),
    );
  }
}
