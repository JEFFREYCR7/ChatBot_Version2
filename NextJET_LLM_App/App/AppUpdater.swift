//
//  NextJET_LLM_App
//
//  Created by 王杰瑞 on 2024/8/5.
//

import Foundation
import Combine
import Sparkle

@Observable
final class AppUpdater {
    private var cancellable: AnyCancellable?
    var canCheckForUpdates = false
    
    init(_ updater: SPUUpdater) {
        cancellable = updater.publisher(for: \.canCheckForUpdates)
            .assign(to: \.canCheckForUpdates, on: self)
    }
}
