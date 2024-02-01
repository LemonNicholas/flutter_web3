part of ethers;

/// A Contract is an abstraction of code that has been deployed to the blockchain.
///
/// A Contract may be sent transactions, which will trigger its code to be run with the input of the transaction data.
class Contract {
  /// Instantiate Contract object for invoking smart contract method.
  ///
  /// Use [Provider] in [providerOrSigner] for read-only contract calls, or use [Signer] for read-write contract calls.
  factory Contract(String address, dynamic abi, dynamic providerOrSigner) {
    throw UnimplementedError();
  }

  /// Instantiate [Contract] from [provider] for read-only contract calls.
  factory Contract.fromProvider(
          String address, dynamic abi, Provider provider) => throw UnimplementedError();

  /// Instantiate [Contract] from [provider] for read-write contract calls.
  factory Contract.fromSigner(String address, dynamic abi, Signer signer) => throw UnimplementedError();

  /// This is the address (or ENS name) the contract was constructed with.
  String get address => "";

  /// If the [Contract] object is the result of a `ContractFactory` deployment, this is the transaction which was used to deploy the contract.
  Future<TransactionResponse> get deployTransaction async => throw UnimplementedError();

  /// This is the ABI as an [Interface].
  Interface get interface => throw UnimplementedError();

  /// `true` if connected to [Provider], `false` if connected to [Signer].
  bool get isReadOnly => signer == null;

  /// If a [Provider] was provided to the constructor, this is that provider. If a [Signer] was provided that had a [Provider], this is that provider.
  Provider get provider => throw UnimplementedError();

  /// This is a Future that will resolve to the address [this] is attached to.
  ///
  /// If an Address was provided to the constructor, it will be equal to [this]. If an ENS name was provided, this will be the resolved address.
  Future<String> get resolvedAddress => _get<String>('resolvedAddress');

  /// If a [Signer] was provided to the constructor, this is that signer.
  Signer? get signer => throw UnimplementedError();

  /// Call read-only constant [method] with [args].
  ///
  /// A constant method is read-only and evaluates a small amount of EVM code against the current blockchain state and can be computed by asking a single node, which can return a result.
  ///
  /// It is therefore free and does not require any ether, but cannot make changes to the blockchain state.
  Future<T> call<T>(String method, [List<dynamic> args = const []]) =>
      _call<T>(method, args);

  ///Returns a new instance of the [Contract], but connected to [Provider] or [Signer].
  ///
  ///By passing in a [Provider], this will return a downgraded Contract which only has read-only access (i.e. constant calls).
  ///
  ///By passing in a [Signer]. this will return a Contract which will act on behalf of that signer.
  Contract connect(dynamic providerOrSigner) {
    throw UnimplementedError();
  }

  /// Returns the estimate units of gas that would be required to execute the `method` with `args` and `override`.
  ///
  /// The `override` are identical to the overrides above for read-only or write methods, depending on the type of call of `method`.
  Future<BigInt> estimateGas(String method,
          [List<dynamic> args = const [],
          TransactionOverride? override]) async => throw UnimplementedError();

  /// Return a filter for [eventName], optionally filtering by additional [args] constraints.
  ///
  /// Only indexed event parameters may be filtered. If a parameter is null (or not provided) then any value in that field matches.
  Filter getFilter(String eventName, [List<dynamic> args = const []]) => throw UnimplementedError();

  /// Returns the number of listeners for the [event]. If no [event] is provided, the total number of listeners is returned.
  int listenerCount([dynamic event]) => 0;

  /// Returns the list of Listeners for the [event].
  List listeners(Object event) => [];

  /// Multicall read-only constant [method] with [args]. `May not` be at the same block.
  ///
  /// If [eagerError] is `true`, returns the error immediately on the first error found.
  Future<List<T>> multicall<T>(String method, List<List<dynamic>> args,
          [bool eagerError = false]) => throw UnimplementedError();

  /// Remove a [listener] for the [event]. If no [listener] is provided, all listeners for [event] are removed.
  off(dynamic event, [Function? listener]) => throw UnimplementedError();

  /// Add a [listener] to be triggered for each [event].
  on(dynamic event, Function listener) => throw UnimplementedError();

  /// Add a [listener] to be triggered for only the next [event], at which time it will be removed.
  once(dynamic event, Function listener) => throw UnimplementedError();

  /// Return a List of [Log] that have been emitted by the Contract by the [filter]. Optinally constraint from [startBlock] to [endBlock].
  Future<List<Event>> queryFilter(EventFilter filter,
          [dynamic startBlock, dynamic endBlock]) async => throw UnimplementedError();

  /// Remove all the listeners for the [event]. If no [event] is provided, all events are removed.
  removeAllListeners([dynamic event]) => throw UnimplementedError();

  /// Send write [method] with [args], [override] may be include to send the Ether or adjust transaction options.
  ///
  /// This required the Contract object to be initalized with [Signer].
  ///
  /// A non-constant method requires a transaction to be signed and requires payment in the form of a fee to be paid to a miner.
  ///
  /// This transaction will be verified by every node on the entire network as well by the miner who will compute the new state of the blockchain after executing it against the current state.
  ///
  /// It cannot return a result. If a result is required, it should be logged using a Solidity event (or EVM log), which can then be queried from the transaction receipt.
  Future<TransactionResponse> send(String method,
          [List<dynamic> args = const [],
          TransactionOverride? override]) async =>throw UnimplementedError();

  @override
  String toString() =>
      'Contract: $address connected to ${isReadOnly ? 'provider' : 'signer'}';

  Future<T> _call<T>(String method, [List<dynamic> args = const []]) async {
    throw UnimplementedError();
  }

  Future<T> _get<T>(String method) async {
    throw UnimplementedError();
  }
}
