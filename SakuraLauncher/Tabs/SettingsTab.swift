//
//  SettingsTab.swift
//  SakuraLauncher
//
//  Created by FENGberd on 6/3/21.
//

import SwiftUI

struct SettingsTab: View {
    @EnvironmentObject var model: LauncherModel

    @State var token = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("设置")
                .font(.title)
                .padding(.leading, 24)

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if model.connected && model.user.status == .loggedIn {
                        HStack {
                            Text("\(model.user.name) - \(model.user.meta)")
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                            Button("退出", action: {
                                model.requestWithSimpleFailureAlert(.userLogout)
                            }).padding(.leading)
                        }
                    } else {
                        HStack {
                            Text("登录账户:")
                            TextField("访问密钥", text: !model.connected || model.user.status == .noLogin ? $token : .constant("****************"))
                                .frame(width: 200)
                            Button(model.user.status == .pending ? "登录中..." : "登录", action: {
                                DispatchQueue.global(qos: .userInitiated).async { [self] in
                                    let resp = model.pipe.request(RequestBase.with {
                                        $0.type = .userLogin
                                        $0.dataUserLogin = UserLogin.with {
                                            $0.token = token
                                        }
                                    })
                                    if !resp.success {
                                        model.showAlert(resp.message, title: "登录失败")
                                    }
                                    _ = model.syncAll()
                                }
                            })
                        }
                        .disabled(!model.connected || model.user.status == .pending)
                    }
                    Divider()
                    Toggle("日志自动换行", isOn: $model.logTextWrapping)
                        .toggleStyle(SwitchToggleStyle())
                    Toggle("隧道状态通知", isOn: $model.enableStatusNotification)
                        .toggleStyle(SwitchToggleStyle())
                    Toggle("绕过系统代理", isOn: $model.bypassProxy)
                        .toggleStyle(SwitchToggleStyle())
                        .disabled(!model.connected)
                    HStack {
                        Toggle("自动检查更新", isOn: $model.checkUpdate)
                            .toggleStyle(SwitchToggleStyle())
                            .disabled(!model.connected)
                        Button("立即检查") {
                            model.checkingUpdate = true
                            model.requestWithSimpleFailureAlert(.controlCheckUpdate)
                        }
                        .disabled(!model.connected || !model.checkUpdate || model.checkingUpdate)
                    }
                    Divider()
                    HStack {
                        Toggle("启用远程管理", isOn: $model.enableRemoteManagement)
                            .toggleStyle(SwitchToggleStyle())
                            .disabled(!model.connected || !(model.config?.remoteKeySet ?? false))
                        Button("设置密码") {
                            model.showPopup(AnyView(RemoteConfigPopup()))
                        }
                    }
                    Divider()
                    HStack {
                        // TODO: Move to status menu
                        Button("退出启动器") {
                            NSApplication.shared.terminate(self)
                        }
                        Button("彻底退出启动器和服务") {
                            model.daemon?.stopDaemon()
                            NSApplication.shared.terminate(self)
                        }
                    }
                }
            }
            .padding(.leading, 24)
            .padding(.trailing, 24)
        }
    }
}

#if DEBUG
struct SettingsTab_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTab()
            .previewLayout(.fixed(width: 602, height: 500))
            .environmentObject(LauncherModel_Preview() as LauncherModel)
    }
}
#endif
