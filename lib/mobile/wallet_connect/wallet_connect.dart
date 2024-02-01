library wallet_connect_provider;

import 'dart:core';

/// Provider for Wallet Connect connection, typically used in mobile phone connection.
class WalletConnectProvider {
  /// Instantiate [WalletConnectProvider] using [infuraId].
  ///
  /// ---
  ///
  /// ```dart
  /// final wc = WalletConnectProvider.fromInfura('https://foo.infura.io/v3/barbaz');
  ///
  /// await wc.connect();
  ///
  /// print(wc); // WalletConnectProvider: connected to https://foo.infura.io/v3/barbaz with [0xfooBar]
  /// print(wc.connected); // true
  /// print(wc.walletMeta); // WalletMeta: Trust Wallet on https://trustwallet.com
  /// ```
  factory WalletConnectProvider.fromInfura(
    String infuraId, {
    String? network,
    String? bridge,
    bool? qrCode,
    int? chainId,
    int? networkId,
    List<String>? mobileLinks,
  }) => throw UnimplementedError();

  /// Instantiate [WalletConnectProvider] using [rpc].
  ///
  /// ---
  ///
  /// ```dart
  /// final wc = WalletConnectProvider.fromRpc(
  ///   {56: 'https://bsc-dataseed.binance.org/'},
  ///   chainId: 56,
  ///   network: 'binance',
  /// );
  ///
  /// await wc.connect();
  ///
  /// print(wc); // WalletConnectProvider: connected to https://bsc-dataseed.binance.org/ (56) with [0xfooBar]
  /// print(wc.connected); // true
  /// print(wc.walletMeta); // WalletMeta: Trust Wallet on https://trustwallet.com
  /// ```
  factory WalletConnectProvider.fromRpc(
    Map<int, String> rpc, {
    String? network,
    String? bridge,
    bool? qrCode,
    required int chainId,
    int? networkId,
    List<String>? mobileLinks,
  }) {
    throw UnimplementedError();
  }

  const WalletConnectProvider();

  /// Accounts which is at provider disposal.
  List<String> get accounts => [];

  /// Main network chain id.
  String get chainId => "";

  /// `true` if [this] is connected successfully to rpc provider.
  bool get connected => false;

  /// `true` if [this] is connecting successfully to rpc provider.
  bool get isConnecting => false;

  /// Chain id and rpc url map.
  Map<int, String> get rpc => {};

  /// Main network rpc url.
  String get rpcUrl => "";

  /// Connected wallet metadata, contains serveral information about connected provider.
  WalletMeta get walletMeta => WalletMeta();

  /// Enable session and try to connect to provider. (triggers QR Code modal)
  ///
  /// ---
  ///
  /// ```dart
  /// await wc.connect();
  ///
  /// print(wc.connected); // true
  /// ```
  Future<void> connect() => throw UnimplementedError();

  /// Close provider session.
  Future<void> disconnect() => throw UnimplementedError();

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
  onConnect(void Function() listener) => throw UnimplementedError();

  /// Add a [listener] to be triggered for each disconnect event.
  ///
  /// This event is emitted if it becomes unable to submit RPC requests to any chain. In general, this will only happen due to network connectivity issues or some unforeseen error.
  ///
  /// Once disconnect has been emitted, the provider will not accept any new requests until the connection to the chain has been re-restablished, which requires reloading the page. You can also use the [Ethereum.isConnected] method to determine if the provider is disconnected.
  onDisconnect(void Function(int code, String reason) listener) => throw UnimplementedError();

  /// Add a [listener] to be triggered for each message event [type].
  ///
  /// The MetaMask provider emits this event when it receives some message that the consumer should be notified of. The kind of message is identified by the type string.
  ///
  /// RPC subscription updates are a common use case for the message event. For example, if you create a subscription using `eth_subscribe`, each subscription update will be emitted as a message event with a type of `eth_subscription`.
  onMessage(void Function(String type, dynamic data) listener) => throw UnimplementedError();

  /// Remove all the listeners for the [eventName] events. If no [eventName] is provided, all events are removed.
  removeAllListeners([String? eventName]) => throw UnimplementedError();

  /// Use request to submit RPC requests with [method] and optionally [params] to Ethereum via Wallet Connect.
  ///
  /// Returns a Future of generic type that resolves to the result of the RPC method call.
  Future<T> request<T>(String method, [dynamic params]) async {
    throw UnimplementedError();
  }

  @override
  String toString() => connected
      ? 'WalletConnectProvider: connected to $rpcUrl ($chainId) with $accounts'
      : 'WalletConnectProvider: not connected to $rpcUrl($chainId)';

  /// Instantiate [WalletConnectProvider] object with `Binance Mainnet` rpc and QR code enabled, ready to connect.
  static WalletConnectProvider binance() => WalletConnectProvider.fromRpc(
        {56: 'https://bsc-dataseed.binance.org/'},
        chainId: 56,
        network: 'binance',
      );

  /// Instantiate [WalletConnectProvider] object with `Harmony Mainnet` rpc and QR code enabled, ready to connect.
  static WalletConnectProvider harmony() => WalletConnectProvider.fromRpc(
        {1666600000: 'https://api.harmony.one'},
        chainId: 1666600000,
        network: 'harmony',
      );

  /// Instantiate [WalletConnectProvider] object with `Polygon Mainnet` rpc and QR code enabled, ready to connect.
  static WalletConnectProvider polygon() => WalletConnectProvider.fromRpc(
        {137: 'https://polygon-rpc.com/'},
        chainId: 137,
        network: 'polygon',
      );

  /// Instantiate [WalletConnectProvider] object with `xDai` rpc and QR code enabled, ready to connect.
  static WalletConnectProvider xDai() => WalletConnectProvider.fromRpc(
        {100: 'https://rpc.xdaichain.com/'},
        chainId: 100,
        network: 'xdai',
      );
}

/// Metadata information of specific wallet provider.
class WalletMeta {
  const WalletMeta();

  /// Description of wallet.
  String get description => "";

  /// List wallet's icons.
  List<String> get icons => [];

  /// Full name of wallet.
  String get name => "";

  /// Url of wallet.
  String get url => "";

  @override
  String toString() => 'WalletMeta: $name on $url';
}
