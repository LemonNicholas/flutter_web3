export 'src/wallet_connect/wallet_connect.dart'
if (dart.library.js) 'src/wallet_connect/wallet_connect.dart' // Browser, Node.JS
if (dart.library.io) 'mobile/wallet_connect/wallet_connect.dart'; // VM
