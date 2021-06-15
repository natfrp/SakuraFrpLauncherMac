// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: tunnel.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Tunnel {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: Int32 = 0

  var node: Int32 = 0

  var name: String = String()

  var type: String = String()

  var note: String = String()

  var description_p: String = String()

  var status: Tunnel.Status = .disabled

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum Status: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case disabled // = 0
    case running // = 1
    case pending // = 2
    case UNRECOGNIZED(Int)

    init() {
      self = .disabled
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .disabled
      case 1: self = .running
      case 2: self = .pending
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .disabled: return 0
      case .running: return 1
      case .pending: return 2
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension Tunnel.Status: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Tunnel.Status] = [
    .disabled,
    .running,
    .pending,
  ]
}

#endif  // swift(>=4.2)

struct TunnelList {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var tunnels: [Tunnel] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct UpdateTunnelStatus {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: Int32 = 0

  var status: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct CreateTunnel {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var node: Int32 = 0

  var name: String = String()

  var note: String = String()

  var type: String = String()

  var remotePort: Int32 = 0

  var localPort: Int32 = 0

  var localAddress: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Tunnel: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Tunnel"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "node"),
    3: .same(proto: "name"),
    4: .same(proto: "type"),
    7: .same(proto: "note"),
    5: .same(proto: "description"),
    6: .same(proto: "status"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt32Field(value: &self.id) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.node) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.type) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 6: try { try decoder.decodeSingularEnumField(value: &self.status) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.note) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularInt32Field(value: self.id, fieldNumber: 1)
    }
    if self.node != 0 {
      try visitor.visitSingularInt32Field(value: self.node, fieldNumber: 2)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 3)
    }
    if !self.type.isEmpty {
      try visitor.visitSingularStringField(value: self.type, fieldNumber: 4)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 5)
    }
    if self.status != .disabled {
      try visitor.visitSingularEnumField(value: self.status, fieldNumber: 6)
    }
    if !self.note.isEmpty {
      try visitor.visitSingularStringField(value: self.note, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tunnel, rhs: Tunnel) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.node != rhs.node {return false}
    if lhs.name != rhs.name {return false}
    if lhs.type != rhs.type {return false}
    if lhs.note != rhs.note {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.status != rhs.status {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tunnel.Status: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "DISABLED"),
    1: .same(proto: "RUNNING"),
    2: .same(proto: "PENDING"),
  ]
}

extension TunnelList: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "TunnelList"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    3: .same(proto: "tunnels"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.tunnels) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.tunnels.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.tunnels, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: TunnelList, rhs: TunnelList) -> Bool {
    if lhs.tunnels != rhs.tunnels {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension UpdateTunnelStatus: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "UpdateTunnelStatus"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "status"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt32Field(value: &self.id) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.status) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularInt32Field(value: self.id, fieldNumber: 1)
    }
    if self.status != 0 {
      try visitor.visitSingularInt32Field(value: self.status, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: UpdateTunnelStatus, rhs: UpdateTunnelStatus) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.status != rhs.status {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension CreateTunnel: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "CreateTunnel"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    2: .same(proto: "node"),
    3: .same(proto: "name"),
    4: .same(proto: "note"),
    5: .same(proto: "type"),
    6: .standard(proto: "remote_port"),
    7: .standard(proto: "local_port"),
    8: .standard(proto: "local_address"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.node) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.note) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.type) }()
      case 6: try { try decoder.decodeSingularInt32Field(value: &self.remotePort) }()
      case 7: try { try decoder.decodeSingularInt32Field(value: &self.localPort) }()
      case 8: try { try decoder.decodeSingularStringField(value: &self.localAddress) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.node != 0 {
      try visitor.visitSingularInt32Field(value: self.node, fieldNumber: 2)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 3)
    }
    if !self.note.isEmpty {
      try visitor.visitSingularStringField(value: self.note, fieldNumber: 4)
    }
    if !self.type.isEmpty {
      try visitor.visitSingularStringField(value: self.type, fieldNumber: 5)
    }
    if self.remotePort != 0 {
      try visitor.visitSingularInt32Field(value: self.remotePort, fieldNumber: 6)
    }
    if self.localPort != 0 {
      try visitor.visitSingularInt32Field(value: self.localPort, fieldNumber: 7)
    }
    if !self.localAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.localAddress, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: CreateTunnel, rhs: CreateTunnel) -> Bool {
    if lhs.node != rhs.node {return false}
    if lhs.name != rhs.name {return false}
    if lhs.note != rhs.note {return false}
    if lhs.type != rhs.type {return false}
    if lhs.remotePort != rhs.remotePort {return false}
    if lhs.localPort != rhs.localPort {return false}
    if lhs.localAddress != rhs.localAddress {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}