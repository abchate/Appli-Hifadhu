import 'package:app_hifadhu/controllers/dataController.dart';
import 'package:app_hifadhu/customs/colors.dart';
import 'package:app_hifadhu/customs/image_url.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../customs/custom.dart';
import 'home/Empty.dart';
import 'home/Loading.dart';

class CommentPage extends StatefulWidget {
  final String comment_by;
  final String story_id;

   CommentPage({Key? key, required this.comment_by,required this.story_id}) : super(key: key);
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final formKey = GlobalKey<FormState>();
  Controller controller = Get.put(Controller());
  final TextEditingController commentController = TextEditingController();
  getList() {
  return filedata;
  }
  List filedata = [
    {
      'comment_by': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'comment': 'I love to code'
    },
    {
      'comment_by': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'comment': 'Very cool'
    },
    {
      'comment_by': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'comment': 'Very cool'
    },
    {
      'comment_by': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'comment': 'Very cool'
    },
  ];

  Widget commentChild(data) {
    return SizedBox(
       height: 200,
      width: width,
      child: ListView(
         scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
         
          // for (var i = 0; i < data.length; i++)
              SizedBox(
                height: 200,
                width: 100,
                child: ListView.builder(
                shrinkWrap: true,
                 physics: bounce,
                scrollDirection: Axis.vertical,
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  var item = data[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () async {
                        // Display the image in large form.
                        print("Comment Clicked");
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                            color: pink,
                            borderRadius: new BorderRadius.all(Radius.circular(50))),
                        child: CircleAvatar(
                            radius: 50,
                            // backgroundImage: AssetImage(AppIcon),
                            )
                      ),
                    ),
                    title: Text(
                      item.comment_by,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(item.comment),
                  ),
                );
                }),
              )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("commentaires"),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: 500,
          width: width,
          child: CommentBox(
            
            userImage:
                  "https://picsum.photos/300/30"  ,     
            child: FutureBuilder(
                  
                  future: controller.getComment(widget.story_id),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return chargementverticale();
      
                    }if (snapshot.hasError) {
                    return Center(child: Text('Something went wrong '));
                    } else {
                       var data = snapshot.data;
                      print("snapshot data $data");
                       if (data == []) {
                        return Empty();
                        } else {
                         
      
           return
             commentChild(data); }
                    }
                  }),
      
      
      
            labelText: 'Ecrire un commentaire...',
            withBorder: false,
            errorText: 'Comment cannot be blank',
            sendButtonMethod: () {
              if (formKey.currentState!.validate()) {
                print(commentController.text);
                setState(() {
                  // var value = {
                  //   'name': 'New User',
                  //   'pic':AppIcon,
                  //   'message': commentController.text
                  // };
      
                  Map comment = {
                    "comment": commentController.text,
                    "comment_by": widget.comment_by,
                    "story_id":widget.story_id
      
                  };
                  // filedata.insert(0, value);
                  controller.postComment(comment);
                });
                commentController.clear();
                FocusScope.of(context).unfocus();
              } else {
                print("Not validated");
              }
            },
            formKey: formKey,
            commentController: commentController,
            backgroundColor: Colors.black.withOpacity(0.7),
            textColor: Colors.white,
            sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}