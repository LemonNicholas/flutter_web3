library ethereum;

/// Getter for default Ethereum object, cycles through available injector in environment.
Ethereum? get ethereum => Ethereum.provider;

/// Interface for connection info used by [Ethereum] method.
class ConnectInfo {
  /// Chain id in hex that is currently connected to.
  external String get chainId;
}

/// Parameter for specifying currency, used in [Ethereum.walletAddChain].
class CurrencyParams {
  /// Instantiate [CurrencyParams] by using [name], [symbol], and [decimals].
  ///
  /// ---
  ///
  /// ```dart
  /// // Instantiate new `CurrencyParams` object.
  /// final currency = CurrencyParams(
  ///   name: 'Binance Coin',
  ///   symbol: 'BNB',
  ///   decimals: 18,
  /// );
  /// ```
  factory CurrencyParams({
    required String name,
    required String symbol,
    required int decimals,
  }) =>
      CurrencyParams(name: name, symbol: symbol, decimals: decimals);

  int get decimals => decimals;

  String get name => name;

  String get symbol => symbol;
}

/// A Dart Ethereum Provider API for consistency across clients and applications.
class Ethereum {
  /// Ethereeum provider api used in Binance Chain Wallet.
  static Ethereum get binanceChain => Ethereum();

  /// Modern Ethereum provider api, injected by many famous environment such as `MetaMask` or `TrustWallet`.
  static Ethereum get ethereum => Ethereum();

  /// Getter for boolean to detect Ethereum object support. without calling itself to prevent js undefined error.
  static bool get isSupported => false;

  /// Getter for default Ethereum provider object, cycles through available injector in environment.
  static Ethereum? get provider => null;

  /// Old web3 object, deprecated now.
  @deprecated
  static Ethereum? get web3 => null;

  set autoRefreshOnNetworkChange(bool b) => throw UnimplementedError();

  /// Returns a hexadecimal string representing the current chain ID.
  ///
  /// Deprecated, Consider using [getChainId] instead.
  @deprecated
  String get chainId => "";

  /// Returns first [getAccounts] item but may return unexpected value.
  ///
  /// Deprecated, Consider using [getAccounts] instead.
  @deprecated
  String? get selectedAddress => null;

  /// Returns List of accounts the node controls.
  Future<List<String>> getAccounts() async => throw UnimplementedError();


  /// Returns chain id in [int]
  ///
  /// ---
  ///
  /// ```dart
  /// String? currentAddress;
  /// int? currentChain;
  ///
  /// connectProvider() async {
  ///   if (ethereum != null) {
  ///     final accs = await ethereum!.requestAccount();
  ///
  ///     if (accs.isNotEmpty) {
  ///       currentAddress = accs.first;
  ///       currentChain = await ethereum!.getChainId();
  ///     }
  ///   }
  /// }
  /// ```
  Future<int> getChainId() async => throw UnimplementedError();

  /// Returns `true` if the provider is connected to the current chain, and `false` otherwise.
  ///
  /// Note that this method has nothing to do with the user's accounts.
  ///
  /// You may often encounter the word `connected` in reference to whether a web3 site can access the user's accounts. In the provider interface, however, `connected` and `disconnected` refer to whether the provider can make RPC requests to the current chain.
  ///
  /// ---
  ///
  /// ```dart
  /// // To check if provider is connected to current chain
  /// ethereum!.isConnected() // true
  ///
  /// // To check if provider is connected to current chain and connected to user accounts i.e. ready to use
  /// ethereum!.isConnected() && (await getAccounts()).isNotEmpty; // true
  /// ```
  bool isConnected() => false;

  /// Returns the number of listeners for the [eventName] events. If no [eventName] is provided, the total number of listeners is returned.
  int listenerCount([String? eventName]) => throw UnimplementedError();

  /// Returns the list of Listeners for the [eventName] events.
  List listeners(String eventName) => throw UnimplementedError();

