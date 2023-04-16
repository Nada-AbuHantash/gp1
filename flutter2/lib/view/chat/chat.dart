import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/addproduct.dart';
  final _firestore=FirebaseFirestore.instance;
  late User signedInUser;

class ChatScreen extends StatefulWidget {
 // static const String screenRoute = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final msgconroller=TextEditingController();
  final _auth = FirebaseAuth.instance;
String? messagetext; 
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }
//   void getmessag()async{
// await for(var msm in _firestore.collection('messages').snapshots())
// {
// for(var msg in msm.docs){

// }
 
// }


//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Row(
          children: [
            Image.asset('assets/images/profile.png', height: 25),
            SizedBox(width: 10),
            Text('MessageMe')
          ],
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       _auth.signOut();
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.close),
        //   )
        // ],
      ),
      body: SafeArea(
        child: Container(
          
            
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  msgstreambluder(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.orange,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: msgconroller,
                              onChanged: (value) {
                                  messagetext =value;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                hintText: 'Write your message here...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              msgconroller.clear();
                              _firestore.collection('messages').add({
                                'text':messagetext,
                                'sender':signedInUser.email,
                                'time':FieldValue.serverTimestamp(),
                                'name':signedInUser.displayName,
                              });
                            },
                            child: Text(
                              'send',
                              style: TextStyle(
                                color: Colors.blue[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
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





class msgstreambluder extends StatelessWidget {
  const msgstreambluder
({super.key});

  @override
  Widget build(BuildContext context) {
    return   StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('messages').orderBy('time').snapshots(),
                      builder: (context,Snapshot){
                       List<msgline> msgwide=[];
                       if(!Snapshot.hasData){print(Snapshot.data);}
                       final  massege =Snapshot.data?.docs;
                             
                              for(var mas in massege?.toList() ?? []){
              final msgtext=mas.get('text');
              final msgsen=mas.get('sender');
              final name=mas.get('name');
              final cutrrentuser=signedInUser.email;

if(cutrrentuser==msgsen){}

              final msgw=msgline(sender: msgsen,text: msgtext,isme:cutrrentuser==msgsen ,name:name);
              msgwide.add(msgw);
              }
              
              return Expanded(
                child:   ListView(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  children: 
                
                msgwide,
                
                 
                
                ),
              );
                      });
  }
}
class msgline extends StatelessWidget {
  const msgline({this.text, this.sender,required this.isme,this.name,Key? key}):super(key : key);
final String? text;
final String? sender;
final String? name;
final bool isme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
      crossAxisAlignment: isme? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text('$name',
          style: TextStyle(color: globalcolors.textcolor,
          fontSize: 10),),
          Material(
            elevation: 5,
            borderRadius:isme ? BorderRadius.only(
              topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
            ):BorderRadius.only(
              topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
            ),
            color: isme? globalcolors.textcolor:globalcolors.besiccolor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Text('$text',
              style: TextStyle(fontSize: 15,color:isme? globalcolors.maincolor:globalcolors.textcolor),),
            )),
        ],
      ),
    );
  }
  
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
}