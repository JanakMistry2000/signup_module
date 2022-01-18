import 'package:flutter/material.dart';

class login_signup extends StatefulWidget{
  login_signup_state createState() => login_signup_state();
}

class login_signup_state extends State<login_signup>{

  TextEditingController _txt1 = new TextEditingController();
  TextEditingController _txt2 = new TextEditingController();
  FocusNode fnode1 = FocusNode();
  FocusNode fnode2 = FocusNode();
  FocusNode fnode3 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  late double h1,h2,h3; // this will be used for setting margin over waves different
  bool first_pane= false,onstart=true; // true if first page is open, false if close

  void change_size(){
    setState(() {
      if(first_pane){
        first_pane = false;
        h1 = MediaQuery.of(context).size.height*0.10;
        h2 = MediaQuery.of(context).size.height*0.12;
        h3 = MediaQuery.of(context).size.height;
      }else{
        first_pane = true;
        h1 = MediaQuery.of(context).size.height*0.3;
        h2 = MediaQuery.of(context).size.height*0.318;
        h3 = MediaQuery.of(context).size.height*0.33;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(onstart){
      onstart = false;
      h1 = MediaQuery.of(context).size.height*0.3;
      h2 = MediaQuery.of(context).size.height*0.318;
      h3 = MediaQuery.of(context).size.height*0.33;
    }
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("lib/assets/mountain.jpg",fit: BoxFit.fill,)
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25,MediaQuery.of(context).size.height*0.15, 20, 20),
                child: Row(
                  children: [
                    Text("CHALET",style: TextStyle(fontSize: 30),),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, h1, 0, 0),
                  //height: 500,
                  constraints: BoxConstraints.loose(Size(MediaQuery.of(context).size.width,1000)),
                  //width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  //duration: new Duration(milliseconds: 500),
                  child: Column(
                    children: [
                        CustomPaint(
                            painter: draw_curve(background_color: Colors.deepPurple),
                            size: Size(MediaQuery.of(context).size.width,50),
                        ),
                      Expanded(
                        child: Container(
                          //height: 300,
                          constraints: BoxConstraints.expand(),
                          //width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple
                          ),
                          child: Column(

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, h2, 0, 0),
                  constraints: BoxConstraints.expand(),
                  //height: 500,
                  //width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  //duration: new Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      CustomPaint(
                        painter: draw_curve(background_color: Colors.deepPurpleAccent),
                        size: Size(MediaQuery.of(context).size.width,50),
                      ),
                      Expanded(
                        child: Container(
                          constraints: BoxConstraints.expand(),
                          //height: 500,
                          //width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent
                          ),
                          child: Column(

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, h3 ,0, 0),
                  constraints: BoxConstraints.expand(),
                  //height: 500,
                  //width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  //curve: Curves.fastOutSlowIn,
                  //duration: new Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      CustomPaint(
                        painter: draw_curve(background_color: Colors.white),
                        size: Size(MediaQuery.of(context).size.width,50),
                      ),
                      Expanded(
                        child: Container(
                          constraints: BoxConstraints.expand(),
                          //height: 500,
                          //width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Username"),
                                        ],
                                      ),
                                      TextField(
                                        controller: _txt1,
                                        focusNode: fnode1,
                                        onSubmitted: (value){
                                          FocusScope.of(context).requestFocus(fnode2);
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Enter some text",

                                        ),
                                      ),
                                      const SizedBox(height: 50,),
                                      Row(
                                        children: [
                                          Text("Password"),
                                        ],
                                      ),
                                      TextFormField(
                                        controller:_txt2,
                                        focusNode: fnode2,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        onFieldSubmitted: (value){
                                          FocusScope.of(context).requestFocus(fnode3);
                                        },
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return "Please enter some text";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Enter some text",

                                        ),
                                      ),
                                      const SizedBox(height: 30,),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Colors.lightBlue,Colors.blue,Colors.blueAccent,Colors.deepPurpleAccent,Colors.deepPurple],
                                            begin: FractionalOffset.topLeft,
                                            end: FractionalOffset.bottomRight,
                                          ),
                                        ),
                                        child: TextButton(
                                          child: Text(
                                            'Login',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      // Container(
                                      //       height: 200,
                                      //       child: Column(
                                      //         mainAxisAlignment: MainAxisAlignment.end,
                                      //         children: [
                                      //           Text("for sign up"),
                                      //         ],
                                      //       ),
                                      //     ),

                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                                  height: 500,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Don't have an account? "),
                                          GestureDetector(
                                            onTap: change_size,
                                            child: Text("Sign Up",style: TextStyle(color: Colors.blue[900]),),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class draw_curve extends CustomPainter{
  Color background_color;

  draw_curve({required this.background_color});

  @override
  void paint(Canvas canvas, Size size) {
      var paint = Paint();
      paint.color = background_color;
      paint.style = PaintingStyle.fill;

      var path = Path();
      path.moveTo(0, size.height*0.9);
      path.cubicTo(0, size.height, size.width*-0.15, size.height*-0.3, size.width*0.45, size.height*0.65);   //This will create first arc
      path.cubicTo(size.width*0.75, size.height*0.9, size.width*0.85, size.height*-0.3, size.width, size.height*0.8); //For second arc.
      //path.quadraticBezierTo(size.width * 0.15, size.height * 0.1,
          //size.width * 0.4, size.height*0.9);
      //path.moveTo(size.width*0.45, size.height);
      //path.quadraticBezierTo(size.width* 0.55, size.height * 0.05,
         // size.width*1.0, size.height*0.9);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);

      canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}