  /// Remove a [listener] for the [eventName] event. If no [listener] is provided, all listeners for [eventName] are removed.
  off(String eventName, [Function? listener]) => throw UnimplementedError();

  /// Add a [listener] to be triggered for each [eventName] event.
  on(String eventName, Function listener) => throw UnimplementedError();

  /// Add a [listener] to be triggered for each accountsChanged event.
  onAccountsChanged(void Function(List<String> accounts) listener) => throw UnimplementedError();

  /// Add a [listener] to be triggered for only the next [eventName] event, at which time it will be removed.
  once(String eventName, Function listener) => throw UnimplementedError();

  /// Add a [listener] to be triggered for each chainChanged event.
  onChainChanged(void Function(int chainId) listener) => throw UnimplementedError();

  /// Add a [listener] to be triggered for each connect event.
  ///
  /// This event is emitted when it first becomes able to submit RPC requests to a chain.
  ///
  /// We recommend using a connect event handler and the [Ethereum.isConnected] method in order to determine when/if the provider is connected.
  onConnect(void Function(ConnectInfo connectInfo) listener) => throw UnimplementedError();

  /// Add a [listener] to be triggered for each disconnect event.
  ///
  /// This event is emitted if it becomes unable to submit RPC requests to any chain. In general, this will only happen due to network connectivity issues or some unforeseen error.
  ///
  /// Once disconnect has been emitted, the provider will not accept any new requests until the connection to the chain has been re-restablished, which requires reloading the page. You can also use the [Ethereum.isConnected] method to determine if the provider is disconnected.
  onDisconnect(void Function(ProviderRpcError error) listener) => throw UnimplementedError();

  /// Add a [listener] to be triggered for each message event [type].
  ///
  /// The MetaMask provider emits this event when it receives some message that the consumer should be notified of. The kind of message is identified by the type string.
  ///
  /// RPC subscription updates are a common use case for the message event. For example, if you create a subscription using `eth_subscribe`, each subscription update will be emitted as a message event with a type of `eth_subscription`.
  onMessage(void Function(String type, dynamic data) listener) =>  throw UnimplementedError();

  /// Remove all the listeners for the [eventName] events. If no [eventName] is provided, all events are removed.
  removeAllListeners([String? eventName]) => throw UnimplementedError();

  /// Use request to submit RPC requests with [method] and optionally [params] to Ethereum via MetaMask or provider that is currently using.
  ///
  /// Returns a Future of generic type that resolves to the result of the RPC method call.
  Future<T> request<T>(String method, [dynamic params]) async {
    throw UnimplementedError();
  }

  /// Request/Enable the accounts from the current environment.
  ///
  /// Returns List of accounts the node controls.
  ///
  /// This method will only work if you’re using the injected provider from a application like Metamask, Status or TrustWallet.
  ///
  /// It doesn’t work if you’re connected to a node with a default Web3.js provider (WebsocketProvider, HttpProvidder and IpcProvider).
  ///
  /// ---
  ///
  /// ```dart
  /// String? currentAddress;
  /// int? currentChain;
  ///
  /// // Handle `requestAccount` and store accounts and chain information
  /// connectProvider() async {
  ///   if (ethereum != null) {
  ///     final accs = await ethereum!.requestAccount();
  ///
  ///     if (accs.isNotEmpty) {
  ///       currentAddress = accs.first;
  ///       currentChain = await ethereum!.getChainId();
  ///     }
  ///   }
  /// }
  /// ```
  Future<List<String>> requestAccount() async => throw UnimplementedError();

  @override
  String toString() => "Ethereum: provider not supported";

