import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: tabBar
    color: "#ffffff"
    border.color: "#e5e5e5"
    border.width: 1
    
    property int currentIndex: 0
    signal tabClicked(int index)
    
    // 微信风格的标签数据
    property var tabData: [
        {
            icon: "📚",
            text: "JLPT",
            color: "#07c160"
        },
        {
            icon: "🎯", 
            text: "ITJA",
            color: "#07c160"
        },
        {
            icon: "🎧",
            text: "听力",
            color: "#07c160"
        },
        {
            icon: "💬",
            text: "会话",
            color: "#07c160"
        },
        {
            icon: "👤",
            text: "我的",
            color: "#07c160"
        }
    ]
    
    RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 0
        
        Repeater {
            model: tabData.length
            
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "transparent"
                
                property bool isSelected: index === tabBar.currentIndex
                
                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 4
                    
                    Text {
                        text: tabData[index].icon
                        font.pixelSize: 24
                        color: isSelected ? tabData[index].color : "#999999"
                        Layout.alignment: Qt.AlignHCenter
                    }
                    
                    Text {
                        text: tabData[index].text
                        font.pixelSize: 12
                        color: isSelected ? tabData[index].color : "#999999"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                
                // 选中指示器
                Rectangle {
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 20
                    height: 3
                    radius: 1.5
                    color: isSelected ? tabData[index].color : "transparent"
                    
                    Behavior on color {
                        ColorAnimation { duration: 200 }
                    }
                }
                
                // 点击区域和动画效果
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: {
                        //tabBar.currentIndex = index
                        tabBar.tabClicked(index)
                    }
                }
                
                // 动画效果
                Behavior on scale {
                    NumberAnimation { duration: 100 }
                }
                
                scale: mouseArea.pressed ? 0.95 : 1.0
            }
        }
    }
    
    // 顶部阴影
    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 1
        color: "#e5e5e5"
    }
}

