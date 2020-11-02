import 'package:flutter/material.dart';



class RecoardPlay extends StatefulWidget {
  @override
  _RecoardPlayState createState() => _RecoardPlayState();
}

class _RecoardPlayState extends State<RecoardPlay> with TickerProviderStateMixin{

  Animation<double> animation;
  Animation<double> blurAnimation;
  Animation<double>  ContainerAnimation;
  AnimationController _animationController;
  bool range = false;
  bool isRecording=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween<double>(begin: -100, end: 0.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    blurAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    ContainerAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));



  }


  configureAnimation() {
    if (range) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    range = !range;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Record & Play",style: TextStyle(color: Colors.white),),
      ),

      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context,widget){
          return Stack(
              fit: StackFit.expand,
              children: [Column(
                children: [
                  Container(
                    color: Colors.black,
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.05,
                    child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("My Recordings",style: TextStyle(color: Colors.orange,fontSize: 20.0),)),
                  ),



                     Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.63,
                      //color: Colors.black.withOpacity(0.8),
                      child: ListView.builder(

                          itemCount: 10,
                          itemBuilder:(BuildContext context,int position){

                        return Card(
                          elevation: 9,
                          color: Colors.black,
                          child: Container(

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[Padding(
                                    padding:EdgeInsets.all(8.0),
                                    child: Text("Recording 1",style: TextStyle(color: Colors.white,fontSize: 16.0),)),

                                IconButton(

                                    icon: Icon(Icons.delete,color: Colors.white,), onPressed: (){}),

                                ]
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding:EdgeInsets.all(8.0),
                                      child: Text("Here goes the date",style: TextStyle(color: Colors.grey),)),
                                  Padding(
                                      padding:EdgeInsets.all(8.0),
                                      child: Text("Here goes the time",style: TextStyle(color: Colors.grey),)),

                                ],
                              )



                            ],

                            ),


                          ),

                        );

                      }

                      ),

                    ),






                ],


              ),

              Positioned(
                bottom: animation.value,
                child: GestureDetector(
                  onTap: (){
                    configureAnimation();

                  },
                  child: Opacity(
                    opacity: 0.9,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        )
                      ),
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width ,
                      height: MediaQuery.of(context).size.height/3,



                      child: Column(


                        children: [
                            Text("Record",style: TextStyle(color: Colors.white,fontSize: 19.0),),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black,

                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 100,

                                child:Text("00:00:00",style: TextStyle(color: Colors.white,fontSize: 30.0),),

                              ),
                            ),

                            Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                IconButton(icon: Icon(Icons.play_circle_outline,size: 40.0,), onPressed:(){}),
                                IconButton(icon: Icon(Icons.stop_circle_outlined,size: 40.0,color: Colors.red,), onPressed: null),
                              ],
                            )
                        ],

                      ),


                    ),
                  ),
                ),
              ),


              ]
          );

        }

      ),


    );
  }







}
