import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: listeningTab
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
            text: "听力练习"
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
            
            // 播放器卡片
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                radius: 12
                color: "white"
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 16
                    
                    // 音频波形显示
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 60
                        color: "#f8f9fa"
                        radius: 8
                        
                        RowLayout {
                            anchors.centerIn: parent
                            spacing: 4
                            
                            Repeater {
                                model: 20
                                
                                Rectangle {
                                    Layout.preferredWidth: 3
                                    Layout.preferredHeight: 20 + Math.random() * 30
                                    radius: 1.5
                                    color: "#07c160"
                                    
                                    Behavior on height {
                                        NumberAnimation { duration: 200 }
                                    }
                                }
                            }
                        }
                    }
                    
                    // 播放控制
                    RowLayout {
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 20
                        
                        Rectangle {
                            Layout.preferredWidth: 48
                            Layout.preferredHeight: 48
                            radius: 24
                            color: "#f0f0f0"
                            
                            Text {
                                anchors.centerIn: parent
                                text: "⏮"
                                font.pixelSize: 20
                                color: "#666666"
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: console.log("上一首")
                            }
                        }
                        
                        Rectangle {
                            Layout.preferredWidth: 64
                            Layout.preferredHeight: 64
                            radius: 32
                            color: "#07c160"
                            
                            Text {
                                anchors.centerIn: parent
                                text: "▶"
                                font.pixelSize: 24
                                color: "white"
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: console.log("播放/暂停")
                            }
                        }
                        
                        Rectangle {
                            Layout.preferredWidth: 48
                            Layout.preferredHeight: 48
                            radius: 24
                            color: "#f0f0f0"
                            
                            Text {
                                anchors.centerIn: parent
                                text: "⏭"
                                font.pixelSize: 20
                                color: "#666666"
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: console.log("下一首")
                            }
                        }
                    }
                    
                    // 进度条
                    ColumnLayout {
                        spacing: 8
                        
                        RowLayout {
                            Text {
                                text: "00:30"
                                font.pixelSize: 12
                                color: "#666666"
                            }
                            
                            Item { Layout.fillWidth: true }
                            
                            Text {
                                text: "02:15"
                                font.pixelSize: 12
                                color: "#666666"
                            }
                        }
                        
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 4
                            radius: 2
                            color: "#f0f0f0"
                            
                            Rectangle {
                                width: parent.width * 0.3
                                height: parent.height
                                radius: 2
                                color: "#07c160"
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("设置播放进度")
                                }
                            }
                        }
                    }
                }
            }
            
            // 听力材料分类
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 120
                radius: 8
                color: "white"
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12
                    
                    Text {
                        text: "听力材料"
                        font.pixelSize: 16
                        font.weight: Font.Medium
                        color: "#333333"
                    }
                    
                    RowLayout {
                        spacing: 12
                        
                        Repeater {
                            model: [
                                { icon: "🎧", text: "日常对话", color: "#ff6b6b" },
                                { icon: "📰", text: "新闻播报", color: "#4ecdc4" },
                                { icon: "🎬", text: "影视片段", color: "#45b7d1" }
                            ]
                            
                            Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 60
                                radius: 8
                                color: modelData.color + "20"
                                border.color: modelData.color
                                border.width: 1
                                
                                ColumnLayout {
                                    anchors.centerIn: parent
                                    spacing: 4
                                    
                                    Text {
                                        text: modelData.icon
                                        font.pixelSize: 20
                                    }
                                    
                                    Text {
                                        text: modelData.text
                                        font.pixelSize: 12
                                        color: "#333333"
                                    }
                                }
                                
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        console.log("选择材料:", modelData.text)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // 练习记录
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
                        text: "练习记录"
                        font.pixelSize: 16
                        font.weight: Font.Medium
                        color: "#333333"
                    }
                    
                    Repeater {
                        model: [
                            { title: "商务日语对话", duration: "15分钟", score: "85分", date: "今天" },
                            { title: "新闻听力练习", duration: "20分钟", score: "92分", date: "昨天" },
                            { title: "日常会话练习", duration: "10分钟", score: "78分", date: "前天" }
                        ]
                        
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            radius: 6
                            color: "#f8f9fa"
                            border.color: "#e9ecef"
                            border.width: 1
                            
                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 12
                                spacing: 12
                                
                                ColumnLayout {
                                    spacing: 2
                                    
                                    Text {
                                        text: modelData.title
                                        font.pixelSize: 14
                                        font.weight: Font.Medium
                                        color: "#333333"
                                    }
                                    
                                    Text {
                                        text: modelData.duration + " • " + modelData.date
                                        font.pixelSize: 12
                                        color: "#666666"
                                    }
                                }
                                
                                Item { Layout.fillWidth: true }
                                
                                Text {
                                    text: modelData.score
                                    font.pixelSize: 14
                                    font.weight: Font.Medium
                                    color: "#07c160"
                                }
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("查看记录:", modelData.title)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

