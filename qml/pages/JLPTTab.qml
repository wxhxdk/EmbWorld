import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: jlptTab
    color: "#f7f7f7"
    
    Rectangle {
        id: header
        anchors.top: parent.top
        width: parent.width
        height: 56
        color: "#07c160"
        
        Text {
            anchors.centerIn: parent
            text: "JLPT 日语能力考试"
            font { 
                pixelSize: 18
                weight: Font.Medium
            }
            color: "white"
        }
    }
    
    ScrollView {
        anchors {
            top: header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        clip: true
        
        ColumnLayout {
            width: parent.width
            spacing: 16
            anchors.margins: 16
            
            // 等级选择卡片
            Rectangle {
                Layout.fillWidth: true
                height: 120
                radius: 8
                color: "white"
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12
                    
                    Text {
                        text: "选择考试等级"
                        font { 
                            pixelSize: 16
                            weight: Font.Medium
                        }
                        color: "#333333"
                    }
                    
                    RowLayout {
                        spacing: 12
                        Repeater {
                            model: ["N5", "N4", "N3", "N2", "N1"]
                            delegate: Rectangle {
                                width: 50
                                height: 32
                                radius: 16
                                color: mouseArea.pressed ? "#e0e0e0" : "#f0f0f0"
                                border { 
                                    color: "#07c160"
                                    width: 1
                                }
                                
                                Text {
                                    anchors.centerIn: parent
                                    text: modelData
                                    font.pixelSize: 14
                                    color: "#07c160"
                                }
                                
                                MouseArea {
                                    id: mouseArea
                                    anchors.fill: parent
                                    onClicked: console.log("选择等级:", modelData)
                                }
                            }
                        }
                    }
                }
            }
            
            // 练习模块
            Rectangle {
                Layout.fillWidth: true
                height: 200
                radius: 8
                color: "white"
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12
                    
                    Text {
                        text: "练习模块"
                        font { 
                            pixelSize: 16
                            weight: Font.Medium
                        }
                        color: "#333333"
                    }
                    
                    RowLayout {
                        spacing: 12
                        
                        Repeater {
                            property var rateColors: [
                                { threshold: 90, color: "#4CAF50", icon: "✓" },
                                { threshold: 70, color: "#2196F3", icon: "➤" },
                                { threshold: 50, color: "#FFC107", icon: "⚠" },
                                { threshold: 0, color: "#F44336", icon: "✗" }
                            ]
                            
                            function getRateStyle(percent) {
                                let num = parseInt(percent) || 0
                                for (let level of rateColors) {
                                    if (num >= level.threshold) {
                                        return level
                                    }
                                }
                                return rateColors[rateColors.length-1]
                            }
                            
                            model: [
                                { icon: "📝", text: "文法", rate: "85%" },
                                { icon: "📖", text: "文字・語彙", rate: "78%" },
                                { icon: "📖", text: "読解", rate: "92%" },
                                { icon: "👂", text: "聴解", rate: "45%" }
                            ]
                            
                            delegate: Item {
                                Layout.fillWidth: true
                                height: 80
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    spacing: 8
                                    
                                    Text {
                                        text: modelData.icon
                                        font.pixelSize: 24
                                        horizontalAlignment: Text.AlignHCenter
                                        Layout.fillWidth: true
                                    }
                                    
                                    ColumnLayout {
                                        spacing: 2
                                        Layout.alignment: Qt.AlignHCenter
                                        
                                        Text {
                                            text: modelData.text
                                            font.pixelSize: 14
                                            color: "#333333"
                                            horizontalAlignment: Text.AlignHCenter
                                        }
                                        
                            // 正确率显示（带图标和颜色分级）
                            // 正确率显示组件
                            RowLayout {
                                spacing: 4
                                Layout.alignment: Qt.AlignHCenter
                                
                                // 状态图标
                                Text {
                                    id: rateIcon
                                    text: {
                                        var percent = parseInt(modelData.rate) || 0;
                                        if (percent >= 90) return "✓";
                                        if (percent >= 70) return "➤";
                                        if (percent >= 50) return "⚠";
                                        return "✗";
                                    }
                                    font {
                                        pixelSize: Qt.platform.os === "android" ? 10 : 12
                                        bold: true
                                    }
                                    color: {
                                        var percent = parseInt(modelData.rate) || 0;
                                        if (percent >= 90) return "#4CAF50"; // 优秀(绿色)
                                        if (percent >= 70) return "#2196F3"; // 良好(蓝色)
                                        if (percent >= 50) return "#FFC107"; // 一般(黄色)
                                        return "#F44336"; // 较差(红色)
                                    }
                                }
                                
                                // 百分比文字
                                Text {
                                    text: modelData.rate
                                    font {
                                        pixelSize: Qt.platform.os === "android" ? 10 : 12
                                        bold: Qt.platform.os === "android"
                                    }
                                    color: rateIcon.color // 保持与图标颜色一致
                                }
                            }
                                    }
                                }
                                
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: console.log("开始练习:", modelData.text)
                                }
                            }
                        }
                    }
                }
            }
            
            // 模拟考试
            Rectangle {
                Layout.fillWidth: true
                height: 100
                radius: 8
                color: "white"
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 16
                    
                    Rectangle {
                        width: 60
                        height: 60
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
                            font { 
                                pixelSize: 16
                                weight: Font.Medium
                            }
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
                        width: 32
                        height: 32
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
                    onClicked: console.log("开始模拟考试")
                }
            }
        }
    }
    
    function updateRate(type, percent) {
        // 查找对应的Repeater组件
        let repeater = this.children[2].children[0].children[1].children[1]
        repeater.rates[type] = percent + "%"
        repeater.model = [...repeater.model] // 强制刷新
    }
}