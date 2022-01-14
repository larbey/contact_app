import 'package:flutter/material.dart';
import 'package:contact_app/recents_model.dart';

class RecentsPage extends StatelessWidget {
  final Map recent; //to give required this.recent
  RecentsPage({Key? key, required this.recent}) : super(key: key);
  final Recent profile = Recent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: true,
        //leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        title: const Text('Contacts',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: Colors.black)),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(profile.image), fit: BoxFit.contain)),
              ),

              /* const CircleAvatar(radius: 65,
              backgroundImage: AssetImage('assets/images/girl.jpg', width:10, height:10),
              ),*/

              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Text(profile.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Text(
                '${profile.city}, ${profile.country}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(color: Colors.grey),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Mobile',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      //contentPadding: const EdgeInsets.symmetric(horizontal:5),
                      subtitle: Text(profile.mobile),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Icon(Icons.message_outlined),
                          ),
                          Icon(Icons.call_outlined),
                        ],
                      ),
                    ),
                    ListTile(
                      title: const Text('Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text(profile.email),
                      trailing: const Icon(Icons.mail_outline_outlined),
                    ),
                    ListTile(
                      title: const Text('Group',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text(profile.group),
                      trailing: const Icon(Icons.mail_outline_outlined),
                    ),
                  ],
                ),
              ),
              const Text(
                'Account Linked',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: Column(
                    children: const [
                      ListTile(
                        title: Text('Telegram',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        trailing: Icon(Icons.mail),
                      ),
                      ListTile(
                        title: Text('WhatsApp',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        trailing: Icon(Icons.mail_outline_outlined),
                      ),
                    ],
                  )),
              const Text(
                'More Options',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 140,
                margin: const EdgeInsets.only(top: 12),
                decoration: const BoxDecoration(color: Colors.grey),
                child: Column(
                  children: const [
                    ListTile(
                      title: Text('Share Contact',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    ListTile(
                      title: Text('QR Code',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
