import 'package:flutter/material.dart';

class login_signup extends StatefulWidget{
  login_signup_state createState() => login_signup_state();
}

class login_signup_state extends State<login_signup>{

  TextEditingController _txt1 = new TextEditingController();
  TextEditingController _txt2 = new TextEditingController();
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _contact = new TextEditingController();
  FocusNode fnode1 = FocusNode();
  FocusNode fnode2 = FocusNode();
  FocusNode fnode3 = FocusNode();
  FocusNode uname = FocusNode();
  FocusNode password = FocusNode();
  FocusNode email = FocusNode();
  FocusNode contact = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  late double h1,h2,h3; // this will be used for setting margin over waves different
  bool first_pane= true,onstart=true,display_text=true; // true if first page is open, false if close

  void change_size(){
    setState(() {
      if(first_pane){
        first_pane = false;
        h1 = MediaQuery.of(context).size.height*0.10;
        h2 = MediaQuery.of(context).size.height*0.12;
        h3 = MediaQuery.of(context).size.height;
        display_text = false;
      }else{
        first_pane = true;
        h1 = MediaQuery.of(context).size.height*0.3;
        h2 = MediaQuery.of(context).size.height*0.318;
        h3 = MediaQuery.of(context).size.height*0.33;
        display_text = true;
      }
      print("hello");
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
        resizeToAvoidBottomInset: false,
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
                child: AnimatedContainer(
                  margin: EdgeInsets.fromLTRB(0, h1, 0, 0),
                  //height: 500,
                  constraints: BoxConstraints.loose(Size(MediaQuery.of(context).size.width,1000)),
                  //width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  duration: new Duration(milliseconds: 500),
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
                child: AnimatedContainer(
                  margin: EdgeInsets.fromLTRB(0, h2, 0, 0),
                  constraints: BoxConstraints.expand(),
                  //height: 500,
                  //width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  duration: new Duration(milliseconds: 500),
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
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                              child: Theme(
                                data: ThemeData(
                                  primaryColor: Colors.white,
                                  textTheme: TextTheme(
                                    bodyText2: TextStyle(color: Colors.white),
                                  ),
                                ),
                                child: Form(
                                  key: _formKey2,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          IconButton(onPressed: (){
                                            FocusScope.of(context).requestFocus(fnode1);
                                            change_size();
                                            }, icon: Icon(Icons.arrow_back_ios)),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text("WELCOME!",style: TextStyle(color: Colors.white,fontSize: 35),),
                                      ),
                                      Row(
                                        children: [
                                          Text("Username"),
                                        ],
                                      ),
                                      TextFormField(
                                        controller:_username,
                                        focusNode: uname,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        onFieldSubmitted: (value){
                                          FocusScope.of(context).requestFocus(password);
                                        },
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return "Please enter username";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Enter user name",

                                        ),
                                      ),
                                      const SizedBox(height: 50,),
                                      Row(
                                        children: [
                                          Text("Password"),
                                        ],
                                      ),
                                      TextFormField(
                                        controller:_password,
                                        focusNode: password,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        onFieldSubmitted: (value){
                                          FocusScope.of(context).requestFocus(email);
                                        },
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return "Please a valid password";
                                          }else if(value.length < 8){
                                            return "Password must be greater than 8 digit";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Enter Password",

                                        ),
                                      ),
                                      const SizedBox(height: 50,),
                                      Row(
                                        children: [
                                          Text("Email"),
                                        ],
                                      ),
                                      TextFormField(
                                        controller:_email,
                                        focusNode: email,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        onFieldSubmitted: (value){
                                          FocusScope.of(context).requestFocus(contact);
                                        },
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return "Please enter a valid Email-id";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Enter an Email Id",

                                        ),
                                      ),
                                      const SizedBox(height: 50,),
                                      Row(
                                        children: [
                                          Text("Contact"),
                                        ],
                                      ),
                                      TextFormField(
                                        controller:_contact,
                                        focusNode: contact,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        onFieldSubmitted: (value){
                                          FocusScope.of(context).requestFocus(fnode3);
                                        },
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return "Please enter a valid Contact number.";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Enter Contact",
                                        ),
                                      ),
                                      const SizedBox(height: 50,),
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
                                            'Submit',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
                child: AnimatedContainer(
                  margin: EdgeInsets.fromLTRB(0, h3 ,0, 0),
                  constraints: BoxConstraints.expand(),
                  //height: 500,
                  //width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  //curve: Curves.fastOutSlowIn,
                  duration: new Duration(milliseconds: 500),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            child: SizedBox(
                              height: 50,
                              child: CustomPaint(
                                painter: draw_curve(background_color: Colors.white),
                                size: Size(MediaQuery.of(context).size.width,50),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              constraints: BoxConstraints.expand(),
                              //height: 500,
                              //width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white
                              ),
                              child: SingleChildScrollView(
                                child: Padding(
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
                                            hintText: "Enter username / Email-id",

                                          ),
                                        ),
                                        const SizedBox(height: 30,),
                                        Row(
                                          children: [
                                            Text("Password"),
                                          ],
                                        ),
                                        TextFormField(
                                          controller:_txt2,
                                          focusNode: fnode2,
                                          obscureText: true,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          onFieldSubmitted: (value){
                                            FocusScope.of(context).requestFocus(fnode3);
                                          },
                                          validator: (value){
                                            if(value == null || value.isEmpty){
                                              return "Please enter a valid password";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            hintText: "Enter Password",

                                          ),
                                        ),
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
                                            onPressed: () {
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: display_text ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      GestureDetector(
                        onTap: (){
                          FocusScope.of(context).requestFocus(uname);
                          change_size();
                        },
                        child: Text("Sign Up",style: TextStyle(color: Colors.blue[900]),),
                      ),
                    ],
                  ) : null
                )
              ],
            ),
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