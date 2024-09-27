part of ethers;

/// A generic object to represent a transaction.
class Transaction{
  ///The chain ID for transaction. This is used as part of EIP-155 to prevent replay attacks on different networks.
  ///
  ///For example, if a transaction was made on ropsten with an account also used on homestead, it would be possible for a transaction signed on ropsten to be executed on homestead, which is likely unintended.
  ///
  ///There are situations where replay may be desired, however these are very rare and it is almost always recommended to specify the chain ID.
  int get chainId => 0;

  /// The data for transaction. In a contract this is the call data.
  String get data => "";

  /// The address transaction is from.
  String get from => "";

  /// The gas limit for transaction.
  ///
  /// An account must have enough ether to cover the gas (at the specified gasPrice).
  ///
  /// Any unused gas is refunded at the end of the transaction, and if there is insufficient gas to complete execution, the effects of the transaction are reverted, but the gas is fully consumed and an out-of-gas error occurs.
  BigInt get gasLimit => BigInt.zero;

  /// The price (in wei) per unit of gas for transaction.
  ///
  /// For `EIP-1559` transactions, this will be `null`.
  BigInt? get gasPrice => BigInt.zero;

  /// The transaction hash, which can be used as an identifier for transaction. This is the keccak256 of the serialized RLP encoded representation of transaction.
  String get hash => "";

  /// The maximum price (in wei) per unit of gas for transaction.
  ///
  /// For transactions that are not `EIP-1559` transactions, this will be `null`.
  BigInt? get maxFeePerGas =>BigInt.zero;

  /// The priority fee price (in wei) per unit of gas for transaction.
  ///
  /// For transactions that are not `EIP-1559` transactions, this will be `null`.
  BigInt? get maxPriorityFeePerGas => BigInt.zero;

  /// The nonce for transaction.
  ///
  /// Each transaction sent to the network from an account includes this, which ensures the order and non-replayability of a transaction.
  ///
  /// This must be equal to the current number of transactions ever sent to the network by the from address.
  int get nounce => 0;

  /// The r portion of the elliptic curve signatures for transaction.
  ///
  /// This is more accurately, the x coordinate of the point r (from which the y can be computed, along with v).
  String get r => "";

  /// The s portion of the elliptic curve signatures for transaction.
  String get s => "";

  /// The address transaction is to.
  String? get to => "";

  /// The v portion of the elliptic curve signatures for transaction.
  ///
  /// This is used to refine which of the two possible points a given x-coordinate can have, and in EIP-155 is additionally used to encode the chain ID into the serialized transaction.
  int get v => 0;

  /// The value (in wei) for transaction.
  BigInt get value => BigInt.zero;

  @override
  String toString() =>
      'Transaction: $hash from $from with value $value and data $data...';
}

class TransactionOverride {
  factory TransactionOverride({
    BigInt? gasLimit,
    BigInt? gasPrice,
    BigInt? value,
    BigInt? maxFeePerGas,
    BigInt? maxPriorityFeePerGas,
    int? nonce,
  }) {
    throw UnimplementedError();
  }

  /// The maximum amount of gas this transaction is permitted to use.
  BigInt? get gasLimit => BigInt.zero;

  /// The price (in wei) per unit of gas this transaction will pay.
  BigInt? get gasPrice => BigInt.zero;

  /// The maximum price (in wei) per unit of gas for transaction.
  BigInt? get maxFeePerGas => BigInt.zero;

  /// The priority fee price (in wei) per unit of gas for transaction.
  BigInt? get maxPriorityFeePerGas => BigInt.zero;

  /// The nonce for this transaction. This should be set to the number of transactions ever sent from this address.
  int? get nonce => 0;

  /// The amount (in wei) this transaction is sending.
  BigInt? get value => BigInt.zero;

  @override
  String toString() =>
      'TransactionOverride: value $value with gas limit $gasLimit and gas price $gasPrice';
}

class TransactionReceipt {

  /// The block hash of the block that this transaction was included in.
  String get blockHash => "";

  /// The block height (number) of the block that this transaction was included in.
  int get blockNumber => 0;

  /// This is true if the block is in a post-Byzantium Hard Fork block.
  bool get byzantium => false;

  /// The number of blocks that have been mined since this transaction, including the actual block it was mined in.
  int get confirmations => 0;

  /// If this transaction has a `null` to address, it is an init transaction used to deploy a contract,
  /// in which case this is the address created by that contract.
  String? get contractAddress => null;

  /// For the block this transaction was included in,
  /// this is the sum of the gas used by each transaction in the ordered list of transactions up to (and including) this transaction.
  ///
  /// This is generally of little interest to developers.
  BigInt get cumulativeGasUsed => BigInt.zero;

  /// The address this transaction is from.
  String get from => "";

  /// The amount of gas actually used by this transaction.
  BigInt get gasUsed => BigInt.zero;

