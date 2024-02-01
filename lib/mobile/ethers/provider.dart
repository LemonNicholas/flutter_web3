part of ethers;

/// The JSON-RPC API is a popular method for interacting with Ethereum and is available in all major Ethereum node implementations (e.g. Geth and Parity) as well as many third-party web services (e.g. INFURA)
class JsonRpcProvider {
  final String _rpcUrl = "";

  /// Create new [JsonRpcProvider] from [rpcUrl].
  ///
  /// If [rpcUrl] is `null`, [JsonRpcProvider] will instantiate with default rpc, i.e. `http:/\/localhost:8545`.
  ///
  /// ---
  ///
  /// ```dart
  /// final localRpcProvider = JsonRpcProvider();
  /// final binanceRpcProvider = JsonRpcProvider('https://bsc-dataseed.binance.org/');
  ///
  /// print(localRpcProvider); // JsonRpcProvider: http://localhost:8545/
  /// print(binanceRpcProvider); // JsonRpcProvider: https://bsc-dataseed.binance.org/
  /// ```
  factory JsonRpcProvider([String? rpcUrl]) {
    throw UnimplementedError();
  }

  /// Rpc url that [this] is connected to.
  String get rpcUrl => _rpcUrl;

  /// Returns a list of all account addresses managed by [this] provider.
  Future<List<String>> listAccounts() async => throw UnimplementedError();

  @override
  String toString() => 'JsonRpcProvider: $rpcUrl';
}

/// A Provider is an abstraction of a connection to the Ethereum network, providing a concise, consistent interface to standard Ethereum node functionality.
///
/// The ethers.js library provides several options which should cover the vast majority of use-cases, but also includes the necessary functions and classes for sub-classing if a more custom configuration is necessary.
class Provider {
  /// Returns a Future which will stall until the [Network] has heen established, ignoring errors due to the target node not being active yet.
  ///
  /// This can be used for testing or attaching scripts to wait until the node is up and running smoothly.
  Future<Network> get ready async => throw UnimplementedError();

  /// Call Ethers provider [method] with [args].
  ///
  /// To return the result of excecuting transaction, use [Provider.rawCall] instead.
  Future<T> call<T>(String method, [List<dynamic> args = const []]) async {
    throw UnimplementedError();
  }

  /// Returns the balance of [address] as of the [blockTag].
  ///
  /// ---
  ///
  /// ```dart
  /// final balance = await getBalance('0xfooBar');
  ///
  /// print(balance); // 10000000000000
  /// print(balance is BigInt); // true
  /// ```
  Future<BigInt> getBalance(String address, [dynamic blockTag]) => call<BigInt>(
    'getBalance',
    blockTag != null ? [address, blockTag] : [address],
  );

  /// Get the [Block] from the network by [blockNumber], where the [Block.transactions] is a list of transaction hashes.
  ///
  /// ---
  ///
  /// ```dart
  /// final block = await provider!.getBlock(2000000);
  ///
  /// print(block);
  /// // Block: 2000000 0x9d2e2d20 mined at 2020-11-06T21:22:24.000 with diff 2
  /// print(block.transaction.first);
  /// // 0x99598d22288ba2ed229cf965a7e0279a8df3d61d48f779d2ce5e3ab84788c10c
  /// ```
  Future<Block> getBlock(int blockNumber) async => throw UnimplementedError();

  /// Returns the block number (or height) of the most recently mined block.
  Future<int> getBlockNumber() => call<int>('getBlockNumber');

  /// Get the [BlockWithTransaction] at [blockNumber] from the network, where the [BlockWithTransaction.transactions] is an Array of [TransactionResponse].
  ///
  /// ---
  ///
  /// ```dart
  /// final block = await provider!.getBlockWithTransaction(2000000);
  ///
  /// print(block);
  /// // Block: 2000000 0x9d2e2d20 mined at 2020-11-06T21:22:24.000 with diff 2
  /// print(block.transaction.first);
  /// // Transaction: 0x99598d22 from 0xC5D2A96c with value 39090000000000000000 and data 0x7ff36ab500000...
  /// print(block.transactions.first is TransactionResponse); // true
  /// ```
  Future<BlockWithTransaction> getBlockWithTransaction(int blockNumber) async => throw UnimplementedError();

  /// Returns the contract code of [address] as of the [blockTag] block height. If there is no contract currently deployed, the result is `0x`.
  Future<String> getCode(String address, [dynamic blockTag]) => call<String>(
      'getCode', blockTag == null ? [address] : [address, blockTag]);

  /// Returns the current recommended [FeeData] to use in a transaction.
  ///
  /// For an `EIP-1559` transaction, the [FeeData.maxFeePerGas] and [FeeData.maxPriorityFeePerGas] should be used.
  ///
  /// For legacy transactions and networks which do not support `EIP-1559`, the [FeeData.gasPrice] should be used.
  Future<FeeData> getFeeData() async =>  throw UnimplementedError();

