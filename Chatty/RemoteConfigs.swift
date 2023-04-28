//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import FirebaseRemoteConfig

private let _remoteConfig = {
    let rc = RemoteConfig.remoteConfig()
    let settings = RemoteConfigSettings()
    settings.minimumFetchInterval = 0
    rc.configSettings = settings
    rc.setDefaults(fromPlist: "remote_config_defaults")
    return rc
}()

var remoteConfig: RemoteConfig {
    let gap = _remoteConfig.configValue(forKey: "gap").numberValue.intValue
    if let lastTime = _remoteConfig.lastFetchTime,
       Date().hours(from: lastTime) < gap {
        return _remoteConfig
    }
    _remoteConfig.fetch { (status, error) -> Void in
        if status == .success {
            print("Config fetched!")
            _remoteConfig.activate { changed, error in
                // ...
            }
        } else {
            print("Config not fetched")
            print("Error: \(error?.localizedDescription ?? "No error available.")")
        }
    }
    return _remoteConfig
}

fileprivate extension Date {
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
}
