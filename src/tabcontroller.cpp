#include "tabcontroller.h"

TabController::TabController(QObject *parent)
    : QObject(parent)
    , m_currentIndex(0)
    , m_realQuestionsAccuracy(76)
    , m_mockExamAccuracy(89)
    , m_keyQuestionsAccuracy(78)
    , m_grammarAccuracy(85)
    , m_vocabularyAccuracy(55)
    , m_readingAccuracy(92)
    , m_listeningAccuracy(45)
{
    m_tabNames = {"JLPT", "ITJA", "听力", "会话", "学伴", "我的"};
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

// JLPT 数据读取函数
int TabController::realQuestionsAccuracy() const
{
    return m_realQuestionsAccuracy;
}

int TabController::mockExamAccuracy() const
{
    return m_mockExamAccuracy;
}

int TabController::keyQuestionsAccuracy() const
{
    return m_keyQuestionsAccuracy;
}

int TabController::grammarAccuracy() const
{
    return m_grammarAccuracy;
}

int TabController::vocabularyAccuracy() const
{
    return m_vocabularyAccuracy;
}

int TabController::readingAccuracy() const
{
    return m_readingAccuracy;
}

int TabController::listeningAccuracy() const
{
    return m_listeningAccuracy;
}

// JLPT 数据更新函数
void TabController::updateRate(const QString &type, int percent)
{
    if (type == "realQuestions") {
        if (m_realQuestionsAccuracy != percent) {
            m_realQuestionsAccuracy = percent;
            emit realQuestionsAccuracyChanged();
        }
    } else if (type == "mockExam") {
        if (m_mockExamAccuracy != percent) {
            m_mockExamAccuracy = percent;
            emit mockExamAccuracyChanged();
        }
    } else if (type == "keyQuestions") {
        if (m_keyQuestionsAccuracy != percent) {
            m_keyQuestionsAccuracy = percent;
            emit keyQuestionsAccuracyChanged();
        }
    } else if (type == "grammar") {
        if (m_grammarAccuracy != percent) {
            m_grammarAccuracy = percent;
            emit grammarAccuracyChanged();
        }
    } else if (type == "vocabulary") {
        if (m_vocabularyAccuracy != percent) {
            m_vocabularyAccuracy = percent;
            emit vocabularyAccuracyChanged();
        }
    } else if (type == "reading") {
        if (m_readingAccuracy != percent) {
            m_readingAccuracy = percent;
            emit readingAccuracyChanged();
        }
    } else if (type == "listening") {
        if (m_listeningAccuracy != percent) {
            m_listeningAccuracy = percent;
            emit listeningAccuracyChanged();
        }
    }
}

void TabController::updateAllRates(const QVariantMap &rateData)
{
    if (rateData.contains("realQuestions")) {
        updateRate("realQuestions", rateData["realQuestions"].toInt());
    }
    if (rateData.contains("mockExam")) {
        updateRate("mockExam", rateData["mockExam"].toInt());
    }
    if (rateData.contains("keyQuestions")) {
        updateRate("keyQuestions", rateData["keyQuestions"].toInt());
    }
    if (rateData.contains("grammar")) {
        updateRate("grammar", rateData["grammar"].toInt());
    }
    if (rateData.contains("vocabulary")) {
        updateRate("vocabulary", rateData["vocabulary"].toInt());
    }
    if (rateData.contains("reading")) {
        updateRate("reading", rateData["reading"].toInt());
    }
    if (rateData.contains("listening")) {
        updateRate("listening", rateData["listening"].toInt());
    }
}

QVariantMap TabController::getAllRates() const
{
    QVariantMap rates;
    rates["realQuestions"] = m_realQuestionsAccuracy;
    rates["mockExam"] = m_mockExamAccuracy;
    rates["keyQuestions"] = m_keyQuestionsAccuracy;
    rates["grammar"] = m_grammarAccuracy;
    rates["vocabulary"] = m_vocabularyAccuracy;
    rates["reading"] = m_readingAccuracy;
    rates["listening"] = m_listeningAccuracy;
    return rates;
}








