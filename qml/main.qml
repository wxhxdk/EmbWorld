import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

import "../qml"
import "../qml/pages"  // 使用完整路径

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 800
    title: "EmbWorld"
    
    color: "#f7f7f7"
    property int statusBarHeight: Qt.platform.os === "android" ? 24 : 0
    
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: statusBarHeight
            color: "#07c160"
        }
        
        StackLayout {
            id: contentStack
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: tabController ? tabController.currentIndex : 0
            
            JLPTTab { id: jlptTab }
            ITJATab { id: itjaTab }
            ListeningTab { id: listeningTab }
            ConversationTab { id: conversationTab }
            StudyBuddyTab { id: studyBuddyTab }
            ProfileTab { id: profileTab }
        }
        
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
    
    Connections {
        target: tabController
        function onCurrentIndexChanged() {
            contentStack.currentIndex = tabController.currentIndex
        }
    }
}