  /// `true` if this transaction is a creating contract transaction.
  bool get isCreatingContract => to == null;

  /// All the logs emitted by this transaction.
  List<Log> get logs => throw UnimplementedError();

  ///A bloom-filter, which includes all the addresses and topics included in any log in this transaction.
  String get logsBloom => "";

  /// The intermediate state root of a receipt.
  ///
  /// Only transactions included in blocks before the Byzantium Hard Fork have this property, as it was replaced by the status property.
  ///
  /// The property is generally of little use to developers. At the time it could be used to verify a state transition with a fraud-proof only considering the single transaction; without it the full block must be considered.
  String? get root => null;

  /// The status of a transaction is `true` is successful or `false` if it was reverted.
  ///
  /// Only transactions included in blocks post-Byzantium Hard Fork have this property.
  bool get status => false;

  /// The address this transaction is to.
  ///
  /// This is `null` if the transaction was an init transaction, used to deploy a contract.
  String? get to => null;

  /// The hash of this transaction.
  String get transactionHash => "";

  /// The index of this transaction in the list of transactions included in the block this transaction was mined in.
  int get transactionIndex => 0;

  @override
  String toString() => status
      ? 'TransactionReceipt: $transactionHash from $from with $confirmations confirmations and ${logs.length} logs'
      : 'TransactionReceipt: $transactionHash reverted ';
}

/// A transaction request describes a transaction that is to be sent to the network or otherwise processed.
///
/// All fields are optional and may be a promise which resolves to the required type.
class TransactionRequest {
  factory TransactionRequest({
    String? to,
    String? from,
    BigInt? value,
    BigInt? gasLimit,
    BigInt? gasPrice,
    int? nounce,
    String? data,
    BigInt? maxFeePerGas,
    BigInt? maxPriorityFeePerGas,
    AccessList? accessList,
  }) {
    throw UnimplementedError();
  }

  /// The [AccessList] included in an EIP-2930 or EIP-1559 transaction.
  AccessList? get accessList => throw UnimplementedError();

  /// The transaction data.
  String? get data => null;

  /// The address (or ENS name) this transaction it from.
  String? get from => null;

  /// The maximum amount of gas this transaction is permitted to use.
  BigInt? get gasLimit =>BigInt.zero;

  /// The price (in wei) per unit of gas this transaction will pay.
  ///
  /// This may not be specified for transactions with type set to `1` or `2`, or if [maxFeePerGas] or [maxPriorityFeePerGas] is given.
  BigInt? get gasPrice => BigInt.zero;

  /// The maximum price (in wei) per unit of gas this transaction will pay for the `EIP-1559` base fee.
  ///
  /// Most developers should leave this unspecified and use the default value that ethers determines from the network.
  ///
  /// This may not be specified for transactions with type set to `0` or if [gasPrice] is specified.
  BigInt? get maxFeePerGas => BigInt.zero;

  /// The price (in wei) per unit of gas this transaction will pay for the `EIP-1559` priority fee. This is included in the [maxFeePerGas], so this will not affect the total maximum cost set with [maxFeePerGas].
  ///
  /// Most developers should leave this unspecified and use the default value that ethers determines from the network.
  ///
  /// This may not be specified for transactions with type set to `0` or if [gasPrice] is specified.
  BigInt? get maxPriorityFeePerGas => BigInt.zero;

  String? get method => "";

  /// The nonce for this transaction. This should be set to the number of transactions ever sent from this address.
  int? get nonce => 0;

  /// The address (or ENS name) this transaction it to.
  String? get to => "";

  /// The amount (in wei) this transaction is sending.
  BigInt? get value => BigInt.zero;

  @override
  String toString() =>
      'TransactionRequest: to $to with value $value and data $data';
}

/// A TransactionResponse includes all properties of a [Transaction] as well as several properties that are useful once it has been mined.
class TransactionResponse {
  /// The [AccessList] included in an EIP-2930 or EIP-1559 transaction.
  AccessList? get accessList => throw UnimplementedError();

  /// The hash of the block this transaction was mined in. If the block has not been mined, this is null.
  String? get blockHash => "";

  /// The number ("height") of the block this transaction was mined in. If the block has not been mined, this is null.
  int? get blockNumber => 0;

  /// The number of blocks that have been mined (including the initial block) since this transaction was mined.
  int get confirmations => 0;

  /// The serialized transaction.
  String? get raw => null;

  /// The timestamp of the block this transaction was mined in. If the block has not been mined, this is null.
  DateTime? get timestamp => null;

  /// The EIP-2718 type of this transaction envelope, or null for legacy transactions that do not have an envelope.
  int? get type => 0;

  /// Wait for this [hash] transaction to be mined with [confirms] confirmations, same as [Provider.waitForTransaction].
  Future<TransactionReceipt> wait([int? confirms]) async {
    throw UnimplementedError();
  }
}