  /// Creates a confirmation asking the user to add the specified chain with [chainId], [chainName], [nativeCurrency], and [rpcUrls] to MetaMask.
  ///
  /// The user may choose to switch to the chain once it has been added.
  ///
  /// As with any method that causes a confirmation to appear, `wallet_addEthereumChain` should only be called as a result of direct user action, such as the click of a button.
  ///
  /// ---
  ///
  /// ```dart
  /// // Add chain 97
  /// await ethereum!.walletAddChain(
  ///   chainId: 97,
  ///   chainName: 'Binance Testnet',
  ///   nativeCurrency: CurrencyParams(name: 'BNB', symbol: 'BNB', decimals: 18),
  ///   rpcUrls: ['https://data-seed-prebsc-1-s1.binance.org:8545/'],
  /// );
  /// ```
  Future<void> walletAddChain({
    required int chainId,
    required String chainName,
    required CurrencyParams nativeCurrency,
    required List<String> rpcUrls,
    List<String>? blockExplorerUrls,
  }) => throw UnimplementedError();

  /// Creates a confirmation asking the user to switch to the chain with the specified [chainId].
  ///
  /// If the specified chain ID has not been added, [unrecognizedChainHandler] will be called if not `null`.
  /// Else will throw [EthereumUnrecognizedChainException].
  ///
  /// As with any method that causes a confirmation to appear, `wallet_switchEthereumChain` should only be called as a result of direct user action, such as the click of a button.
  ///
  /// MetaMask will automatically reject the request under the following circumstances:
  /// - If the chain ID is malformed
  /// - If the chain with the specified chain ID has not been added to MetaMask
  ///
  /// ---
  ///
  /// // Switch to chain 97 and add the chain when unrecognized
  /// ```dart
  /// await ethereum!.walletSwitchChain(97, () async {
  ///   await ethereum!.walletAddChain(
  ///     chainId: 97,
  ///     chainName: 'Binance Testnet',
  ///     nativeCurrency:
  ///         CurrencyParams(name: 'BNB', symbol: 'BNB', decimals: 18),
  ///     rpcUrls: ['https://data-seed-prebsc-1-s1.binance.org:8545/'],
  ///   );
  /// });
  ///
  /// // Or catch `EthereumUnrecognizedChainException`
  /// try {
  ///   await ethereum!.walletSwitchChain(97);
  /// } on EthereumUnrecognizedChainException {
  ///   await ethereum!.walletAddChain(
  ///     chainId: 97,
  ///     chainName: 'Binance Testnet',
  ///     nativeCurrency:
  ///         CurrencyParams(name: 'BNB', symbol: 'BNB', decimals: 18),
  ///     rpcUrls: ['https://data-seed-prebsc-1-s1.binance.org:8545/'],
  ///   );
  /// }
  /// ```
  Future<void> walletSwitchChain(int chainId,
      [void Function()? unrecognizedChainHandler]) async {
    throw UnimplementedError();
  }

  /// Requests that the user tracks the token with [address], [symbol], and [decimals] in MetaMask, [decimals] is optional.
  ///
  /// Returns `true` if token is successfully added.
  ///
  /// Ethereum protocal only support [type] that is `ERC20` for now.
  ///
  /// Most Ethereum wallets support some set of tokens, usually from a centrally curated registry of tokens. `wallet_watchAsset` enables web3 application developers to ask their users to track tokens in their wallets, at runtime. Once added, the token is indistinguishable from those added via legacy methods, such as a centralized registry.
  ///
  /// ---
  ///
  /// ```dart
  /// // Watch BUSD Token
  /// await ethereum!.walletWatchAssets(
  ///   address: '0xed24fc36d5ee211ea25a80239fb8c4cfd80f12ee',
  ///   symbol: 'BUSD',
  ///   decimals: 18,
  /// );
  /// ```
  Future<bool> walletWatchAssets({
    required String address,
    required String symbol,
    required int decimals,
    String? image,
    String type = 'ERC20',
  }) => throw UnimplementedError();
}

/// Interface for provier message used by [Ethereum] method.
class ProviderMessage {
  /// The data of the message.
  external dynamic get data;

  /// The type of the message.
  ///
  /// If you create a subscription using `eth_subscribe`, each subscription update will be emitted as a message event with a type of `eth_subscription`.
  external String get type;
}

/// Interface for provier error used by [Ethereum] method.
class ProviderRpcError {
  external int get code;

  external dynamic get data;

  external String get message;
}
