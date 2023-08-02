  import 'package:app_hifadhu/models/UsersInfos.dart';
import 'package:app_hifadhu/views/components/makeCall.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dataController.dart';
import '../customs/custom.dart';
  
    
    class CRUDListView extends StatefulWidget {
      @override
      _CRUDListViewState createState() => _CRUDListViewState();
    }
    
    class _CRUDListViewState extends State<CRUDListView> {
      List<UsersInfos>? _produits;
      List<UsersInfos>? _searchProduct;
      TextEditingController controller = new TextEditingController();
      Controller controllers = Get.put(Controller());
    
      @override
      void initState() {
        super.initState();
        _produits = [];
        _searchProduct = [];
        getUsers();
      }
    
       getUsers(){

     controllers.getUsersInfos().then((users) {
       setState(() {
         
         _produits = users;
       });
      

     });
    
  }
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          
          appBar: new AppBar(
            backgroundColor: pink,
            title: new Text('RECHERCHE DE DONNEUR'),
            elevation: 0.0,
          ),
          body: new Column(
            children: <Widget>[
              new Container(
                color: pink,
                //  decoration: BoxDecoration(
                //                  boxShadow: [shadow(red)],
                //                  gradient: redGradient(),
                //                 //  color: red.withOpacity(0.2),
                                
                //                 ),
                child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Card(
                    child: new ListTile(
                      leading: new Icon(Icons.search),
                      title: new TextField(
                        controller: controller,
                        decoration: new InputDecoration(
                            hintText: 'Veuillez saisir le groupe Sanguin', border: InputBorder.none),
                        onChanged: onSearchTextChanged,
                      ),
                      trailing: new IconButton(
                        icon: new Icon(Icons.cancel),
                        onPressed: () {
                          controller.clear();
                          onSearchTextChanged('');
                        },
                      ),
                    ),
                  ),
                ),
              ),
              new Expanded(
                child: _searchProduct!.length != 0 || controller.text.isNotEmpty
                    ? new ListView.builder(
                        itemCount: _searchProduct!.length,
                        itemBuilder: (context, i) {
                          return Container(
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(Icons.bloodtype, color: red,),
                              title: Text(('${_searchProduct![i].blood}'), style:  TextStyle( color: red)),
                              subtitle: Text(('${_searchProduct![i].name}'), style:  TextStyle( color: blue)), 
                              trailing: IconButton(icon: Icon(Icons.call, color: red,),
                              onPressed: (){
                                sosCall(_searchProduct![i].phone);
                              },
                              )
                            ),
                          );
                        },
                      )
                    :   Center(
                      child: Text(
                        'aucun resultat',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
              ),
            ],
          ),
        );
      }
    
      onSearchTextChanged(String text) async {
        _searchProduct!.clear();
        if (text.isEmpty) {
          setState(() {});
          return;
        }
    
        _produits!.forEach((produit) {
          if (produit.blood!.contains(text) || produit.phone!.contains(text))
            _searchProduct!.add(produit);
        });
    
        setState(() {});
      }
    }
    