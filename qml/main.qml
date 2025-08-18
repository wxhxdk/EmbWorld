import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

import "../qml"
import "pages"

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 800
    title: "EmbWorld"
    
    // 微信风格的颜色
    color: "#f7f7f7"
    
    // 状态栏高度（Android）
    property int statusBarHeight: Qt.platform.os === "android" ? 24 : 0
    
    // 主布局
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        
        // 状态栏占位
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: statusBarHeight
            color: "#07c160"
        }
        
        // 主内容区域
        StackLayout {
            id: contentStack
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: tabController ? tabController.currentIndex : 0
            
            // JLPT 标签页
            JLPTTab {
                id: jlptTab;
            }
            
            // ITJA 标签页
            ITJATab {
                id: itjaTab;
            }
            
            // 听力标签页
            ListeningTab {
                id: listeningTab;
            }
            
            // 会话标签页
            ConversationTab {
                id: conversationTab;
            }
            
            // 我的标签页
            ProfileTab {
                id: profileTab;
            }
        }
        
        // 底部标签栏
        TabBar {
            id: tabBar
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            currentIndex: tabController ? tabController.currentIndex : 0
            
            onTabClicked: function(index) {
                tabController.setCurrentIndex(index)
            }
        }
    }
    
    // 连接标签控制器
    Connections {
        target: tabController
        function onCurrentIndexChanged() {
            contentStack.currentIndex = tabController.currentIndex
        }
    }
}

