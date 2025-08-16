import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: conversationTab
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
            text: "会话练习"
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
            
            // 对话场景选择
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 160
                radius: 8
                color: "white"
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12
                    
                    Text {
                        text: "对话场景"
                        font.pixelSize: 16
                        font.weight: Font.Medium
                        color: "#333333"
                    }
                    
                    GridLayout {
                        columns: 2
                        rowSpacing: 12
                        columnSpacing: 12
                        
                        Repeater {
                            model: [
                                { icon: "🏢", text: "商务对话", color: "#ff6b6b" },
                                { icon: "🍽️", text: "餐厅点餐", color: "#4ecdc4" },
                                { icon: "🛒", text: "购物对话", color: "#45b7d1" },
                                { icon: "🚕", text: "交通出行", color: "#96ceb4" }
                            ]
                            
                            Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 70
                                radius: 8
                                color: modelData.color + "20"
                                border.color: modelData.color
                                border.width: 1
                                
                                RowLayout {
                                    anchors.fill: parent
                                    anchors.margins: 12
                                    spacing: 8
                                    
                                    Text {
                                        text: modelData.icon
                                        font.pixelSize: 24
                                    }
                                    
                                    Text {
                                        text: modelData.text
                                        font.pixelSize: 14
                                        color: "#333333"
                                    }
                                }
                                
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        console.log("选择场景:", modelData.text)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // 当前对话
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 300
                radius: 8
                color: "white"
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12
                    
                    Text {
                        text: "当前对话"
                        font.pixelSize: 16
                        font.weight: Font.Medium
                        color: "#333333"
                    }
                    
                    // 对话内容区域
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#f8f9fa"
                        radius: 6
                        
                        ListView {
                            id: conversationList
                            anchors.fill: parent
                            anchors.margins: 12
                            spacing: 8
                            clip: true
                            
                            model: ListModel {
                                ListElement {
                                    speaker: "AI助手"
                                    message: "こんにちは！今日は何を練習したいですか？"
                                    isUser: false
                                }
                                ListElement {
                                    speaker: "我"
                                    message: "レストランでの注文を練習したいです。"
                                    isUser: true
                                }
                                ListElement {
                                    speaker: "AI助手"
                                    message: "いいですね！レストランでの注文の練習を始めましょう。"
                                    isUser: false
                                }
                            }
                            
                            delegate: Rectangle {
                                width: conversationList.width
                                height: messageText.height + 20
                                color: "transparent"
                                
                                RowLayout {
                                    anchors.fill: parent
                                    spacing: 8
                                    
                                    Item {
                                        Layout.fillWidth: model.isUser
                                    }
                                    
                                    Rectangle {
                                        Layout.preferredWidth: messageText.width + 16
                                        Layout.preferredHeight: messageText.height + 12
                                        radius: 12
                                        color: model.isUser ? "#07c160" : "#e9ecef"
                                        
                                        Text {
                                            id: messageText
                                            anchors.centerIn: parent
                                            text: model.message
                                            font.pixelSize: 14
                                            color: model.isUser ? "white" : "#333333"
                                            wrapMode: Text.WordWrap
                                            width: Math.min(implicitWidth, conversationList.width - 80)
                                        }
                                    }
                                    
                                    Item {
                                        Layout.fillWidth: !model.isUser
                                    }
                                }
                            }
                        }
                    }
                    
                    // 输入区域
                    RowLayout {
                        spacing: 8
                        
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40
                            radius: 20
                            color: "#f8f9fa"
                            border.color: "#e9ecef"
                            border.width: 1
                            
                            TextInput {
                                id: messageInput
                                anchors.fill: parent
                                anchors.margins: 12
                                font.pixelSize: 14
                                color: "#333333"
                                verticalAlignment: TextInput.AlignVCenter
                                
                                onAccepted: {
                                    if (text.trim() !== "") {
                                        conversationList.model.append({
                                            speaker: "我",
                                            message: text,
                                            isUser: true
                                        })
                                        text = ""
                                    }
                                }
                            }
                            
                            // 占位符文本
                            Text {
                                anchors.fill: parent
                                anchors.margins: 12
                                text: "输入消息..."
                                font.pixelSize: 14
                                color: "#999999"
                                verticalAlignment: Text.AlignVCenter
                                visible: messageInput.text.length === 0
                            }
                        }
                        
                        Rectangle {
                            Layout.preferredWidth: 40
                            Layout.preferredHeight: 40
                            radius: 20
                            color: "#07c160"
                            
                            Text {
                                anchors.centerIn: parent
                                text: "➤"
                                font.pixelSize: 16
                                color: "white"
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    if (messageInput.text.trim() !== "") {
                                        conversationList.model.append({
                                            speaker: "我",
                                            message: messageInput.text,
                                            isUser: true
                                        })
                                        messageInput.text = ""
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // 语音识别
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                radius: 8
                color: "white"
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 16
                    
                    Rectangle {
                        Layout.preferredWidth: 48
                        Layout.preferredHeight: 48
                        radius: 24
                        color: "#07c160"
                        
                        Text {
                            anchors.centerIn: parent
                            text: "🎤"
                            font.pixelSize: 20
                            color: "white"
                        }
                        
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("开始语音识别")
                            }
                        }
                    }
                    
                    ColumnLayout {
                        spacing: 4
                        
                        Text {
                            text: "语音识别"
                            font.pixelSize: 14
                            font.weight: Font.Medium
                            color: "#333333"
                        }
                        
                        Text {
                            text: "点击麦克风开始说话"
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
                            text: "⚙"
                            font.pixelSize: 16
                            color: "#666666"
                        }
                        
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("语音设置")
                            }
                        }
                    }
                }
            }
        }
    }
}

