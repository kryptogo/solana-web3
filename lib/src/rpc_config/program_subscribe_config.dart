/// Imports
/// ------------------------------------------------------------------------------------------------

import 'package:solana_web3/src/config/account_encoding.dart';
import 'package:solana_web3/src/config/commitment.dart';
import 'package:solana_web3/src/models/program_filter.dart';
import 'package:solana_web3/src/rpc/rpc_subscribe_config.dart';
import 'package:solana_web3/src/rpc_config/commitment_subscribe_config.dart';
import 'package:solana_web3/src/utils/convert.dart' show list;


/// Program Subscribe Config
/// ------------------------------------------------------------------------------------------------

class ProgramSubscribeConfig extends CommitmentSubscribeConfig {

  /// Defines the configurations for JSON-RPC `ProgramSubscribe` requests.
  ProgramSubscribeConfig({
    super.timeout,
    super.commitment,
    this.encoding = AccountEncoding.base64,
    final List<ProgramFilter>? filters,
  }): filters = filters == null || filters.isEmpty ? null : filters,
      assert(encoding.isAccount);

  /// The Program data's encoding (default: [AccountEncoding.base64]).
  final AccountEncoding encoding;

  /// The filters applied to the results. An account must meet all filter criteria to be included in 
  /// results.
  final List<ProgramFilter>? filters;

  @override
  Map<String, dynamic> object() => {
    'commitment': commitment.name,
    'encoding': encoding.name,
    'filters': list.tryEncode(filters),
  };
}