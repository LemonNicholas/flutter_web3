part of ethers;

/// An object consist of basic information about block.
///
/// Often only the hashes of the transactions included in a block are needed, so by default a block only contains this information, as it is substantially less data.
class Block {
  /// A list of the transactions hashes for each transaction this block includes.
  List<String> get transactions => [];
}

/// An object consist of basic information about block.
///
/// If all transactions for a block are needed, this object instead includes the full details on each transaction.
class BlockWithTransaction {

  /// A list of the transactions this block includes.
  List<TransactionResponse> get transactions => [];
}

class _RawBlock{

  BigInt? get baseFee => BigInt.zero;

  /// The difficulty target required to be met by the miner of the block.
  num get difficulty => 0;

  /// This is extra data a miner may choose to include when mining a block.
  String get extraData => "";

  /// The maximum amount of gas that this block was permitted to use.
  ///
  /// This is a value that can be voted up or voted down by miners and is used to automatically adjust the bandwidth requirements of the network.
  BigInt get gasLimit => BigInt.zero;

  /// The total amount of gas used by all transactions in this block.
  BigInt get gasUsed => BigInt.zero;

  /// The hash of this block.
  String get hash => "";

  /// The coinbase address of this block, which indicates the address the miner that mined this block would like the subsidy reward to go to.
  String get miner => "";

  /// The nonce used as part of the proof-of-work to mine this block.
  int get nounce => 0;

  /// The height (number) of this block.
  int get number => 0;

  /// The hash of the previous block.
  String get parentHash => "";

  /// The timestamp of this block.
  DateTime get timestamp => DateTime.now();

  @override
  String toString() =>
      'Block: $number ${hash.substring(0, 10)} mined at ${timestamp.toIso8601String()} with diff $difficulty';
}
