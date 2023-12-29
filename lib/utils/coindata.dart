import 'package:extensionapp/Utils/Constant.dart';

class CoinData {
  NetworkType coinNetwork;
  String coinID;
  String coinName;
  String coinImage;
  String web3HttpUrl;
  String? contractAddress;
  String coinSymbol;
  Object? coinAbi;
  int coindecimal;
  bool isOnGecko;
  bool? isCustom;
  double price;
  double coinPercentage;
  List<String>? swapPath;


  CoinData(
      {required this.coinNetwork,
      required this.coinID,
      required this.coinName,
      required this.coinImage,
      required this.web3HttpUrl,
      required this.contractAddress,
      required this.coinSymbol,
      required this.coinAbi,
      required this.coindecimal,
      required this.isOnGecko,
      this.isCustom,
      required this.price,
      required this.coinPercentage,
      this.swapPath,
      });
}


enum NetworkType {
  BSC,
  Tron,
  BSCTestnet,
  TronTestnet,
}

List<CoinData> data = [
  CoinData(
    coinNetwork: NetworkType.BSCTestnet,
    isOnGecko: true,
    web3HttpUrl: AppContant.Rpcurl,
    coinID: 'binancecoin',
    coinName: 'BNB',
    coinImage: "assets/images/bnb.png",
    coinSymbol: 'BNB',
    coindecimal: 18,
    price: 0.00,
    coinPercentage: 0.00,

    swapPath: [
      '0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd',
      '0xF9f93cF501BFaDB6494589Cb4b4C15dE49E85D0e',
    ],
    //   graphData: emptyGraphData,
    contractAddress: '',
    coinAbi: null,
  ),
  CoinData(
    coinNetwork: NetworkType.BSCTestnet,
    isOnGecko: true,
    web3HttpUrl: AppContant.Rpcurl,
    coinID: 'tether',
    coinName: 'Tether',
    coinImage: "assets/images/usdt.png",
    coinSymbol: 'USDT ',
    coindecimal: 18,
    price: 0.00,
    coinPercentage: 0.00,

    swapPath: [
      "0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3", //Route
      "0x337610d27c682E347C9cD60BD4b3b107C9d34dDd" //USDT
    ],
    //    graphData: emptyGraphData,
    contractAddress: '0x337610d27c682E347C9cD60BD4b3b107C9d34dDd',

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
  CoinData(
    coinNetwork: NetworkType.TronTestnet,
    isOnGecko: true,
    web3HttpUrl: AppContant.Rpcurl,
    coinID: 'tron',
    coinName: 'Tron',
    coinImage:"assets/images/tron.png" ,
    coinSymbol: 'TRX',
    coindecimal: 6,
    price: 0.00,
    coinPercentage: 0.00,
    
    swapPath: [
      '0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd',
      '0xF9f93cF501BFaDB6494589Cb4b4C15dE49E85D0e'
    ],
    //   graphData: emptyGraphData,
    contractAddress: '',
    coinAbi: null,
  ),
  CoinData(
    coinNetwork: NetworkType.TronTestnet,
    isOnGecko: true,
    web3HttpUrl: AppContant.Rpcurl,
    coinID: 'tether',
    coinName: 'USDT',
    coinImage: "assets/images/usdt.png",
    coinSymbol: 'USDT ',
    coindecimal: 6,
    price: 0.00,
    coinPercentage: 0.00,

    swapPath: [],
    //    graphData: emptyGraphData,
    contractAddress: 'TB5NSkyzxkzi3eHW87NwFE6TmtTmnZw61y',
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
      {"name": "unpause", "stateMutability": "nonpayable", "type": "function"},
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
];

