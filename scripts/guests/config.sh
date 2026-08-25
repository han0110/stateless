#!/usr/bin/env bash

guest_config() {
    case "${1:?zkVM name is required}" in
        openvm)
            ZKVM_VERSION="v2.1.0-preview"
            COMPILER_IMAGE="ghcr.io/eth-act/ere/ere-compiler-openvm@sha256:fb0603963cb3d0942233bc3eec135da9d947cc4e17cf6af6c0bc8cacc89e946d"
            SERVER_IMAGE="ghcr.io/eth-act/ere/ere-server-openvm@sha256:0232778c6b65a50e7f97690ced4f5e1d7544e4e22484663a444cf85f2568e4b9"
            ;;
        sp1)
            ZKVM_VERSION="v6.4.0"
            COMPILER_IMAGE="ghcr.io/eth-act/ere/ere-compiler-sp1@sha256:25c59a3ee57883b8af3eec234f53f489c96b60a95478488aaaccde6bf7e3484e"
            SERVER_IMAGE="ghcr.io/eth-act/ere/ere-server-sp1@sha256:835420a62344a2234cfed99b822c3cedbea14c814db2668c568a47015cbf4d9d"
            ;;
        zisk)
            ZKVM_VERSION="v1.1.0-alpha"
            COMPILER_IMAGE="ghcr.io/eth-act/ere/ere-compiler-zisk@sha256:cca4b1a7b6841a12e9002f96de714cdbedb46808a43ac5418c47c396ba99e906"
            SERVER_IMAGE="ghcr.io/eth-act/ere/ere-server-zisk@sha256:bbf717dfe3bfe23fe5fbcdcadf60b21719e8cc0366968a676f4482d450e28dce"
            ;;
        *)
            echo "unsupported zkVM: $1" >&2
            return 2
            ;;
    esac

    ZKVM="$1"
    ARTIFACT_NAME="stateless-validator-reth-${ZKVM}-${ZKVM_VERSION}"
    export ZKVM ZKVM_VERSION COMPILER_IMAGE SERVER_IMAGE ARTIFACT_NAME
}
