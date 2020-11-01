import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

  List _data=["Bussiness Document","DJ Equipments","DJ software"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i=0;i<_data.length;i++){

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        centerTitle: true,
      backgroundColor: Colors.black,
        title: Text("Information"),

      ),


      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder:(BuildContext context,int position){

           return Container(


               margin: EdgeInsets.only(left: 20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
                ),
                elevation: 5,

                child:

                ListTile(
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),

                  title: new Text(_data[position],style: TextStyle(color: Colors.black),),
                  leading: CircleAvatar(
                    radius: 10.0,
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
            );






          }

          ),


    );
  }
}
