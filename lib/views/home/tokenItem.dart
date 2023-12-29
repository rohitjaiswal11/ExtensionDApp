// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../Utils/Constant.dart';

class Token_Item {
  final int networkindex;
  final String coinname;
  final String coinimage;
  double balance;
  double rate;
  final String contractAddress;
int coindecimal;
  Object? coinAbi;

  Token_Item({required this.coindecimal,
    required this.networkindex,
    required this.coinimage,
    required this.coinname,
    required this.balance,
    required this.rate,
    required this.contractAddress,
    this.coinAbi,
  });

  static List<Token_Item> Bsclist = [
    Token_Item(
      networkindex: 0,
      coinimage: 'assets/images/bnb.png',
      coinname: 'Binance',
      balance: 0.1,
      rate: 0.0,
      contractAddress: "",
      coinAbi: null,coindecimal: 18
    ),
    Token_Item(coindecimal: 6,
      networkindex: 1,
      coinimage: 'assets/images/usdt.png',
      coinname: 'USD',
      balance: 0.0,
      contractAddress: "",
      rate: 0.0,
      coinAbi: [
        {
          "inputs": [],
          "payable": false,
          "stateMutability": "nonpayable",
          "type": "constructor"
        },
        {
          "anonymous": false,
          "inputs": [
            {
              "indexed": true,
              "internalType": "address",
              "name": "owner",
              "type": "address"
            },
            {
              "indexed": true,
              "internalType": "address",
              "name": "spender",
              "type": "address"
            },
            {
              "indexed": false,
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            }
          ],
          "name": "Approval",
          "type": "event"
        },
        {
          "anonymous": false,
          "inputs": [
            {
              "indexed": true,
              "internalType": "address",
              "name": "previousOwner",
              "type": "address"
            },
            {
              "indexed": true,
              "internalType": "address",
              "name": "newOwner",
              "type": "address"
            }
          ],
          "name": "OwnershipTransferred",
          "type": "event"
        },
        {
          "anonymous": false,
          "inputs": [
            {
              "indexed": true,
              "internalType": "address",
              "name": "from",
              "type": "address"
            },
            {
              "indexed": true,
              "internalType": "address",
              "name": "to",
              "type": "address"
            },
            {
              "indexed": false,
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            }
          ],
          "name": "Transfer",
          "type": "event"
        },
        {
          "constant": true,
          "inputs": [],
          "name": "_decimals",
          "outputs": [
            {"internalType": "uint8", "name": "", "type": "uint8"}
          ],
          "payable": false,
          "stateMutability": "view",
          "type": "function"
        },
        {
          "constant": true,
          "inputs": [],
          "name": "_name",
          "outputs": [
            {"internalType": "string", "name": "", "type": "string"}
          ],
          "payable": false,
          "stateMutability": "view",
          "type": "function"
        },
        {
          "constant": true,
          "inputs": [],
          "name": "_symbol",
          "outputs": [
            {"internalType": "string", "name": "", "type": "string"}
          ],
          "payable": false,
          "stateMutability": "view",
          "type": "function"
        },
        {
          "constant": true,
          "inputs": [
            {"internalType": "address", "name": "owner", "type": "address"},
            {"internalType": "address", "name": "spender", "type": "address"}
          ],
          "name": "allowance",
          "outputs": [
            {"internalType": "uint256", "name": "", "type": "uint256"}
          ],
          "payable": false,
          "stateMutability": "view",
          "type": "function"
        },
        {
          "constant": false,
          "inputs": [
            {"internalType": "address", "name": "spender", "type": "address"},
            {"internalType": "uint256", "name": "amount", "type": "uint256"}
          ],
          "name": "approve",
          "outputs": [
            {"internalType": "bool", "name": "", "type": "bool"}
          ],
          "payable": false,
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "constant": true,
          "inputs": [
            {"internalType": "address", "name": "account", "type": "address"}
          ],
          "name": "balanceOf",
          "outputs": [
            {"internalType": "uint256", "name": "", "type": "uint256"}
          ],
          "payable": false,
          "stateMutability": "view",
          "type": "function"
        },
        {
          "constant": true,
          "inputs": [],
          "name": "decimals",
          "outputs": [
            {"internalType": "uint256", "name": "", "type": "uint256"}
          ],
          "payable": false,
          "stateMutability": "view",
          "type": "function"
        },
        {
          "constant": false,
          "inputs": [
            {"internalType": "address", "name": "spender", "type": "address"},
            {
              "internalType": "uint256",
              "name": "subtractedValue",
              "type": "uint256"
            }
          ],
          "name": "decreaseAllowance",
          "outputs": [
            {"internalType": "bool", "name": "", "type": "bool"}
          ],
          "payable": false,
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "constant": true,
          "inputs": [],
          "name": "getOwner",
          "outputs": [
            {"internalType": "address", "name": "", "type": "address"}
          ],
          "payable": false,
          "stateMutability": "view",
          "type": "function"
        },
        {
          "constant": false,
          "inputs": [
            {"internalType": "address", "name": "spender", "type": "address"},
            {"internalType": "uint256", "name": "addedValue", "type": "uint256"}
          ],
          "name": "increaseAllowance",
          "outputs": [
            {"internalType": "bool", "name": "", "type": "bool"}
          ],
          "payable": false,
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "constant": false,
          "inputs": [
            {"internalType": "uint256", "name": "amount", "type": "uint256"}
          ],
          "name": "mint",
          "outputs": [
            {"internalType": "bool", "name": "", "type": "bool"}
          ],
          "payable": false,
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "constant": true,
          "inputs": [],
          "name": "name",
          "outputs": [
            {"internalType": "string", "name": "", "type": "string"}
          ],
          "payable": false,
          "stateMutability": "view",
          "type": "function"
        },
        {
          "constant": true,
          "inputs": [],
          "name": "owner",
          "outputs": [
            {"internalType": "address", "name": "", "type": "address"}
          ],
          "payable": false,
          "stateMutability": "view",
          "type": "function"
        },
        {
          "constant": false,
          "inputs": [],
          "name": "renounceOwnership",
          "outputs": [],
          "payable": false,
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "constant": true,
          "inputs": [],
          "name": "symbol",
          "outputs": [
            {"internalType": "string", "name": "", "type": "string"}
          ],
          "payable": false,
          "stateMutability": "view",
          "type": "function"
        },
        {
          "constant": true,
          "inputs": [],
          "name": "totalSupply",
          "outputs": [
            {"internalType": "uint256", "name": "", "type": "uint256"}
          ],
          "payable": false,
          "stateMutability": "view",
          "type": "function"
        },
        {
          "constant": false,
          "inputs": [
            {"internalType": "address", "name": "recipient", "type": "address"},
            {"internalType": "uint256", "name": "amount", "type": "uint256"}
          ],
          "name": "transfer",
          "outputs": [
            {"internalType": "bool", "name": "", "type": "bool"}
          ],
          "payable": false,
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "constant": false,
          "inputs": [
            {"internalType": "address", "name": "sender", "type": "address"},
            {"internalType": "address", "name": "recipient", "type": "address"},
            {"internalType": "uint256", "name": "amount", "type": "uint256"}
          ],
          "name": "transferFrom",
          "outputs": [
            {"internalType": "bool", "name": "", "type": "bool"}
          ],
          "payable": false,
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "constant": false,
          "inputs": [
            {"internalType": "address", "name": "newOwner", "type": "address"}
          ],
          "name": "transferOwnership",
          "outputs": [],
          "payable": false,
          "stateMutability": "nonpayable",
          "type": "function"
        }
      ],
    ),
    Token_Item(
        networkindex: 2,
        coinimage: 'assets/images/ethlogo.png',
        coinname: 'ETH ',
        balance: 0.0,
        contractAddress: "",
        rate: 0.0,
        coinAbi: null,
        coindecimal: 6),
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
        contractAddress: "",
        rate: 0.0,coindecimal: 6,
        coinAbi: null),
    Token_Item(
      networkindex: 1,
      coinimage: 'assets/images/usdt.png',
      coinname: 'USDT',
      contractAddress: "TG3XXyExBkPp9nzdajDZsozEu4BkaSJozs",
      balance: 3.0,
      rate: 0.0,coindecimal: 6,
      coinAbi: [
        {
          "outputs": [
            {"type": "string"}
          ],
          "constant": true,
          "name": "name",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "inputs": [
            {"name": "_upgradedAddress", "type": "address"}
          ],
          "name": "deprecate",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "bool"}
          ],
          "inputs": [
            {"name": "_spender", "type": "address"},
            {"name": "_value", "type": "uint256"}
          ],
          "name": "approve",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "bool"}
          ],
          "constant": true,
          "name": "deprecated",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "inputs": [
            {"name": "_evilUser", "type": "address"}
          ],
          "name": "addBlackList",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "uint256"}
          ],
          "constant": true,
          "name": "totalSupply",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "bool"}
          ],
          "inputs": [
            {"name": "_from", "type": "address"},
            {"name": "_to", "type": "address"},
            {"name": "_value", "type": "uint256"}
          ],
          "name": "transferFrom",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "address"}
          ],
          "constant": true,
          "name": "upgradedAddress",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "uint8"}
          ],
          "constant": true,
          "name": "decimals",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "uint256"}
          ],
          "constant": true,
          "name": "maximumFee",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "uint256"}
          ],
          "constant": true,
          "name": "_totalSupply",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "name": "unpause",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "bool"}
          ],
          "constant": true,
          "inputs": [
            {"name": "_maker", "type": "address"}
          ],
          "name": "getBlackListStatus",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "bool"}
          ],
          "constant": true,
          "name": "paused",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "bool"}
          ],
          "inputs": [
            {"name": "_spender", "type": "address"},
            {"name": "_subtractedValue", "type": "uint256"}
          ],
          "name": "decreaseApproval",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "uint256"}
          ],
          "constant": true,
          "inputs": [
            {"name": "who", "type": "address"}
          ],
          "name": "balanceOf",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "uint256"}
          ],
          "constant": true,
          "inputs": [
            {"name": "_value", "type": "uint256"}
          ],
          "name": "calcFee",
          "stateMutability": "view",
          "type": "function"
        },
        {"name": "pause", "stateMutability": "nonpayable", "type": "function"},
        {
          "outputs": [
            {"type": "address"}
          ],
          "constant": true,
          "name": "owner",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "string"}
          ],
          "constant": true,
          "name": "symbol",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "bool"}
          ],
          "inputs": [
            {"name": "_to", "type": "address"},
            {"name": "_value", "type": "uint256"}
          ],
          "name": "transfer",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "uint256"}
          ],
          "constant": true,
          "inputs": [
            {"name": "who", "type": "address"}
          ],
          "name": "oldBalanceOf",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "inputs": [
            {"name": "newBasisPoints", "type": "uint256"},
            {"name": "newMaxFee", "type": "uint256"}
          ],
          "name": "setParams",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "inputs": [
            {"name": "amount", "type": "uint256"}
          ],
          "name": "issue",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "bool"}
          ],
          "inputs": [
            {"name": "_spender", "type": "address"},
            {"name": "_addedValue", "type": "uint256"}
          ],
          "name": "increaseApproval",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "inputs": [
            {"name": "amount", "type": "uint256"}
          ],
          "name": "redeem",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "outputs": [
            {"name": "remaining", "type": "uint256"}
          ],
          "constant": true,
          "inputs": [
            {"name": "_owner", "type": "address"},
            {"name": "_spender", "type": "address"}
          ],
          "name": "allowance",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "uint256"}
          ],
          "constant": true,
          "name": "basisPointsRate",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "bool"}
          ],
          "constant": true,
          "inputs": [
            {"type": "address"}
          ],
          "name": "isBlackListed",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "inputs": [
            {"name": "_clearedUser", "type": "address"}
          ],
          "name": "removeBlackList",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "outputs": [
            {"type": "uint256"}
          ],
          "constant": true,
          "name": "MAX_UINT",
          "stateMutability": "view",
          "type": "function"
        },
        {
          "inputs": [
            {"name": "newOwner", "type": "address"}
          ],
          "name": "transferOwnership",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "inputs": [
            {"name": "_blackListedUser", "type": "address"}
          ],
          "name": "destroyBlackFunds",
          "stateMutability": "nonpayable",
          "type": "function"
        },
        {
          "inputs": [
            {"name": "_initialSupply", "type": "uint256"},
            {"name": "_name", "type": "string"},
            {"name": "_symbol", "type": "string"},
            {"name": "_decimals", "type": "uint8"}
          ],
          "stateMutability": "Nonpayable",
          "type": "Constructor"
        },
        {
          "inputs": [
            {"indexed": true, "name": "_blackListedUser", "type": "address"},
            {"name": "_balance", "type": "uint256"}
          ],
          "name": "DestroyedBlackFunds",
          "type": "Event"
        },
        {
          "inputs": [
            {"name": "amount", "type": "uint256"}
          ],
          "name": "Issue",
          "type": "Event"
        },
        {
          "inputs": [
            {"name": "amount", "type": "uint256"}
          ],
          "name": "Redeem",
          "type": "Event"
        },
        {
          "inputs": [
            {"name": "newAddress", "type": "address"}
          ],
          "name": "Deprecate",
          "type": "Event"
        },
        {
          "inputs": [
            {"indexed": true, "name": "_user", "type": "address"}
          ],
          "name": "AddedBlackList",
          "type": "Event"
        },
        {
          "inputs": [
            {"indexed": true, "name": "_user", "type": "address"}
          ],
          "name": "RemovedBlackList",
          "type": "Event"
        },
        {
          "inputs": [
            {"name": "feeBasisPoints", "type": "uint256"},
            {"name": "maxFee", "type": "uint256"}
          ],
          "name": "Params",
          "type": "Event"
        },
        {"name": "Pause", "type": "Event"},
        {"name": "Unpause", "type": "Event"},
        {
          "inputs": [
            {"indexed": true, "name": "previousOwner", "type": "address"},
            {"indexed": true, "name": "newOwner", "type": "address"}
          ],
          "name": "OwnershipTransferred",
          "type": "Event"
        },
        {
          "inputs": [
            {"indexed": true, "name": "owner", "type": "address"},
            {"indexed": true, "name": "spender", "type": "address"},
            {"name": "value", "type": "uint256"}
          ],
          "name": "Approval",
          "type": "Event"
        },
        {
          "inputs": [
            {"indexed": true, "name": "from", "type": "address"},
            {"indexed": true, "name": "to", "type": "address"},
            {"name": "value", "type": "uint256"}
          ],
          "name": "Transfer",
          "type": "Event"
        }
      ],
    ),
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
  final int? networkindex;
  final String? coinname;
  final String? coinimage;
  double? balance;
  double? rate;
  final String? contractAddress;

  Object? coinAbi;

  final String? fromAddress;

  final String? toAddress;

  final String? coinSymbol;
  final double? value;
  final valUSD;

  Token_Transaction(
      {this.networkindex,
      this.coinimage,
      this.coinname,
      this.balance,
      this.contractAddress,
      this.coinAbi,
      this.fromAddress,
      this.toAddress,
      this.coinSymbol,
      this.value,
      this.valUSD});
  static List<Token_Transaction> TransactionBsc = [];
  static List<Token_Transaction> TransactionTRON = [];
}
