import 'package:flutter/cupertino.dart';

class hprovider extends ChangeNotifier{
  int age=10;
  double height = 50;
  int weight = 10;
  bool male=false;
  bool female=false;
  double bmi=0;
  String? msg1='';
  String? msg2='';

  void a_age(){
    age++;
    notifyListeners();
  }
  void m_age(){
    age--;
    notifyListeners();
  }
  void a_weight(){
    weight++;
    notifyListeners();
  }
  void m_weight(){
    weight--;
    notifyListeners();
  }
  void height1(double value){
    height=value;
    notifyListeners();
  }
  void refresh(){
    age=10;
    weight=10;
    height=50;
    male = false;
    female = false;
    notifyListeners();
  }
  void male_icon(){
    male = true;
    female = false;
    notifyListeners();
  }
  void female_icon(){
    female = true;
    male = false;
    notifyListeners();
  }

  void bmi_call(){
    double heightm=height/100;
    bmi=(weight/(heightm*heightm));
  }



  String? getResult() {
    if (bmi > 25) {
      msg1= 'Overweight';
    } else if (bmi > 18.5) {
      msg1= 'Normal';
    } else if(bmi<18.5){
      msg1= 'Underweight';
    }
    return msg1;
  }

  String? getInterpretation() {
    if (bmi >= 25) {
      msg2= 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi >= 18.5) {
      msg2= 'You have a normal body weight. Good job!';
    } else {
      msg2= 'You have a lower than normal body weight. You can eat a bit more.';
    }
    return msg2;
  }

}


class datamodel{
  int? age;
  int? weight;
  double? height;

  datamodel(this.age, this.weight, this.height);
}