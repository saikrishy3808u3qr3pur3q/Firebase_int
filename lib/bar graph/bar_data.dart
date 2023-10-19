import 'individual_bar.dart';
class BarData{
   double sunAmount=0;
   double monAmount=0;
   double tueAmount=0;
   double wedAmount=0;
   double thurAmount=0;
   double friAmount=0;
   double satAmount=0;
  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,});
  List <Individualbar> barData =[];
  void intializeBarData(){
    barData=[
      Individualbar(x: 0, y: sunAmount),
      Individualbar(x: 1, y: monAmount),
      Individualbar(x: 2, y: tueAmount),
      Individualbar(x: 3, y: wedAmount),
      Individualbar(x: 4, y: thurAmount),
      Individualbar(x: 5, y: friAmount),
      Individualbar(x: 6, y: satAmount),
    ];
  }
}