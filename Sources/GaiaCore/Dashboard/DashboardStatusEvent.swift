import Foundation

public enum DashboardStatusEventType: String, Codable, Sendable {
  case connectionChanged = "connection.changed"
  case systemChanged = "system.changed"
  case streamError = "stream.error"
}

public struct DashboardStatusEvent: Codable, Equatable, Sendable {
  public struct ConnectionSnapshot: Codable, Equatable, Sendable {
    public let aither: DashboardConnectionState
    public let hemera: DashboardConnectionState
  }

  public struct SystemSnapshot: Codable, Equatable, Sendable {
    public let serviceStatus: DashboardServiceHealth
    public let lastUpdatedAt: Date
  }

  public let type: DashboardStatusEventType
  public let timestamp: Date
  public let connection: ConnectionSnapshot
  public let system: SystemSnapshot

  public init(
    type: DashboardStatusEventType,
    timestamp: Date,
    connection: ConnectionSnapshot,
    system: SystemSnapshot
  ) {
    self.type = type
    self.timestamp = timestamp
    self.connection = connection
    self.system = system
  }
}
