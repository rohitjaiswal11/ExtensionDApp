


import '../../Utils/Constant.dart';

class Token_Item {
  final int networkindex;
  final String coinname;
  final String coinimage;
  final double balance;
 double rate;

  Token_Item(
      {required this.networkindex,
      required this.coinimage,
      required this.coinname,
      required this.balance,
      required this.rate});

 static  List<Token_Item> Bsclist = [
    Token_Item(
        networkindex: 0,
        coinimage: 'assets/images/bnb.png',
        coinname: 'Binance',
        balance: 0.1,
        rate: 0.0),
    Token_Item(
        networkindex: 1,
        coinimage: 'assets/images/usdt.png',
        coinname: 'USD',
        balance: 0.0,
       // rate: 0.0
        rate: 0.0
        ),
    Token_Item(
        networkindex: 2,
        coinimage: 'assets/images/ethlogo.png',
        coinname: 'ETH ',
        balance: 0.0,
        rate: 0.0),
    // Token_Item(
    //     networkindex: 3,
    //     coinimage: 'assets/images/ethlogo.png',
    //     coinname: 'ETh',
    //     balance: 0.0,
    //     rate: 0.0),
    //         Token_Item(
    //     networkindex: 4,
    //     coinimage: 'assets/images/ethlogo.png',
    //     coinname: 'ETh ',
    //     balance: 0.0,
    //     rate: 0.0),
  ];





  static  List<Token_Item> Tronlist = [
     Token_Item(
        networkindex: 0,
        coinimage: 'assets/images/tron.png',
        coinname: 'Tron',
        balance: 0.1,
        rate: 0.0),
    Token_Item(
        networkindex: 1,
        coinimage: 'assets/images/usdt.png',
        coinname: 'USDT',
        balance: 3.0,
        rate: 0.0),
    // Token_Item(
    //     networkindex: 2,
    //     coinimage: 'assets/images/tron.png',
    //     coinname: 'Tron',
    //     balance: 0.0,
    //     rate: 0.0),
    // Token_Item(
    //     networkindex: 3,
    //     coinimage: 'assets/images/tron.png',
    //     coinname: 'Tron',
    //     balance: 0.0,
    //     rate: 0.0),
    //         Token_Item(
    //     networkindex: 4,
    //     coinimage: 'assets/images/tron.png',
    //     coinname: 'Tron',
    //     balance: 0.0,
    //     rate: 0.0),
  ];


}