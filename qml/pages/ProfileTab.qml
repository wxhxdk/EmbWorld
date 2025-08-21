import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: profileTab
    color: "#f7f7f7"
    
    // 顶部标题栏
    Rectangle {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 56
        color: "#07c160"
        
        Text {
            anchors.centerIn: parent
            text: "我的"
            font.pixelSize: 18
            font.weight: Font.Medium
            color: "white"
        }
    }
    
    // 主内容区域
    ScrollView {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true
        
        ColumnLayout {
            width: parent.width
            spacing: 16
            anchors.margins: 16
            
            // 用户信息卡片
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 120
                radius: 12
                color: "white"
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 16
                    
                    // 头像
                    Rectangle {
                        Layout.preferredWidth: 80
                        Layout.preferredHeight: 80
                        radius: 40
                        color: "#07c160"
                        
                        Text {
                            anchors.centerIn: parent
                            text: "👤"
                            font.pixelSize: 32
                            color: "white"
                        }
                    }
                    
                    // 用户信息
                    ColumnLayout {
                        spacing: 8
                        
                        Text {
                            text: "日语学习者"
                            font.pixelSize: 18
                            font.weight: Font.Medium
                            color: "#333333"
                        }
                        
                        Text {
                            text: "学习天数: 30天"
                            font.pixelSize: 14
                            color: "#666666"
                        }
                        
                        Text {
                            text: "当前等级: N3"
                            font.pixelSize: 14
                            color: "#666666"
                        }
                    }
                    
                    Item { Layout.fillWidth: true }
                    
                    // 设置按钮
                    Rectangle {
                        Layout.preferredWidth: 32
                        Layout.preferredHeight: 32
                        radius: 16
                        color: "#f0f0f0"
                        
                        Text {
                            anchors.centerIn: parent
                            text: "⚙"
                            font.pixelSize: 16
                            color: "#666666"
                        }
                        
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("用户设置")
                            }
                        }
                    }
                }
            }
            
            // 学习统计
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 100
                radius: 8
                color: "white"
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 0
                    
                    Repeater {
                        model: [
                            { label: "学习时长", value: "120h", color: "#ff6b6b" },
                            { label: "练习次数", value: "156", color: "#4ecdc4" },
                            { label: "正确率", value: "85%", color: "#45b7d1" }
                        ]
                        
                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 4
                            
                            Text {
                                text: modelData.value
                                font.pixelSize: 20
                                font.weight: Font.Bold
                                color: modelData.color
                                Layout.alignment: Qt.AlignHCenter
                            }
                            
                            Text {
                                text: modelData.label
                                font.pixelSize: 12
                                color: "#666666"
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }
                    }
                }
            }
            
            // 功能菜单
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                radius: 8
                color: "white"
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 0
                    
                    Text {
                        text: "功能菜单"
                        font.pixelSize: 16
                        font.weight: Font.Medium
                        color: "#333333"
                        Layout.bottomMargin: 12
                    }
                    
                    Repeater {
                        model: [
                            { icon: "📊", text: "学习报告", desc: "查看详细学习数据" },
                            { icon: "🎯", text: "学习目标", desc: "设置学习计划和目标" },
                            { icon: "📚", text: "学习资料", desc: "下载和管理学习资料" },
                            { icon: "🔧", text: "插件管理", desc: "管理应用插件" }
                        ]
                        
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            color: "transparent"
                            
                            RowLayout {
                                anchors.fill: parent
                                spacing: 12
                                
                                Text {
                                    text: modelData.icon
                                    font.pixelSize: 20
                                }
                                
                                ColumnLayout {
                                    spacing: 2
                                    
                                    Text {
                                        text: modelData.text
                                        font.pixelSize: 14
                                        font.weight: Font.Medium
                                        color: "#333333"
                                    }
                                    
                                    Text {
                                        text: modelData.desc
                                        font.pixelSize: 12
                                        color: "#666666"
                                    }
                                }
                                
                                Item { Layout.fillWidth: true }
                                
                                Rectangle {
                                    Layout.preferredWidth: 32
                                    Layout.preferredHeight: 32
                                    radius: 16
                                    color: "#f0f0f0"
                                    
                                    Text {
                                        anchors.centerIn: parent
                                        text: ">"
                                        font.pixelSize: 16
                                        color: "#999999"
                                    }
                                }
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    if (modelData.text === "插件管理") {
                                        pluginManagerDialog.open()
                                    } else {
                                        console.log("点击:", modelData.text)
                                    }
                                }
                            }
                            
                            // 分割线
                            Rectangle {
                                anchors.bottom: parent.bottom
                                anchors.left: parent.left
                                anchors.right: parent.right
                                height: 1
                                color: "#f0f0f0"
                                visible: index < 3
                            }
                        }
                    }
                }
            }
            
            // 关于应用
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                radius: 8
                color: "white"
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 8
                    
                    Text {
                        text: "关于应用"
                        font.pixelSize: 16
                        font.weight: Font.Medium
                        color: "#333333"
                    }
                    
                    Text {
                        text: "EmbWorld v1.0.0"
                        font.pixelSize: 14
                        color: "#666666"
                    }
                    
                    Text {
                        text: "跨平台日语学习应用"
                        font.pixelSize: 12
                        color: "#999999"
                    }
                }
            }
        }
    }
    
    // 插件管理对话框
    Dialog {
        id: pluginManagerDialog
        title: "插件管理"
        width: 350
        height: 400
        modal: true
        
        Rectangle {
            anchors.fill: parent
            color: "white"
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 16
                
                // 插件列表
                ListView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    
                    model: ListModel {
                        ListElement {
                            name: "语音识别插件"
                            description: "支持日语语音识别"
                            version: "1.0.0"
                            enabled: true
                        }
                        ListElement {
                            name: "翻译插件"
                            description: "提供实时翻译功能"
                            version: "1.2.0"
                            enabled: true
                        }
                        ListElement {
                            name: "语法检查插件"
                            description: "检查日语语法错误"
                            version: "0.9.5"
                            enabled: false
                        }
                    }
                    
                    delegate: Rectangle {
                        width: parent.width
                        height: 80
                        color: "transparent"
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 12
                            spacing: 12
                            
                            ColumnLayout {
                                spacing: 4
                                
                                Text {
                                    text: model.name
                                    font.pixelSize: 14
                                    font.weight: Font.Medium
                                    color: "#333333"
                                }
                                
                                Text {
                                    text: model.description
                                    font.pixelSize: 12
                                    color: "#666666"
                                }
                                
                                Text {
                                    text: "版本: " + model.version
                                    font.pixelSize: 10
                                    color: "#999999"
                                }
                            }
                            
                            Item { Layout.fillWidth: true }
                            
                            Switch {
                                checked: model.enabled
                                onClicked: {
                                    model.enabled = !model.enabled
                                    console.log("插件状态:", model.name, model.enabled)
                                }
                            }
                        }
                        
                        Rectangle {
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            height: 1
                            color: "#f0f0f0"
                        }
                    }
                }
                
                // 底部按钮
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 12
                    
                    Button {
                        text: "刷新"
                        Layout.fillWidth: true
                        onClicked: {
                            console.log("刷新插件列表")
                        }
                    }
                    
                    Button {
                        text: "安装插件"
                        Layout.fillWidth: true
                        onClicked: {
                            console.log("安装新插件")
                        }
                    }
                }
            }
        }
    }
}
