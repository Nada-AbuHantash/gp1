
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/home.dart';

import 'ChatRoom.dart';

class searchchat extends StatefulWidget {
  @override
  _searchchatState createState() => _searchchatState();
}

class _searchchatState extends State<searchchat> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
 // late final bool isme;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    setStatus("Online");
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: globalcolors.besiccolor,
        title: Text("search to chat",style: TextStyle(color: globalcolors.textcolor),),
        // actions: [
        //   IconButton(icon: Icon(Icons.logout), onPressed: () => home())
        // ],
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height / 14,
                    width:  350,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                        
                        hintText: "Search",
                        hintStyle: TextStyle(color: globalcolors.textcolor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15.0)),
                                foregroundColor: globalcolors.maincolor,
                          backgroundColor: globalcolors.textcolor,
                          minimumSize: Size(250, 50),
                                ),
                                   child: Text("Search",
                                    style: TextStyle(color: globalcolors.maincolor,fontSize: 25),),
                                        onPressed: onSearch,
                    ),

                                   
              
               
               
                SizedBox(
                  height: size.height / 30,
                ),
                userMap != null
                    ? ListTile(
                        onTap: () {
                          String roomId = chatRoomId(
                              _auth.currentUser!.displayName!,
                              userMap!['name']);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatRoom(
                                chatRoomId: roomId,
                                userMap: userMap!,
                              //  isme:  _auth.currentUser==userMap!['email'],
                              ),
                            ),
                          );
                        },
                        leading: Icon(Icons.account_circle_sharp, color: globalcolors.textcolor),
                        title: Text(
                          userMap!['name'],
                          style: TextStyle(
                            color: globalcolors.textcolor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(userMap!['email']),
                        trailing: Icon(Icons.maps_ugc, color: globalcolors.notetcolor),
                      )
                    : Container(),
              ],
            ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.group),
      //   onPressed: () => Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (_) => GroupChatHomeScreen(),
      //     ),
      //   ),
      // ),
    );
  }
}