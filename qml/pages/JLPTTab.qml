import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: jlptTab
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
            text: "JLPT 日语能力考试"
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
            
            // 等级选择卡片
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
                        text: "选择考试等级"
                        font.pixelSize: 16
                        font.weight: Font.Medium
                        color: "#333333"
                    }
                    
                    RowLayout {
                        spacing: 12
                        
                        Repeater {
                            model: ["N5", "N4", "N3", "N2", "N1"]
                            
                            Rectangle {
                                Layout.preferredWidth: 50
                                Layout.preferredHeight: 32
                                radius: 16
                                color: mouseArea.pressed ? "#e0e0e0" : "#f0f0f0"
                                border.color: "#07c160"
                                border.width: 1
                                
                                Text {
                                    anchors.centerIn: parent
                                    text: modelData
                                    font.pixelSize: 14
                                    color: "#07c160"
                                }
                                
                                MouseArea {
                                    id: mouseArea
                                    anchors.fill: parent
                                    onClicked: {
                                        console.log("选择等级:", modelData)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // 练习模块
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                radius: 8
                color: "white"
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12
                    
                    Text {
                        text: "练习模块"
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
                                { icon: "📝", text: "语法练习", color: "#ff6b6b" },
                                { icon: "📖", text: "词汇练习", color: "#4ecdc4" },
                                { icon: "👂", text: "听力练习", color: "#45b7d1" },
                                { icon: "📖", text: "阅读练习", color: "#96ceb4" }
                            ]
                            
                            Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 80
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
                                        console.log("点击:", modelData.text)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // 模拟考试
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 100
                radius: 8
                color: "white"
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 16
                    
                    Rectangle {
                        Layout.preferredWidth: 60
                        Layout.preferredHeight: 60
                        radius: 30
                        color: "#07c160"
                        
                        Text {
                            anchors.centerIn: parent
                            text: "🎯"
                            font.pixelSize: 24
                        }
                    }
                    
                    ColumnLayout {
                        spacing: 4
                        
                        Text {
                            text: "模拟考试"
                            font.pixelSize: 16
                            font.weight: Font.Medium
                            color: "#333333"
                        }
                        
                        Text {
                            text: "完整模拟JLPT考试环境"
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
                        console.log("开始模拟考试")
                    }
                }
            }
        }
    }
}

