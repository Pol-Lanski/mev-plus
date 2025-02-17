#!/bin/bash


# Assign proper value to _DAPPNODE_GLOBAL_EXECUTION_CLIENT_HOLESKY.
case "$_DAPPNODE_GLOBAL_EXECUTION_CLIENT_HOLESKY" in
"holesky-geth.dnp.dappnode.eth") EXECUTION_LAYER="http://holesky-geth.dappnode:8546" ;;
"holesky-nethermind.dnp.dappnode.eth") EXECUTION_LAYER="http://holesky-nethermind.dappnode:8546" ;;
"holesky-besu.dnp.dappnode.eth") EXECUTION_LAYER="http://holesky-besu.dappnode:8546" ;;
"holesky-erigon.dnp.dappnode.eth") EXECUTION_LAYER="http://holesky-erigon.dappnode:8545" ;;
*)
  echo "Unknown value for _DAPPNODE_GLOBAL_EXECUTION_CLIENT_HOLESKY. Please confirm that the value is correct."
  exit 1
  ;;
esac

# Assign proper value to _DAPPNODE_GLOBAL_CONSENSUS_CLIENT_HOLESKY.
case "$_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_HOLESKY" in
"prysm-holesky.dnp.dappnode.eth") BEACON_NODE_API="http://beacon-chain.prysm-holesky.dappnode:3500" ;;
"teku-holesky.dnp.dappnode.eth") BEACON_NODE_API="http://beacon-chain.teku-holesky.dappnode:3500" ;;
"lighthouse-holesky.dnp.dappnode.eth") BEACON_NODE_API="http://beacon-chain.lighthouse-holesky.dappnode:3500" ;;
"nimbus-holesky.dnp.dappnode.eth") BEACON_NODE_API="http://beacon-validator.nimbus-holesky.dappnode:4500" ;;
"lodestar-holesky.dnp.dappnode.eth") BEACON_NODE_API="http://beacon-chain.lodestar-holesky.dappnode:3500" ;;
*)
  echo "_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_HOLESKY env is not set properly."
  exit 1
  ;;
esac


./mevPlus \
   -builderApi.listen-address $BUILDER_API_ADDRESS \
   -externalValidatorProxy.address $EXTERNAL_VALIDATOR_PROXY_ADDRESS \
   -k2.eth1-private-key $ETH1_PRIVATE_KEY \
   -k2.beacon-node-url $BEACON_NODE_API \
   -k2.execution-node-url $EXECUTION_LAYER \
   ${EXTRA_OPTS}