// import 'dart:js' as js;
// import 'package:js/js.dart';

// import '../../Utils/Constant.dart';

// void main() {
//   // Example TronWeb usage
//   callTronWebFunction();
// }

// @JS()
// external dynamic tronWebFunction(String functionName, List<dynamic> arguments);

// void callTronWebFunction() {
//   js.context['tronWebFunction'] = allowInterop(tronWebFunction);

//   // Replace 'your_wallet_address' with the actual wallet address
//   String walletAddress = ConstantClass.myTRXaddress;

//   // Call TronWeb function to get balance
//   tronWebFunction('getBalance', [walletAddress]).then((balance) {
//     print(" Balance"+balance.toString());
//   }).catchError((error) {
//     print( "Error"+error.toString());
//   });
// }
