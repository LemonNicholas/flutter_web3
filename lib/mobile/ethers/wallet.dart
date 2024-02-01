part of ethers;

/// This is an interface which contains a minimal set of properties required for Externally Owned Accounts which can have certain operations performed, such as encoding as a JSON wallet.
class ExternallyOwnedAccount {

  /// The Address of this EOA.
  String get address => "";

  /// The account HD mnemonic, if it has one and can be determined. Some sources do not encode the mnemonic, such as HD extended keys.
  Mnemonic? get mnemonic => throw UnimplementedError();

  /// The privateKey of this EOA
  String get privateKey => "";

  @override
  String toString() {
    return 'ExternallyOwnedAccount: $address';
  }
}

/// Mnemonic interface for mnemonic defined private key.
class Mnemonic {
  /// The language of the wordlist this mnemonic is using.
  String get locale => "";

  /// The HD path for this mnemonic.
  String get path => "";

  /// The mnemonic phrase for this mnemonic. It is 12, 15, 18, 21 or 24 words long and separated by the whitespace specified by the locale.
  String get phrase => "";

  @override
  String toString() {
    return 'Mnemonic: $phrase';
  }
}

/// The Wallet class inherits [Signer] and can sign transactions and messages using a private key as a standard Externally Owned Account (EOA).
class Wallet {
  /// Create a new Wallet instance for [privateKey] and optionally connected to the [provider].
  factory Wallet(String privateKey, [Provider? provider]) => throw UnimplementedError();

  /// Returns a new [Wallet] with a random private key, generated from cryptographically secure entropy sources. If the current environment does not have a secure entropy source, an error is thrown.
  ///
  /// Wallets created using this method will have a [mnemonic].
  factory Wallet.createRandom() => throw UnimplementedError();

  /// Create an instance from an encrypted JSON wallet.
  ///
  /// This operation will operate synchronously which will lock up the user interface, possibly for a non-trivial duration. Most applications should use the asynchronous [fromEncryptedJson] instead.
  factory Wallet.fromEncryptedJsonSync(String json, String password) => throw UnimplementedError();

  /// Create an instance from a [mnemonic] phrase.
  ///
  /// If [path] is not specified, the Ethereum default path is used (i.e. m/44'/60'/0'/0/0).
  factory Wallet.fromMnemonic(String mnemonic, [String? path]) => throw UnimplementedError();

  /// The Address of this EOA.
  String get address => "";

  /// The account HD mnemonic, if it has one and can be determined. Some sources do not encode the mnemonic, such as HD extended keys.
  Mnemonic? get mnemonic => throw UnimplementedError();

  /// The privateKey of this EOA
  String get privateKey => "";

  /// The provider this wallet is connected to, which will be used for any Blockchain Methods methods. This can be `null`.
  Provider? get provider => throw UnimplementedError();

  /// The uncompressed public key for this Wallet represents.
  String get publicKey => "";

  /// Encrypt the wallet using [password] returning a Future which resolves to a JSON wallet.
  Future<String> encrypt(String password,
          [void Function(double progress)? progressCallback]) =>
      throw UnimplementedError();

  @override
  Wallet connect(Provider provider) => throw UnimplementedError();

  /// Create an instance from an encrypted [json] wallet with [password].
  ///
  /// If [progress] is provided it will be called during decryption with a value between 0 and 1 indicating the progress towards completion.
  static Future<Wallet> fromEncryptedJson(
    String json,
    String password, [
    void Function(double progress)? progressCallback,
  ]) async =>throw UnimplementedError();
}
