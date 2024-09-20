import Soto

public struct ECSService {
    public init(ecs: ECS) {
        self.ecs = ecs
    }

    public var ecs: ECS

    public func list() async throws {
        _ = try await ecs.describeClusters(.init())
    }


}
