part of ethers;

class _AccessListImpl {
  external factory _AccessListImpl({String address, List<String> storageKeys});

  external String get address;

  external List<dynamic> get storageKeys;
}

class _BlockImpl extends _RawBlockImpl {
  external List<dynamic> get transactions;
}

class _BlockWithTransactionImpl extends _RawBlockImpl {
  external List<dynamic> get transactions;
}

class _ContractImpl {
  external _ContractImpl(String address, dynamic abi, dynamic providerOrSigner);

  external String get address;

  external Interface get interface;

  external _ProviderImpl get provider;

  external _SignerImpl? get signer;

  external _ContractImpl connect(dynamic providerOrSigner);

  external int listenerCount([dynamic eventName]);

  external List<dynamic> listeners(dynamic eventName);

  external removeAllListeners([dynamic eventName]);
}

class _EventFilterImpl {
  external factory _EventFilterImpl({
    String? address,
    List<dynamic>? topics,
  });

  external String? get address;

  external set address(String? address);

  external List<dynamic>? get topics;

  external set topics(List<dynamic>? topics);
}

class _EventImpl extends _LogImpl {
  external String event;

  external String eventSignature;

  external List<dynamic> args;
}

class _ExternallyOwnedAccountImpl {
  external String get address;

  external _MnemonicImpl? get mnemonic;

  external String get privateKey;
}

class _FeeDataImpl {
  external BigNumber? get gasPrice;

  external BigNumber? get maxFeePerGas;

  external BigNumber? get maxPriorityFeePerGas;
}

class _FilterImpl extends _EventFilterImpl {
  external factory _FilterImpl({
    String? address,
    List<dynamic>? topics,
    dynamic fromBlock,
    dynamic toBlock,
  });

  external dynamic get fromBlock;

  external set fromBlock(dynamic blockTag);

  external dynamic get toBlock;

  external set toBlock(dynamic blockTag);
}

class _FormatTypesImpl {
  external static dynamic json;

  external static dynamic full;

  external static dynamic minimal;
}

class _InterfaceImpl {
  external _InterfaceImpl(dynamic abi);

  external dynamic format([dynamic types]);

  external String getEventTopic(String event);

  external String getSighash(String function);
}

class _JsonRpcProviderImpl extends _ProviderImpl {
  external _JsonRpcProviderImpl([String? rpcUrl]);
}

class _LogImpl {
  external String get address;

  external String get blockHash;

  external int get blockNumber;

  external String get data;

  external String get logIndex;

  external bool get removed;

  external List<dynamic> get topics;

  external String get transactionHash;

  external String get transactionIndex;

  external int get transactionLogIndex;
}

class _MnemonicImpl {
  external String get locale;

  external String get path;

  external String get phrase;
}

class _NetworkImpl {
  external int get chainId;

  external String? get ensAddress;

  external String get name;
}

class _ProviderImpl {}

class _RawBlockImpl {
  external BigNumber? get baseFee;

  external num get difficulty;

  external String get extraData;

  external BigNumber get gasLimit;

  external BigNumber get gasUsed;

  external String get hash;

  external String get miner;

  external int get nounce;

  external int get number;

  external String get parentHash;

  external int get timestamp;
}

class _RawTxParamsImpl {
  external factory _RawTxParamsImpl({
    required String to,
    required String data,
  });

  external String get data;

  external String get to;
}

class _SignerImpl {
  external _SignerImpl connect(_ProviderImpl provider);

  external static bool isSigner(Object object);
}

class _TransactionImpl {
  external int get chainId;

  external String get data;

  external String get from;

  external BigNumber get gasLimit;

  external BigNumber? get gasPrice;

  external String get hash;

  external BigNumber? get maxFeePerGas;

  external BigNumber? get maxPriorityFeePerGas;

  external int get nounce;

  external String get r;

  external String get s;

  external String? get to;

  external int get v;

  external BigNumber get value;
}

class _TransactionOverrideImpl {
  external factory _TransactionOverrideImpl({
    BigNumber? value,
    BigNumber? gasLimit,
    BigNumber? gasPrice,
    BigNumber? maxFeePerGas,
    BigNumber? maxPriorityFeePerGas,
    int? nonce,
  });

  external BigNumber? get gasLimit;

  external BigNumber? get gasPrice;

  external BigNumber? get maxFeePerGas;

  external BigNumber? get maxPriorityFeePerGas;

  external int? get nonce;

  external BigNumber? get value;
}

class _TransactionReceiptImpl {
  external String get blockHash;

  external int get blockNumber;

  external bool get byzantium;

  external int get confirmations;

  external String? get contractAddress;

  external BigNumber get cumulativeGasUsed;

  external String get from;

  external BigNumber get gasUsed;

  external List<dynamic> get logs;

  external String get logsBloom;

  external String? get root;

  external int? get status;

  external String? get to;

  external String get transactionHash;

  external int get transactionIndex;
}

class _TransactionRequestImpl {
  external factory _TransactionRequestImpl({
    String? to,
    String? from,
    BigNumber? value,
    BigNumber? gasLimit,
    BigNumber? gasPrice,
    int? nonce,
    String? data,
    _AccessListImpl? accessList,
    BigNumber? maxFeePerGas,
    BigNumber? maxPriorityFeePerGas,
  });

  external _AccessListImpl? get accessList;

  external String? get data;

  external String? get from;

  external BigNumber? get gasLimit;

  external BigNumber? get gasPrice;

  external BigNumber? get maxFeePerGas;

  external BigNumber? get maxPriorityFeePerGas;

  external String? get method;

  external int? get nonce;

  external String? get to;

  external BigNumber? get value;
}

class _TransactionResponseImpl extends _TransactionImpl {
  external _AccessListImpl? get accessList;

  external String? get blockHash;

  external int? get blockNumber;

  external int get confirmations;

  external String? get raw;

  external int? get timestamp;

  external int? get type;
}

class _WalletImpl extends _SignerImpl {
  // ignore: unused_element
  external _WalletImpl(String privateKey, [_ProviderImpl? provider]);

  external String get address;

  external _MnemonicImpl? get mnemonic;

  external String get privateKey;

  external _ProviderImpl? get provider;

  external String get publicKey;

  external _WalletImpl connect(_ProviderImpl provider);

  external Future<String> encrypt(
    String password, [
    Object? options,
    void Function(double progress)? progressCallback,
  ]);

  external static _WalletImpl createRandom();

  external static Future<_WalletImpl> fromEncryptedJson(
    String json,
    String password, [
    void Function(double progress)? progressCallback,
  ]);

  external static _WalletImpl fromEncryptedJsonSync(
    String json,
    String password,
  );

  external static _WalletImpl fromMnemonic(String mnemonic, [String? path]);
}

class _Web3ProviderImpl extends _ProviderImpl {
  external _Web3ProviderImpl(dynamic eth);

  external _SignerImpl getSigner();
}
