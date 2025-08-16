import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: itjaTab
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
            text: "ITJA IT日语"
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
            
            // 技能分类
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
                        text: "IT技能分类"
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
                                { icon: "💻", text: "编程语言", color: "#ff6b6b" },
                                { icon: "🖥️", text: "操作系统", color: "#4ecdc4" },
                                { icon: "🌐", text: "网络技术", color: "#45b7d1" },
                                { icon: "🗄️", text: "数据库", color: "#96ceb4" }
                            ]
                            
                            Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 60
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
                                        font.pixelSize: 20
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
                                        console.log("选择技能:", modelData.text)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // 学习进度
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
                        text: "学习进度"
                        font.pixelSize: 16
                        font.weight: Font.Medium
                        color: "#333333"
                    }
                    
                    Repeater {
                        model: [
                            { name: "Java基础", progress: 75 },
                            { name: "Linux命令", progress: 60 },
                            { name: "网络协议", progress: 45 }
                        ]
                        
                        ColumnLayout {
                            spacing: 4
                            
                            RowLayout {
                                Text {
                                    text: modelData.name
                                    font.pixelSize: 14
                                    color: "#333333"
                                }
                                
                                Item { Layout.fillWidth: true }
                                
                                Text {
                                    text: modelData.progress + "%"
                                    font.pixelSize: 12
                                    color: "#07c160"
                                }
                            }
                            
                            Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 6
                                radius: 3
                                color: "#f0f0f0"
                                
                                Rectangle {
                                    width: parent.width * modelData.progress / 100
                                    height: parent.height
                                    radius: 3
                                    color: "#07c160"
                                    
                                    Behavior on width {
                                        NumberAnimation { duration: 500 }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // 实战项目
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 140
                radius: 8
                color: "white"
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12
                    
                    Text {
                        text: "实战项目"
                        font.pixelSize: 16
                        font.weight: Font.Medium
                        color: "#333333"
                    }
                    
                    Repeater {
                        model: [
                            { name: "Web应用开发", desc: "使用Spring Boot开发", status: "进行中" },
                            { name: "移动应用开发", desc: "使用Flutter开发", status: "已完成" }
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
                                        text: modelData.name
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
                                    Layout.preferredWidth: 60
                                    Layout.preferredHeight: 24
                                    radius: 12
                                    color: modelData.status === "已完成" ? "#28a745" : "#ffc107"
                                    
                                    Text {
                                        anchors.centerIn: parent
                                        text: modelData.status
                                        font.pixelSize: 10
                                        color: "white"
                                    }
                                }
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("查看项目:", modelData.name)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

