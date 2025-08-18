#include "tabcontroller.h"

TabController::TabController(QObject *parent)
    : QObject(parent)
    , m_currentIndex(0)
{
    m_tabNames = {"JLPT", "ITJA", "听力", "会话", "我的"};
}

int TabController::currentIndex() const
{
    return m_currentIndex;
}

void TabController::setCurrentIndex(int index)
{
    if (m_currentIndex != index && index >= 0 && index < m_tabNames.size()) {
        m_currentIndex = index;
        emit currentIndexChanged();
        emit currentTabChanged();
    }
}

QString TabController::currentTab() const
{
    if (m_currentIndex >= 0 && m_currentIndex < m_tabNames.size()) {
        return m_tabNames[m_currentIndex];
    }
    return QString();
}

void TabController::switchToTab(int index)
{
    setCurrentIndex(index);
}

void TabController::switchToTabByName(const QString &tabName)
{
    int index = m_tabNames.indexOf(tabName);
    if (index >= 0) {
        setCurrentIndex(index);
    }
}








