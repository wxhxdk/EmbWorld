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

        RowLayout {
            anchors.fill: parent
            anchors.margins: 16
            spacing: 12

            // 左侧标题
            Text {
                text: "JLPT 日语能力考试"
                font {
                    pixelSize: 18
                    weight: Font.Medium
                }
                color: "white"
                Layout.alignment: Qt.AlignVCenter
            }

            Item {
                Layout.fillWidth: true
            }

            // 右侧倒计时信息
            RowLayout {
                spacing: 6
                Layout.alignment: Qt.AlignVCenter

                Text {
                    text: "⏰"
                    font.pixelSize: 16
                    color: "white"
                }

                Text {
                    text: (tabController ? tabController.examDaysLeft : 45) + "天"
                    font {
                        pixelSize: 16
                        weight: Font.Medium
                    }
                    color: {
                        var days = tabController ? tabController.examDaysLeft : 45;
                        if (days >= 45) return "#E8F5E8"; // 淡绿色
                        if (days >= 30) return "#FFF3CD"; // 淡黄色
                        if (days >= 15) return "#F8D7DA"; // 淡红色
                        return "#FFCCCB"; // 深红色
                    }
                }
            }
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

            // 工具栏区域
            Rectangle {
                Layout.fillWidth: true
                height: 48
                radius: 12
                color: "white"
                border {
                    color: "#f0f0f0"
                    width: 1
                }
                
                // 用 Rectangle 模拟阴影效果
                Rectangle {
                    anchors.fill: parent
                    anchors.topMargin: 2
                    anchors.leftMargin: 1
                    anchors.rightMargin: 1
                    radius: parent.radius
                    color: "#f8f9fa"
                    z: -1
                }

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 8
                    spacing: 12

                    // 扫码按钮 - 文字+图标组合
                    Rectangle {
                        width: 60
                        height: 36
                        radius: 18
                        color: mouseAreaScan.pressed ? "#f1f3f4" : "#ffffff"
                        border {
                            color: mouseAreaScan.hovered ? "#dadce0" : "#e8eaed"
                            width: 1
                        }

                        RowLayout {
                            anchors.centerIn: parent
                            spacing: 4

                            Text {
                                text: "⚡"
                                font.pixelSize: 14
                                color: "#5f6368"
                            }

                            Text {
                                text: "QR"
                                font {
                                    pixelSize: 13
                                    weight: Font.Medium
                                }
                                color: "#3c4043"
                            }
                        }

                        MouseArea {
                            id: mouseAreaScan
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: console.log("扫码功能")
                        }
                    }

                    // 搜索框 - 保持现有设计
                    Rectangle {
                        Layout.fillWidth: true
                        height: 36
                        radius: 18
                        color: mouseAreaSearch.pressed ? "#f8f9fa" : "#fafbfc"
                        border {
                            color: mouseAreaSearch.hovered ? "#e1e4e8" : "#f1f3f4"
                            width: 1
                        }

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            spacing: 8

                            Text {
                                text: "🔍"
                                font.pixelSize: 14
                                color: "#6c757d"
                            }

                            Text {
                                text: "搜索题目、单词、语法..."
                                font {
                                    pixelSize: 14
                                    weight: Font.Normal
                                }
                                color: "#adb5bd"
                                Layout.fillWidth: true
                            }
                        }

                        MouseArea {
                            id: mouseAreaSearch
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: console.log("搜索功能")
                        }
                    }

                    // 等级选择 - 极简标签风格
                    Rectangle {
                        width: 50
                        height: 36
                        radius: 6
                        color: "transparent"
                        border {
                            color: mouseAreaLevel.pressed ? "#1a73e8" : "#dadce0"
                            width: 1.5
                        }

                        RowLayout {
                            anchors.centerIn: parent
                            spacing: 2

                            Text {
                                text: tabController ? tabController.currentLevel : "N2"
                                font {
                                    pixelSize: 14
                                    weight: Font.Medium
                                    letterSpacing: 0.3
                                }
                                color: mouseAreaLevel.pressed ? "#1a73e8" : "#5f6368"
                            }

                            Text {
                                text: "▼"
                                font.pixelSize: 10
                                color: mouseAreaLevel.pressed ? "#1a73e8" : "#9aa0a6"
                            }
                        }

                        MouseArea {
                            id: mouseAreaLevel
                            anchors.fill: parent
                            onClicked: {
                                if (tabController) {
                                    tabController.switchToNextLevel();
                                }
                                console.log("等级切换至:", tabController ? tabController.currentLevel : "N2");
                            }
                        }
                    }
                }
            }

            // 学习狀況卡片
            Rectangle {
                Layout.fillWidth: true
                height: 140
                radius: 8
                color: "white"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12

                    RowLayout {
                        spacing: 8
                        Layout.alignment: Qt.AlignLeft

                        Text {
                            text: "📈"
                            font.pixelSize: 16
                        }

                        Text {
                            text: "学习狀況"
                            font {
                                pixelSize: 16
                                weight: Font.Medium
                            }
                            color: "#333333"
                        }
                    }

                    RowLayout {
                        spacing: 20
                        Layout.fillWidth: true

                        // 学习记录（时间+天数）
                        ColumnLayout {
                            spacing: 4
                            Layout.fillWidth: true

                            Text {
                                text: "学习记录"
                                font.pixelSize: 12
                                color: "#666666"
                            }
                            
                            Text {
                                text: (tabController ? tabController.studyTimeToday : 15) + "分钟"
                                font {
                                    pixelSize: 16
                                    weight: Font.Medium
                                }
                                color: "#07c160"
                            }
                            
                            Text {
                                text: (tabController ? tabController.studyDays : 15) + "天"
                                font {
                                    pixelSize: 14
                                    weight: Font.Normal
                                }
                                color: "#999999"
                            }
                        }

                        // 今日进度
                        ColumnLayout {
                            spacing: 4
                            Layout.fillWidth: true

                            Text {
                                text: "今日进度"
                                font.pixelSize: 12
                                color: "#666666"
                            }
                            
                            Text {
                                text: (tabController ? tabController.todayProgress : 75) + "%"
                                font {
                                    pixelSize: 16
                                    weight: Font.Medium
                                }
                                color: {
                                    var progress = tabController ? tabController.todayProgress : 75;
                                    if (progress >= 80) return "#07c160";
                                    if (progress >= 50) return "#ff9500";
                                    return "#ff3b30";
                                }
                            }
                        }

                        // 最薄弱科目
                        ColumnLayout {
                            spacing: 4
                            Layout.fillWidth: true

                            Text {
                                text: "最薄弱科目"
                                font.pixelSize: 12
                                color: "#666666"
                            }
                            
                            Text {
                                text: tabController ? tabController.weakestSubject : "文字・語彙"
                                font {
                                    pixelSize: 14
                                    weight: Font.Medium
                                }
                                color: "#ff3b30"
                                elide: Text.ElideRight
                                Layout.fillWidth: true
                            }
                        }
                    }
                }
            }

            // 备考助力
            Rectangle {
                Layout.fillWidth: true
                height: 150
                radius: 8
                color: "white"

                // 备考助力

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12

                    RowLayout {
                        spacing: 8
                        Layout.alignment: Qt.AlignLeft

                        Text {
                            text: "🚀"
                            font.pixelSize: 16
                        }

                        Text {
                            text: "备考助力"
                            font {
                                pixelSize: 16
                                weight: Font.Medium
                            }
                            color: "#333333"
                        }
                    }

                    RowLayout {
                        spacing: 12

                        Repeater {
                            model: [
                                { icon: "📝", text: "真题练习", rate: (tabController ? tabController.realQuestionsAccuracy : 76) + "%" },
                                { icon: "📊", text: "模拟考试", rate: (tabController ? tabController.mockExamAccuracy : 89) + "%" }
                            ]

                            delegate: Item {
                                Layout.fillWidth: true
                                height: 80

                                ColumnLayout {
                                    anchors.centerIn: parent
                                    width: parent.width
                                    spacing: 6

                                    Text {
                                        text: modelData.icon
                                        font.pixelSize: 24
                                        horizontalAlignment: Text.AlignHCenter
                                        Layout.alignment: Qt.AlignHCenter
                                    }

                                    Text {
                                        text: modelData.text
                                        font.pixelSize: 14
                                        color: "#333333"
                                        horizontalAlignment: Text.AlignHCenter
                                        Layout.alignment: Qt.AlignHCenter
                                    }

                                    // 正确率显示组件
                                    Text {
                                        text: "正确率: " + modelData.rate
                                        font.pixelSize: 11
                                        color: {
                                            var percent = parseInt(modelData.rate) || 0;
                                            if (percent >= 80) return "#07c160";
                                            if (percent >= 60) return "#ff9500";
                                            return "#ff3b30";
                                        }
                                        horizontalAlignment: Text.AlignHCenter
                                        Layout.alignment: Qt.AlignHCenter
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

            // 专项强化
            Rectangle {
                Layout.fillWidth: true
                height: 160
                radius: 8
                color: "white"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12

                    RowLayout{
                        spacing: 8
                        Layout.alignment: Qt.AlignLeft

                        Text {
                            text: "💪"
                            font.pixelSize: 16
                        }

                        Text{
                            text: "专项强化"
                            font {
                                pixelSize: 16
                                weight: Font.Medium
                            }
                            color: "#333333"
                        }
                    }

                    RowLayout {
                        spacing: 12

                        Repeater {
                            property var rateColors: [
                                { threshold: 90, color: "#4CAF50", icon: "🟢" },
                                { threshold: 70, color: "#2196F3", icon: "🔵" },
                                { threshold: 50, color: "#FFC107", icon: "🟡" },
                                { threshold: 0, color: "#F44336", icon: "🔴" }
                            ]

                            model: [
                                { icon: "📖", text: "文字・語彙", rate: (tabController ? tabController.vocabularyAccuracy : 55) + "%" },
                                { icon: "📝", text: "文法", rate: (tabController ? tabController.grammarAccuracy : 85) + "%" },
                                { icon: "📖", text: "読解", rate: (tabController ? tabController.readingAccuracy : 92) + "%" },
                                { icon: "👂", text: "聴解", rate: (tabController ? tabController.listeningAccuracy : 45) + "%" }
                            ]

                            delegate: Item {
                                Layout.fillWidth: true
                                height: 80

                                ColumnLayout {
                                    anchors.centerIn: parent
                                    width: parent.width * 0.8
                                    spacing: 6

                                    Text {
                                        text: modelData.icon
                                        font.pixelSize: 24
                                        horizontalAlignment: Text.AlignHCenter
                                        Layout.alignment: Qt.AlignHCenter
                                        Layout.fillWidth: true
                                    }

                                    Text {
                                        text: modelData.text
                                        font.pixelSize: 14
                                        color: "#333333"
                                        horizontalAlignment: Text.AlignHCenter
                                        Layout.alignment: Qt.AlignHCenter
                                        Layout.fillWidth: true
                                    }

                                    // 正确率显示组件
                                    RowLayout {
                                        spacing: 4
                                        Layout.alignment: Qt.AlignHCenter

                                        // 状态图标
                                        Text {
                                            id: rateIcon
                                            text: {
                                                var percent = parseInt(modelData.rate) || 0;
                                                if (percent >= 90) return "🟢";
                                                if (percent >= 70) return "🔵";
                                                if (percent >= 50) return "🟡";
                                                return "🔴";
                                            }
                                            font {
                                                pixelSize: Qt.platform.os === "android" ? 8 : 10
                                            }
                                        }

                                        // 百分比文字
                                        Text {
                                            text: modelData.rate
                                            font {
                                                pixelSize: Qt.platform.os === "android" ? 10 : 12
                                                bold: Qt.platform.os === "android"
                                            }
                                            color: {
                                                var percent = parseInt(modelData.rate) || 0;
                                                if (percent >= 90) return "#4CAF50"; // 优秀(绿色)
                                                if (percent >= 70) return "#2196F3"; // 良好(蓝色)
                                                if (percent >= 50) return "#FFC107"; // 一般(黄色)
                                                return "#F44336"; // 较差(红色)
                                            }
                                        }
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: console.log("開始練習:", modelData.text)
                                }
                            }
                        }
                    }
                }
            }

            // 强化巩固
            Rectangle {
                Layout.fillWidth: true
                height: 200
                radius: 8
                color: "white"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12

                    RowLayout {
                        spacing: 8
                        Layout.alignment: Qt.AlignLeft

                        Text {
                            text: "🎖️"
                            font.pixelSize: 16
                        }

                        Text {
                            text: "强化巩固"
                            font {
                                pixelSize: 16
                                weight: Font.Medium
                            }
                            color: "#333333"
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 8

                        Repeater {
                            model: [
                                { 
                                    icon: "🏆", 
                                    text: "必会题/易错题", 
                                    description: "大数据筛选出的必会题和易错题",
                                    rate: (tabController ? tabController.keyQuestionsAccuracy : 78) + "%" 
                                },
                                { 
                                    icon: "🎲", 
                                    text: "随机真题", 
                                    description: "历年真题随机抽取，强化练习",
                                    rate: (tabController ? tabController.randomQuestionsAccuracy : 85) + "%" 
                                }
                            ]

                            delegate: Rectangle {
                                Layout.fillWidth: true
                                height: 70
                                color: "transparent"

                                RowLayout {
                                    anchors.fill: parent
                                    anchors.margins: 12
                                    spacing: 16

                                    // 左側图标
                                    Text {
                                        text: modelData.icon
                                        font.pixelSize: 32
                                        color: "#07c160"
                                        Layout.alignment: Qt.AlignVCenter
                                    }

                                    // 右側内容
                                    ColumnLayout {
                                        spacing: 4
                                        Layout.fillWidth: true
                                        Layout.alignment: Qt.AlignVCenter

                                        // 标题
                                        Text {
                                            text: modelData.text
                                            font {
                                                pixelSize: 16
                                                weight: Font.Medium
                                            }
                                            color: "#333333"
                                        }

                                        // 描述文本
                                        Text {
                                            text: modelData.description
                                            font.pixelSize: 12
                                            color: "#666666"
                                            wrapMode: Text.Wrap
                                            Layout.fillWidth: true
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
        }
    }

    function updateRate(type, percent) {
        // 直接调用C++端的更新函数
        if (tabController) {
            tabController.updateRate(type, percent);
        }
    }
    
    // 批量更新函数
    function updateAllRates(rateData) {
        if (tabController) {
            tabController.updateAllRates(rateData);
        }
    }
    
    // 获取所有正确率数据
    function getAllRates() {
        return tabController ? tabController.getAllRates() : {};
    }
    
    // 更新学习时间
    function updateStudyTime(minutesToday, totalHours) {
        if (tabController) {
            tabController.updateStudyTime(minutesToday, totalHours);
        }
    }
}
