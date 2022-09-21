
import 'package:bmicalculator/Screens/home/hprovider.dart';
import 'package:bmicalculator/Screens/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {


  AnimationController? _controller;
  Animation<Offset>? offsetmale;
  Animation<Offset>? offsetfemale;


  // List l1=[];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();

    offsetmale = Tween<Offset>(
      begin: Offset(-5, 0),
      end: Offset(0, 0),
    ).animate(_controller!);

    offsetfemale = Tween<Offset>(
      begin: Offset(5, 0),
      end: Offset(0, 0),
    ).animate(_controller!);

    _controller!.addListener(() {
      setState(() {});
    });
  }

  var hpt;
  var hpf;

  @override
  Widget build(BuildContext context) {
    hpt = Provider.of<hprovider>(context, listen: true);
    hpf = Provider.of<hprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: pri,
        appBar: AppBar(title: Text("BMI CALCULATOR"),
          backgroundColor: pri,

          actions: [ IconButton(
            onPressed: () {
              hpt.refresh();
            },
            icon: Icon(Icons.refresh),
          )],),
        body: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SlideTransition(
                    position: offsetmale!,
                    child: InkWell(
                      onTap: () {
                        // setState(() {
                        //   hpt.male = true;
                        //   hpt.female = false;
                        // });
                        hpt.male_icon();
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: sec,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.male_outlined,
                              color:
                              hpt.male == true ? Colors.pink : Colors.white,
                              size: 50,
                            ),
                            Text(
                              "MALE",
                              style: TextStyle(color: white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: offsetfemale!,
                    child: InkWell(
                      onTap: () {
                        // setState(() {
                        //   female = true;
                        //   male = false;
                        // });
                        hpt.female_icon();
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: sec,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.female_outlined,
                              color: hpt.female == true
                                  ? Colors.pink
                                  : Colors.white,
                              size: 50,
                            ),
                            Text(
                              "FEMALE",
                              style: TextStyle(color: white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SlideTransition(
                position: offsetfemale!,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: sec,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(color: white),
                      ),
                      Text(
                        "${hpt.height}cm",
                        style: TextStyle(color: white),
                      ),
                      Slider(
                          thumbColor: Colors.pink,
                          inactiveColor: Colors.white,
                          activeColor: Colors.pink,
                          max: 500,
                          divisions: 500,
                          value: hpt.height,
                          onChanged: (value) {
                            // setState(() {
                            //   height = value;
                            // });
                            hpf.height1(value);
                          }),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SlideTransition(
                    position: offsetmale!,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: sec,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(color: white),
                          ),
                          Text(
                            "${hpt.weight}",
                            style: TextStyle(fontSize: 25, color: white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // setState(() {
                                  //   weight++;
                                  // });
                                  hpf.a_weight();
                                },
                                icon: Icon(Icons.add),
                                color: white,
                              ),
                              IconButton(
                                onPressed: () {
                                  // setState(() {
                                  //   if (weight > 0) {
                                  //     weight--;
                                  //   }
                                  // });
                                  if (hpf.weight > 0) {
                                    hpf.m_weight();
                                  }
                                },
                                icon: Icon(Icons.remove),
                                color: white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: offsetfemale!,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: sec,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(color: white),
                          ),
                          Text(
                            "${hpt.age}",
                            style: TextStyle(fontSize: 25, color: white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // setState(() {
                                  //   age++;
                                  // });
                                  hpf.a_age();
                                },
                                icon: Icon(Icons.add),
                                color: white,
                              ),
                              IconButton(
                                onPressed: () {
                                  // setState(() {
                                  //   if (age > 0) {
                                  //     age--;
                                  //   }
                                  // });
                                  if (hpf.age > 0) {
                                    hpf.m_age();
                                  }
                                },
                                icon: Icon(Icons.remove),
                                color: white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      if(hpf.male==true || hpf.female==true){
                        // int age=hpf.age;
                        // int weight=hpf.weight;
                        // double heightm=hpf.height/100;
                        // datamodel l1=datamodel(age, weight, heightm);

                        Navigator.pushNamed(context, 're');
                      }
                    },
                    style: ElevatedButton.styleFrom(primary:Colors.pink,),
                    child: Text("CALCULATE YOUR BMI"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
