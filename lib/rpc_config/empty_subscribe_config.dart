/// Imports
/// ------------------------------------------------------------------------------------------------

import 'rpc_subscribe_config.dart';


/// Empty Subscribe Config
/// ------------------------------------------------------------------------------------------------

class EmptySubscribeConfig extends RpcSubscribeConfig {

  /// JSON-RPC configuration object with no additional properties.
  const EmptySubscribeConfig({
    super.timeout,
  });

  @override
  Map<String, Object> object() => {};
}