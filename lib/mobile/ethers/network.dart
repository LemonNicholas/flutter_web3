part of ethers;

/// A Network represents an Ethereum network.
class Network {
  ///The Chain ID of the network.
  int get chainId => 0;

  ///The address at which the ENS registry is deployed on this network.
  String? get ensAddress => "";

  ///The human-readable name of the network, such as homestead.
  ///
  ///If the network name is unknown, this will be "unknown".
  String get name => "";

  @override
  String toString() => 'Network: $name at $chainId';
}
