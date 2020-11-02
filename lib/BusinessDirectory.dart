import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class BusinessDirectory extends StatefulWidget {
  @override
  _BusinessDirectoryState createState() => _BusinessDirectoryState();
}

class _BusinessDirectoryState extends State<BusinessDirectory> with TickerProviderStateMixin{

  bool isCatTap=false;
  bool isAllTap=true;
  Animation<double> animation;

  AnimationController _cardView;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cardView=AnimationController(vsync:this,duration: Duration(milliseconds: 800));

    animation=new Tween(begin: 0.0,end: 0.0).animate(
        CurvedAnimation(
          parent: _cardView,
          curve: Curves.easeIn,
        )

    );

    _cardView.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Business Directory",style: TextStyle(color: Colors.white),),
      ),


      body: Column(
        children:[Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.05,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              InkWell(
                onTap: (){

                  setState(() {
                    isAllTap=true;
                    isCatTap=false;
                    _cardView=AnimationController(vsync:this,duration: Duration(milliseconds: 800));
                    _cardView.forward();

                  });




                },
                child: Container(
                    height: 30,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isAllTap?Colors.orange.withOpacity(0.8):Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),

                    child: Text("All",style: TextStyle(color: Colors.black),)),
              ),





              InkWell(

                  onTap: (){

                    setState(() {
                      isCatTap=true;
                      isAllTap=false;
                    });
                  },
                  child: Container(
                      height: 30,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isCatTap?Colors.orange.withOpacity(0.8):Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),

                      child: Text("Categories",style: TextStyle(color: Colors.black),))

              ),


            ],

          ),

        ),

        Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.85,
        color: Colors.grey.withOpacity(0.3),

          child: configure()

        )


        ]






      ),





    );
  }

  configure() {

    if(isAllTap==true){
     return ListView.builder(
          itemCount: 9,
          itemBuilder:(BuildContext context,int position) {
            return ScaleTransition(
              scale: _cardView,
              child: Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                ),
                color: Colors.black,
                elevation: 9,
                child: Container(
                  padding: EdgeInsets.only(top: 8.0,bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Padding(
                          padding:EdgeInsets.all(8.0),
                          child: Text("88 BY NECO",style: TextStyle(color: Colors.orange,fontSize:18.0),)),


                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Mobile DJ / open format",style: TextStyle(color: Colors.white),)),

                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            Icon(Icons.call,color: Colors.white,size: 17.0,),

                            Padding(

                                padding: EdgeInsets.only(left: 5.0,right: 8.0),
                                child: Text("0777205923",style: TextStyle(color: Colors.lightBlue,decoration: TextDecoration.underline),)),

                            Icon(Icons.home_outlined,color: Colors.white,size: 17.0,),

                            Padding(

                                padding: EdgeInsets.only(left: 5.0),
                                child: Text("091233225",style: TextStyle(color: Colors.lightBlue,decoration: TextDecoration.underline),)),







                          ],
                        ),
                      ),



                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.email,color: Colors.white,size: 17.0,),

                            Padding(

                                padding: EdgeInsets.only(left: 5.0,right: 8.0),
                                child: Text("neco.fernando@yahoo.com",style: TextStyle(color: Colors.lightBlue,decoration: TextDecoration.underline),)),

                          ],

                        ),
                      ),




                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [


                            Icon(Icons.public,color: Colors.white,),

                            Padding(

                                padding: EdgeInsets.only(left: 8.0,right: 8.0),
                                child: Icon(Icons.camera,color: Colors.white,)

                            ),

                          ],

                        ),
                      )




                    ],


                  ),
                ),


              ),
            );

          }

      );

    }
  }





}
