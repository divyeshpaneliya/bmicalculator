
import 'package:bmicalculator/Screens/home/hprovider.dart';
import 'package:bmicalculator/Screens/utils/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class result extends StatefulWidget {
  const result({Key? key}) : super(key: key);

  @override
  _resultState createState() => _resultState();
}



class _resultState extends State<result> {
  var hpt;
  var hpf;
  String? msg1;
  String? msg2;


  @override
  void initState() {
    super.initState();
    msg1 = Provider.of<hprovider>(context, listen: false).getResult();
    msg2 = Provider.of<hprovider>(context, listen: false).getInterpretation();
    Provider.of<hprovider>(context, listen: false)..bmi_call();
  }


  @override
  Widget build(BuildContext context) {

    hpt = Provider.of<hprovider>(context, listen: true);
    hpf = Provider.of<hprovider>(context, listen: false);


    return SafeArea(
      child: Scaffold(
        backgroundColor: pri,
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text("${msg1}",style: TextStyle(color: white),),
          SizedBox(height: 50,),
              Text(
                  "${Provider.of<hprovider>(context, listen: false).bmi.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 50,color: white),
              ),
    SizedBox(height: 50,),
              Text("${msg2}",style: TextStyle(color: white),),
    SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () {
                  hpf.refresh();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.pink),
                child: Text("RE-CALCULATE",style: TextStyle(color: white),),
              ),
    SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:bmi_calculator/screen/home/hvprovider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class result extends StatefulWidget {
//   const result({Key? key}) : super(key: key);
//
//   @override
//   _resultState createState() => _resultState();
// }
//
// class _resultState extends State<result> {
//
//   @override
//   void initState() {
//     super.initState();
//
//     String? msg = Provider.of<hprovider>(context,listen: false).getResult();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
