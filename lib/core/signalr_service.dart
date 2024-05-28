// import 'package:signalr_netcore2/signalr_client.dart';
// import 'package:logging/logging.dart';

// class SignalRService {
//   // SignalR connection
//   late HubConnection _hubConnection;
//   late HubConnection _marketConnection;
//   late HubConnection _depthConnection;
//   late HubConnection _summaryConnection;
//   late HubConnection _tradesConnection;
//   static const baseUrl = "http://164.160.104.175:7070";
//   // Constructor
//   SignalRService() {
//     // _hubConnection =
//     //     HubConnectionBuilder().withUrl('https://your-signalr-url').build();
//   }

//   // Method to start the SignalR connection
//   Future<void> startConnection() async {
//     await _hubConnection.start();
//   }

//   Future<void> closeConnection() async {
//     await _hubConnection.stop();
//   }

//   // Method to send a SignalR message
//   Future<void> sendMessage(String message) async {
//     await _hubConnection.invoke('SendMessage', args: [message]);
//   }

//   Future<void> initTradesSignalr(Function(dynamic) callback) async {
//     final httpOptions = new HttpConnectionOptions(requestTimeout: 10000);
//     final transportProtLogger = Logger("SignalR - transport");

//     _tradesConnection = new HubConnectionBuilder().withUrl(baseUrl + '/tradesHub', options: httpOptions).configureLogging(transportProtLogger).withAutomaticReconnect().build();

//     _tradesConnection.on("sendTrades", callback);

//     await _tradesConnection.start();
//   }

//   Future<void> initMarketDepth(symbol, Function(dynamic) callback) async {
//     final httpOptions = new HttpConnectionOptions(requestTimeout: 10000);
//     final transportProtLogger = Logger("SignalR - transport");

//     _depthConnection = new HubConnectionBuilder().withUrl(baseUrl + '/bidsAsksHub', options: httpOptions).configureLogging(transportProtLogger).withAutomaticReconnect().build();

//     _depthConnection.on("sendBidsAsksForSymbol", callback);

//     await _depthConnection.start()!.then((value) => {
//           _depthConnection.invoke("JoinGroup", args: <Object>[symbol])
//         });
//     // _hubConnection.invoke("JoinGroup", args: <Object>[widget.symbolCode])
//   }

//   Future<void> initMarketWatchSignalr(Function(dynamic) callback) async {
//     final httpOptions = new HttpConnectionOptions(requestTimeout: 10000);
//     final transportProtLogger = Logger("SignalR - transport");

//     _marketConnection = new HubConnectionBuilder().withUrl(baseUrl + '/marketwatchHub', options: httpOptions).configureLogging(transportProtLogger).withAutomaticReconnect().build();

//     _marketConnection.on("sendMarketFeed", callback);

//     await _marketConnection.start();
//   }

//   Future<void> initMarketSummarySignalr(Function(dynamic) callback) async {
//     final httpOptions = new HttpConnectionOptions(requestTimeout: 10000);
//     final transportProtLogger = Logger("SignalR - transport");

//     _summaryConnection = new HubConnectionBuilder().withUrl(baseUrl + '/marketwatchHub', options: httpOptions).configureLogging(transportProtLogger).withAutomaticReconnect().build();

//     _summaryConnection.on("SendMarketSummary", callback);

//     await _summaryConnection.start();
//   }

//   Future<void> stockLiveData(String symbolCode, void Function(dynamic) callback) async {
//     final httpOptions = new HttpConnectionOptions(requestTimeout: 10000);
//     final transportProtLogger = Logger("SignalR - transport");

//     _hubConnection = HubConnectionBuilder().withUrl('${baseUrl}/FeedMobileHub', options: httpOptions).configureLogging(transportProtLogger).withAutomaticReconnect().build();
//     // the callback should be a function take a param.
//     _hubConnection.on("SendMarketFeed", callback);
//     await _hubConnection.start()!.then((value) => {
//           _hubConnection.invoke("JoinGroup", args: <Object>[symbolCode])
//         });
//   }

//   // Method to listen for SignalR updates
//   void listenForUpdates(Function(dynamic) callback) {
//     _hubConnection.on('ReceiveMessage', callback);
//   }

//   Future<void> stopMwConnection() async {
//     await _marketConnection.stop();
//   }

//   Future<void> stopSummaryConnection() async {
//     await _summaryConnection.stop();
//   }

//   Future<void> stopTradesConnection() async {
//     await _tradesConnection.stop();
//   }
// }
