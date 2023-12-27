// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../Utils/Constant.dart';

class Token_Item {
  final int networkindex;
  final String coinname;
  final String coinimage;
  double balance;
  double rate;
  final String cntrctAddress;

  Token_Item(
      {required this.networkindex,
      required this.coinimage,
      required this.coinname,
      required this.balance,
      required this.rate,
      required this.cntrctAddress});

  static List<Token_Item> Bsclist = [
    Token_Item(
        networkindex: 0,
        coinimage: 'assets/images/bnb.png',
        coinname: 'Binance',
        balance: 0.1,
        rate: 0.0,
        cntrctAddress: ""),
    Token_Item(
        networkindex: 1,
        coinimage: 'assets/images/usdt.png',
        coinname: 'USD',
        balance: 0.0,
        cntrctAddress: "",
        rate: 0.0),
    Token_Item(
        networkindex: 2,
        coinimage: 'assets/images/ethlogo.png',
        coinname: 'ETH ',
        balance: 0.0,
        cntrctAddress: "",
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

  static List<Token_Item> Tronlist = [
    Token_Item(
        networkindex: 0,
        coinimage: 'assets/images/tron.png',
        coinname: 'Tron',
        balance: 0.1,
        cntrctAddress: "",
        rate: 0.0),
    Token_Item(
        networkindex: 1,
        coinimage: 'assets/images/usdt.png',
        coinname: 'USDT',
        cntrctAddress: "TG3XXyExBkPp9nzdajDZsozEu4BkaSJozs",
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




class Token_Transaction {

final int networkindex;
  final String coinname;
  final double coinSymbol;
final bool? isSend;

  Token_Transaction({
    required this.networkindex,
    required this.coinname,
    required this.coinSymbol,
 this.isSend,
  });










  Token_Transaction copyWith({
    int? networkindex,
    String? coinname,
    double? coinSymbol,
    bool? isSend,
  }) {
    return Token_Transaction(
      networkindex: networkindex ?? this.networkindex,
      coinname: coinname ?? this.coinname,
      coinSymbol: coinSymbol ?? this.coinSymbol,
      isSend: isSend ?? this.isSend,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'networkindex': networkindex,
      'coinname': coinname,
      'coinSymbol': coinSymbol,
      'isSend': isSend,
    };
  }

  factory Token_Transaction.fromMap(Map<String, dynamic> map) {
    return Token_Transaction(
      networkindex: map['networkindex'] as int,
      coinname: map['coinname'] as String,
      coinSymbol: map['coinSymbol'] as double,
      isSend: map['isSend'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Token_Transaction.fromJson(String source) => Token_Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Token_Transaction(networkindex: $networkindex, coinname: $coinname, coinSymbol: $coinSymbol, isSend: $isSend)';
  }

  @override
  bool operator ==(covariant Token_Transaction other) {
    if (identical(this, other)) return true;
  
    return 
      other.networkindex == networkindex &&
      other.coinname == coinname &&
      other.coinSymbol == coinSymbol &&
      other.isSend == isSend;
  }

  @override
  int get hashCode {
    return networkindex.hashCode ^
      coinname.hashCode ^
      coinSymbol.hashCode ^
      isSend.hashCode;
  }
}
