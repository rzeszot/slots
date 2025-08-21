import SwiftUI

@Observable final class ProductsListModel {
    enum Phase {
        case loading
        case content([Product])
        case failure(Error)

        init(catching body: () async throws -> [Product]) async {
            do {
                self = .content(try await body())
            } catch {
                self = .failure(error)
            }
        }
    }

    private(set) var phase: Phase = .loading
    private let repository = ProductRepository()

    func refresh() {
        phase = .loading
    }

    func reload() async {
        phase = .loading

        phase = await Phase {
            try await repository.fetch()
        }
    }
}
