import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: studyBuddyTab
    color: "#f7f7f7"
    
    // 全局动态正确率属性
    property int vocabularyAccuracy: 85
    property int grammarAccuracy: 78
    property int listeningAccuracy: 92
    
    // 顶部标题栏
    Rectangle {
        id: header
        anchors.top: parent.top
        width: parent.width
        height: 56
        color: "#07c160"
        
        Text {
            anchors.centerIn: parent
            text: "学伴"
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
            
            // 雷达搜索区域
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 200
            color: "#ffffff"
            radius: 8
            
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 16
                
                Text {
                    text: "🔍"
                    font.pixelSize: 48
                    Layout.alignment: Qt.AlignHCenter
                }
                
                Text {
                    text: "智能雷达搜索附近学伴"
                    font.pixelSize: 16
                    color: "#333333"
                    Layout.alignment: Qt.AlignHCenter
                }
                
                Button {
                    text: "开始搜索"
                    background: Rectangle {
                        color: "#07c160"
                        radius: 20
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Layout.preferredWidth: 120
                    Layout.preferredHeight: 40
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
        
        // 附近学伴列表
        ListView {
            id: buddyList
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: ListModel {
                ListElement { name: "张三"; distance: "100m"; subject: "日语N1"; avatar: "👨‍💻" }
                ListElement { name: "李四"; distance: "200m"; subject: "英语六级"; avatar: "👩‍" }
                ListElement { name: "王五"; distance: "300m"; subject: "编程学习"; avatar: "👨‍💼" }
            }
            delegate: Rectangle {
                width: buddyList.width
                height: 80
                color: index % 2 === 0 ? "#ffffff" : "#f9f9f9"
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12
                    
                    Text {
                        text: avatar
                        font.pixelSize: 32
                        Layout.alignment: Qt.AlignVCenter
                    }
                    
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 4
                        
                        Text {
                            text: name + " · " + distance
                            font.pixelSize: 16
                            font.bold: true
                            color: "#333333"
                        }
                        
                        Text {
                            text: subject
                            font.pixelSize: 14
                            color: "#666666"
                        }
                    }
                    
                    Button {
                        text: "邀请学习"
                        background: Rectangle {
                            color: "#07c160"
                            radius: 16
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "white"
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        Layout.preferredWidth: 80
                        Layout.preferredHeight: 32
                        Layout.alignment: Qt.AlignVCenter
                    }
                }
            }
        }
        }
    }
    
    // 动态更新函数
    function updateRate(type, percent) {
        switch(type) {
        case "grammar":
            grammarAccuracy = percent;
            break;
        case "vocabulary":
            vocabularyAccuracy = percent;
            break;
        case "listening":
            listeningAccuracy = percent;
            break;
        default:
            console.log("未知的正确率类型:", type);
            break;
        }
    }
    
    // 批量更新函数
    function updateAllRates(rateData) {
        if (rateData.grammar !== undefined) grammarAccuracy = rateData.grammar;
        if (rateData.vocabulary !== undefined) vocabularyAccuracy = rateData.vocabulary;
        if (rateData.listening !== undefined) listeningAccuracy = rateData.listening;
    }
    
    // 获取所有正确率数据
    function getAllRates() {
        return {
            grammar: grammarAccuracy,
            vocabulary: vocabularyAccuracy,
            listening: listeningAccuracy
        };
    }
}
