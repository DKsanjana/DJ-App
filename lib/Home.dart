import 'package:flutter/material.dart';

import 'Information.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {


  Animation<double> animation;
  Animation<double> rotateAnimation;
  AnimationController _diskrotate,_textrotate,_rotateDisk;
  int count=0;
  String text="Information";
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    _diskrotate=AnimationController(vsync: this,duration: Duration(milliseconds: 2200));
    _textrotate=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _rotateDisk=AnimationController(vsync: this,duration: Duration(milliseconds: 2000));

    animation=new Tween(begin: 0.0,end: 0.0).animate(
      CurvedAnimation(
        parent: _textrotate,
        curve: Curves.bounceInOut,
      )
    );

    rotateAnimation=new Tween(begin: 0.0,end:1.0).animate(_rotateDisk)
    ..addListener(() {
      setState(() {

      });

    });

   _diskrotate.repeat();
   _textrotate.forward();

  }

  Matrix4 matrix = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
         backgroundColor: Colors.black,
      ),

      body: Center(

          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _diskrotate,
                child: GestureDetector(
                    onTap: (){

                      setState(() {

                        _textrotate=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
                        _textrotate.forward();
                        count=count+1;

                        if(count==0){
                           text="Information";
                        }else if(count==1){
                          text="Videos";

                        }else if(count==2){

                          text="Lessons";
                        }else if(count==3){
                          text="Bussiness Directory";

                        }else if(count==4){
                          text="Information";

                        }
                        else if(count==5){
                          text="DJ Accademy";

                        }
                        else if(count==6){
                            count=0;

                        }

                      });



                    },
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(("assets/disk.png")),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
              ),

              Padding(
                  padding: EdgeInsets.all(30.0),
                  child: InkWell(
                      onTap: (){

                        if(text=="Information"){
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>Information()));

                        }


                      },
                      child: ScaleTransition(
                        scale: _textrotate,
                        child: Text(text,
                          style: TextStyle(color: Colors.orange,fontSize: 20.0,fontWeight: FontWeight.w700),

                        ),
                      ))),

              Padding(padding:EdgeInsets.only(top:60.0)),
              Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRect(
                      child: Image(
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                        image: ExactAssetImage(("assets/disk.png")),
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(left: 10.0)),

                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("the.dj.academy",
                              style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w700),),
                            
                            
                            Padding(
                                padding: EdgeInsets.only(left: 8.0,top: 2.0),
                                child: Text("Eductaion  |Access  |Insight ",style: TextStyle(color: Colors.white),)),
                          ],

                        )

                      ],
                    )


                  ],

                ),
              )


            ],

          )


      ),



    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _diskrotate.dispose();
    _textrotate.dispose();
  }
}