  /// Returns the current gas price.
  Future<BigInt> getGasPrice() => call<BigInt>('getGasPrice');

  /// Get the lastest [Block] from the network.
  Future<Block> getLastestBlock() async =>  throw UnimplementedError();

  /// Get the lastest [BlockWithTransaction] from the network.
  Future<BlockWithTransaction> getLastestBlockWithTransaction() async => throw UnimplementedError();

  /// Returns the List of [Log] matching the [filter].
  ///
  /// Keep in mind that many backends will discard old events, and that requests which are too broad may get dropped as they require too many resources to execute the query.
  ///
  /// ---
  ///
  /// ```dart
  /// // Create new BUSD BEP20 Token filter for specific topics
  /// final filter = Filter(
  ///   address: '0xe9e7cea3dedca5984780bafc599bd69add087d56',
  ///   topics: [
  ///     '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef',
  ///     '0x0000000000000000000000002caa4694cb7daf7d49a198dc1103c06d4991ae52',
  ///   ],
  /// );
  ///
  /// // Query logs for specified filter
  /// final logs = await provider!.getLogs(filter);
  ///
  /// print(logs.length); // 8
  /// print(logs.first); // Log: 3 topics from 0x2ad2e409
  /// print(logs.first is Log); // true
  /// ```
  Future<List<Log>> getLogs(EventFilter filter) async =>throw UnimplementedError();

  /// Returns the [Network] that [this] is connected to.
  Future<Network> getNetwork() async => throw UnimplementedError();

  /// Returns the `Bytes32` value of the position [pos] at [address], as of the [blockTag].
  Future<String> getStorageAt(String address, int pos, [dynamic blockTag]) =>
      call<String>('getStorageAt',
          blockTag == null ? [address, pos] : [address, pos, blockTag]);

  /// Returns the [TransactionResponse] with [hash] or `null` if the transaction is unknown.
  ///
  /// If a transaction has not been mined, this method will search the transaction pool.
  ///
  /// Various backends may have more restrictive transaction pool access (e.g. if the gas price is too low or the transaction was only recently sent and not yet indexed) in which case this method may also return `null`.
  ///
  /// ---
  ///
  /// ```dart
  /// final transaction = await provider!.getTransaction(
  ///     '0x4e04def628cfd0c7786febaef8fbe832fc30eae54a4fba25bf46022c439ab39d');
  ///
  /// print(transaction); // Transaction: 0x4e04def6 from 0x1dFCD06a with value 0 and data 0x876cb21700000...
  /// print(transaction != null); // true
  /// print(transaction is TransactionResponse); // true
  /// ```
  Future<TransactionResponse?> getTransaction(String hash) async {
    throw UnimplementedError();
  }

  /// Returns the number of transactions [address] has ever sent, as of [blockTag].
  ///
  /// This value is required to be the nonce for the next transaction from address sent to the network.
  Future<int> getTransactionCount(String address, [dynamic blockTag]) =>
      call<int>(
        'getTransactionCount',
        blockTag != null ? [address, blockTag] : [address],
      );

  /// Returns the [TransactionReceipt] for [hash] or `null` if the transaction has not been mined.
  ///
  /// To stall until the transaction has been mined, consider the [waitForTransaction] method.
  ///
  /// ---
  ///
  /// ```dart
  /// final transaction = await provider!.getTransactionReceipt(
  ///     '0x4e04def628cfd0c7786febaef8fbe832fc30eae54a4fba25bf46022c439ab39d');
  ///
  /// print(transaction); // TransactionReceipt: 0x4e04def6 from 0x1dFCD06a with 618 confirmations and 8 logs
  /// print(transaction != null); // true
  /// print(transaction is TransactionReceipt); // true
  /// ```
  Future<TransactionReceipt?> getTransactionReceipt(String hash) async {
    throw UnimplementedError();
  }

  /// Performs a reverse lookup of the address in ENS using the Reverse Registrar. If the name does not exist, or the forward lookup does not match, `null` is returned.
  ///
  /// An ENS name requries additional configuration to setup a reverse record, they are not automatically set up.
  Future<String?> lookupAddress(String address) =>
      call<String?>('lookupAddress', [address]);

  /// Add a [listener] to be triggered for each [event].
  on(dynamic event, Function listener) {
    throw UnimplementedError();
  }

  /// Add a [listener] to be triggered for each new [Block];
  void onBlock(void Function(int blockNumber) listener) =>
      on('block', listener);

  /// Add a [listener] to be triggered once for [event].
  once(dynamic event, Function listener) {throw UnimplementedError();
  }

  /// Add a [listener] to be triggered once for new [Block];
  void onceBlock(void Function(int blockNumber) listener) =>
      on('block', listener);

