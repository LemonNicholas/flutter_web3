part of ethers;

/// A [FeeData] object encapsulates the necessary fee data required to send a transaction, based on the best available recommendations.
class FeeData {
  /// The [gasPrice] to use for legacy transactions or networks which do not support `EIP-1559`.
  BigInt? get gasPrice => BigInt.zero;

  /// The [maxFeePerGas] to use for a transaction. This is based on the most recent block's baseFee.
  BigInt? get maxFeePerGas => BigInt.zero;

  /// The [maxPriorityFeePerGas] to use for a transaction. This accounts for the uncle risk and for the majority of current MEV risk.
  BigInt? get maxPriorityFeePerGas => BigInt.zero;
}
