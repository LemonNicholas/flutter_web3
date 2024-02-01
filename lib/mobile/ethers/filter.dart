part of ethers;

/// An event filter is made up of topics, which are values logged in a Bloom Filter, allowing efficient searching for entries which match a filter.
class EventFilter{
  /// Instantiate [EventFilter] by providing [address] and [topics].
  ///
  /// ---
  ///
  /// ```dart
  /// // Filter for BUSD BEP20 Token
  /// final filter = EventFilter(
  ///   // BUSD Address
  ///   address: '0xe9e7cea3dedca5984780bafc599bd69add087d56',
  ///   topics: [
  ///     // Tranfer event hash
  ///     '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef',
  ///     // From this specific address (padded to 32 bytes)
  ///     '0x0000000000000000000000002caa4694cb7daf7d49a198dc1103c06d4991ae52',
  ///   ],
  /// );
  /// ```
  factory EventFilter({String? address, List<dynamic>? topics}) => throw UnimplementedError();

  /// The address to filter by, or `null` to match any address.
  String? get address => null;

  set address(String? address) => throw UnimplementedError();

  /// The topics to filter by or `null` to match any topics.
  ///
  /// Each entry represents an AND condition that must match, or may be null to match anything.
  ///
  /// If a given entry is an Array, then that entry is treated as an OR for any value in the entry.
  List<dynamic>? get topics => [];

  set topics(List<dynamic>? topics) => throw UnimplementedError();

  @override
  String toString() => 'Filter: $address with $topics';
}

class Filter {
  /// Instantiate [Filter] by providing [address], [topics], [toBlock], and [fromBlock].
  ///
  /// ---
  ///
  /// ```dart
  /// // Filter for BUSD BEP20 Token
  /// final filter = EventFilter(
  ///   // BUSD Address
  ///   address: '0xe9e7cea3dedca5984780bafc599bd69add087d56',
  ///   topics: [
  ///     // Tranfer event hash
  ///     '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef',
  ///     // From this specific address (padded to 32 bytes)
  ///     '0x0000000000000000000000002caa4694cb7daf7d49a198dc1103c06d4991ae52',
  ///   ],
  ///   // To specific blocktag
  ///   toBlock: BlockTag.latest,
  ///   // From specific blocktag
  ///   fromBlock: 2482480,
  /// );
  /// ```

  factory Filter({
    String? address,
    List<dynamic>? topics,
    dynamic toBlock,
    dynamic fromBlock,
  }) => throw UnimplementedError();

  /// The starting block (inclusive) to search for logs matching the filter criteria.
  dynamic get fromBlock => throw UnimplementedError();

  /// "latest" - The most recently mined block
  /// "earliest" - Block #0
  /// "pending" - The block currently being prepared for mining; not all
  ///
  /// Or an [int] block number.
  /// Positive number mean block at that height. Negative mean block that many block ago.
  ///
  /// Or a Hex [String] block at that height.
  set fromBlock(blockTag) => throw UnimplementedError();

  /// The end block (inclusive) to search for logs matching the filter criteria.
  dynamic get toBlock => throw UnimplementedError();

  /// "latest" - The most recently mined block
  /// "earliest" - Block #0
  /// "pending" - The block currently being prepared for mining; not all
  ///
  /// Or an [int] block number.
  /// Positive number mean block at that height. Negative mean block that many block ago.
  ///
  /// Or a Hex [String] block at that height.
  set toBlock(blockTag) => throw UnimplementedError();

  @override
  String toString() => '${super.toString()} from $fromBlock to $toBlock';
}
