import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class contactUrgence extends StatefulWidget {
  const contactUrgence({ Key? key }) : super(key: key);

  @override
  State<contactUrgence> createState() => _contactUrgenceState();
}

class _contactUrgenceState extends State<contactUrgence> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact d'urgence"),
      ),
      body: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.vertical,
        itemBuilder:  (context, index) {
          return GestureDetector(

            child: Container(
              width: 100,
              
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context, builder: _builtBottomSheet);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.contact_page_outlined),
                  ),
                  title: Text("nom du contact"),
                  subtitle: Text("fonctionnalité"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                        
                ),
              ),
            ),
          );
        })
        
    );
  }
}

  Container _builtBottomSheet(BuildContext context){

    return Container(
      height: 250,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),

      ),
      child: ListView(
        children: [
          ListTile(title: Text("contact d'urgence", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
          Container(
            alignment: Alignment.center,
            child:  Text("nom du contact", style: TextStyle(fontSize: 16),),
            ),
            SizedBox(height: 30,),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.red,
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.phone, size: 35,)
                 ),
            ),
               SizedBox(width: 50,),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.red,
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.message, size: 35,)
                 ),
            ),
          ],
        ),
        ],
        
        
      ),
    );
    
  }