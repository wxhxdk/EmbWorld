# EmbWorld - 跨平台日语学习应用

EmbWorld 是一个基于 Qt6 和 QML 开发的跨平台日语学习应用，支持 Windows、macOS、Linux、Android 和 iOS 平台。

## 项目概述

本项目旨在为日语学习者提供一个现代化的、跨平台的学习工具。应用采用微信风格的设计语言，提供直观友好的用户界面，支持多种学习模式和功能。

### 设计理念
- **跨平台兼容**：一套代码，多平台运行
- **现代化UI**：微信风格的设计语言
- **用户友好**：直观的交互体验
- **功能完整**：覆盖日语学习的各个方面

## 功能特性

### 五个主要标签页

#### 1. JLPT - 日语能力考试练习
- **等级选择**：支持 N5-N1 五个等级
- **练习模块**：语法、词汇、听力、阅读练习
- **模拟考试**：完整模拟JLPT考试环境
- **进度跟踪**：学习进度可视化

#### 2. ITJA - IT日语学习
- **技能分类**：编程语言、操作系统、网络技术、数据库
- **学习进度**：实时跟踪学习进度
- **实战项目**：展示实际项目案例
- **技能评估**：定期评估学习效果

#### 3. 听力 - 听力练习
- **音频播放器**：支持多种音频格式
- **波形显示**：实时音频波形可视化
- **材料分类**：日常对话、新闻播报、影视片段
- **练习记录**：详细的练习历史记录

#### 4. 会话 - 对话练习
- **场景选择**：商务对话、餐厅点餐、购物对话、交通出行
- **实时对话**：AI助手对话练习
- **语音识别**：支持语音输入
- **消息记录**：对话历史保存

#### 5. 我的 - 个人中心
- **用户信息**：个人资料和学习统计
- **学习数据**：学习时长、练习次数、正确率
- **功能菜单**：学习报告、学习目标、学习资料
- **应用设置**：个性化配置选项

## 技术架构

### 核心技术栈
- **Qt6**：跨平台应用框架
- **QML**：声明式用户界面
- **C++17**：高性能后端逻辑
- **CMake**：现代化构建系统
- **Material Design**：现代化UI组件

### 跨平台支持
- **Windows**：使用 Qt6 原生支持
- **macOS**：使用 Qt6 原生支持
- **Linux**：使用 Qt6 原生支持
- **Android**：使用 Qt6 Android 绑定
- **iOS**：使用 Qt6 iOS 绑定

### 设计风格
- **主色调**：微信绿 (#07c160)
- **背景色**：浅灰 (#f7f7f7)
- **卡片设计**：圆角白色背景
- **图标系统**：Emoji 和 Material Design 图标
- **动画效果**：流畅的过渡动画

## 构建说明

### 环境要求
- **Qt6.5** 或更高版本
- **CMake 3.16** 或更高版本
- **C++17** 兼容的编译器
- **Android SDK** (Android 构建)
- **Xcode** (iOS 构建)

### 使用 Qt Creator 开发

#### 1. 打开项目
1. 启动 Qt Creator
2. 选择 "Open Project"
3. 选择项目根目录下的 `CMakeLists.txt` 文件
4. 配置构建套件 (Kit)

#### 2. 配置构建套件
- **桌面开发**：选择 Qt6 和 C++17 编译器
- **Android 开发**：选择 Qt6 for Android 和 Android SDK

#### 3. 构建和运行
- 点击 "Build" 按钮构建项目
- 点击 "Run" 按钮运行应用
- 对于 Android：连接设备并选择 "Run on Device"

#### 4. 调试
- 设置断点进行调试
- 使用 Qt Creator 的调试工具
- 查看 QML 调试输出

### 真机调试 (Android)

#### 1. 设备准备
- 启用开发者选项
- 启用 USB 调试
- 连接设备到电脑

#### 2. Qt Creator 配置
- 在 "Devices" 中配置 Android 设备
- 设置 Android SDK 和 NDK 路径
- 配置签名密钥

#### 3. 部署和调试
- 选择 Android 构建套件
- 点击 "Run" 部署到设备
- 使用 Qt Creator 调试工具

## 项目结构

```
EmbWorld/
├── CMakeLists.txt              # 主构建文件
├── CMakePresets.json           # CMake 预设配置
├── resources.qrc               # Qt 资源文件
├── build.bat                   # Windows 构建脚本
├── build.sh                    # Linux/macOS 构建脚本
├── build-android.sh            # Android 构建脚本
├── README.md                   # 项目说明
├── PROJECT_SUMMARY.md          # 项目总结
├── src/                        # C++ 源代码
│   ├── main.cpp                # 主程序入口
│   ├── mainwindow.h/cpp        # 主窗口
│   └── tabcontroller.h/cpp     # 标签控制器
├── qml/                        # QML 界面文件
│   ├── main.qml                # 主界面
│   ├── TabBar.qml              # 标签栏
│   └── pages/                  # 标签页
│       ├── JLPTTab.qml         # JLPT 页面
│       ├── ITJATab.qml         # ITJA 页面
│       ├── ListeningTab.qml    # 听力页面
│       ├── ConversationTab.qml # 会话页面
│       └── ProfileTab.qml      # 我的页面
└── android/                    # Android 配置
    └── AndroidManifest.xml
```

## 开发指南

### 代码规范
- 使用 C++17 标准
- 遵循 Qt 编码规范
- QML 使用 2.15 版本
- 使用 CMake 构建系统

### 添加新功能
1. 在 `src/` 目录添加 C++ 后端代码
2. 在 `qml/pages/` 目录添加 QML 界面
3. 更新 `CMakeLists.txt` 和 `resources.qrc`
4. 测试所有平台兼容性

### 调试技巧
- 使用 Qt Creator 进行调试
- 启用 QML 调试模式
- 使用 Qt 日志系统输出调试信息

## 开发计划

### 第一阶段 (已完成)
- [x] 基础框架搭建
- [x] 五个标签页实现
- [x] 微信风格UI设计
- [x] 跨平台构建支持

### 第二阶段 (计划中)
- [ ] 数据持久化
- [ ] 网络功能集成
- [ ] 音频处理功能
- [ ] 语音识别集成

### 第三阶段 (计划中)
- [ ] 用户系统
- [ ] 云端同步
- [ ] 性能优化
- [ ] 更多学习内容

## 贡献指南

我们欢迎所有形式的贡献！

### 如何贡献
1. Fork 项目
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 创建 Pull Request

### 贡献类型
- 🐛 Bug 修复
- ✨ 新功能
- 📝 文档改进
- 🎨 UI/UX 改进
- ⚡ 性能优化

## 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件

## 联系方式

- **项目主页**：<repository-url>
- **问题反馈**：<issues-url>
- **邮箱**：<email>
- **讨论区**：<discussions-url>

## 致谢

感谢所有为这个项目做出贡献的开发者！

---

**EmbWorld** - 让日语学习更简单、更高效！

*用技术改变学习方式，让每个人都能轻松掌握日语*