  /// Add a [listener] to be triggered once for [filter];
  void onceFilter(EventFilter filter, Function listener) =>
      throw UnimplementedError();

  /// Add a [listener] to be triggered for [filter];
  void onFilter(EventFilter filter, Function listener) =>
      throw UnimplementedError();

  /// Returns the result of executing the transaction in raw hex string, using either [transactionRequest] or [transactionResponse].
  ///
  /// A call does not require any ether, but cannot change any state. This is useful for calling getters on Contracts.
  ///
  /// ---
  ///
  /// ```dart
  /// final supp = await provider!.rawCall(
  ///   transactionRequest: TransactionRequest(
  ///     to: '0xed24fc36d5ee211ea25a80239fb8c4cfd80f12ee', // Some random ERC20 contract
  ///     data: '0x18160ddd', // Function signature of totalSupply()
  ///   ),
  /// ); // 0x0000000000000000000000000000000000000000000d3c21bcecceda10000000
  ///
  /// BigInt.parse(supp); // 16000000000000000000000000
  /// ```
  Future<String> rawCall<String>({
    TransactionRequest? transactionRequest,
    TransactionResponse? transactionResponse,
    dynamic blockTag,
  }) {
    throw UnimplementedError();
  }

  /// Looks up the address of name. If the name is not owned, or does not have a Resolver configured, or the Resolver does not have an address configured, `null` is returned.
  Future<String?> resolveName(String name) =>
      call<String?>('resolveName', [name]);

  /// Submits transaction [data] to the network to be mined.
  ///
  /// The transaction must be signed, and be valid (i.e. the nonce is correct and the account has sufficient balance to pay for the transaction).
  ///
  /// ```dart
  /// await provider!.sendTransaction("0xf86e808502540be400825208948ba1f109551bd432803012645ac136ddd64dba72880de0b6b3a764000080820a96a0f0c5bcb11e5a16ab116c60a0e5837ae98ec36e7f217740076572e8183002edd2a01ed1b4411c2840b9793e8be5415a554507f1ea320069be6dcecabd7b9097dbd4");
  /// ```
  Future<TransactionResponse> sendTransaction(String data) async =>throw UnimplementedError();

  /// Returns a Future of [TransactionReceipt] which will not resolve until [transactionHash] is mined.
  ///
  /// If confirms is 0, this method is non-blocking and if the transaction has not been mined returns null.
  ///
  /// Otherwise, this method will block until the transaction has confirms blocks mined on top of the block in which is was mined.
  ///
  /// ---
  ///
  /// ```dart
  /// final transaction = await provider!.waitForTransaction('0x4e04def628cfd0c7786febaef8fbe832fc30eae54a4fba25bf46022c439ab39d');
  ///
  /// print(transaction); // TransactionReceipt: 0x4e04def6 from 0x1dFCD06a with 618 confirmations and 8 logs
  /// print(transaction is TransactionReceipt); // true
  /// ```
  Future<TransactionReceipt> waitForTransaction(
      String transactionHash, [
        int confirms = 1,
        Duration? timeout,
      ]) async =>throw UnimplementedError();
}

/// The Web3Provider is meant to ease moving from a web3.js based application to ethers by wrapping an existing Web3-compatible (such as a Web3HttpProvider, Web3IpcProvider or Web3WsProvider) and exposing it as an ethers.js Provider which can then be used with the rest of the library.
///
/// This may also be used to wrap a standard [EIP-1193 Provider](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-1193.md).
class Web3Provider{
  /// Create new [Web3Provider] instance from [provider] instance.
  ///
  /// ---
  ///
  /// ```dart
  /// final web3provider = Web3Provider(ethereum!);
  /// print(web3provider); // Web3Provider:
  /// ```
  factory Web3Provider(dynamic provider) {
    throw UnimplementedError();
  }

  /// Create new [Web3Provider] instance from [ethereum] instance.
  ///
  /// ---
  ///
  /// ```dart
  /// final web3provider = Web3Provider.fromEthereum(ethereum!);
  /// print(web3provider); // Web3Provider:
  /// ```
  factory Web3Provider.fromEthereum(Ethereum ethereum) => Web3Provider(null);

  /// Create new [Web3Provider] instance from [walletConnect] instance.
  ///
  /// ---
  ///
  /// ```dart
  /// Web3Provider? web3provider;
  ///
  /// final wc = WalletConnectProvider.binance();
  /// await wc.connect();
  ///
  /// if (wc.connected) web3provider = Web3Provider.fromWalletConnect(wc);
  ///
  /// print(web3provider); // Web3Provider:
  /// ```
  factory Web3Provider.fromWalletConnect(WalletConnectProvider walletConnect) => Web3Provider(null);

  /// Connect [this] to create [Signer] object.
  Signer getSigner() => throw UnimplementedError();

  @override
  String toString() => 'Web3Provider:';
}
