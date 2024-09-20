import Soto
import MBServices

public struct App {
    public static func main() async throws {
        let ecs = ECSService(
            ecs: ECS(client: .init())
        )
        try await ecs.list()
    }
}
