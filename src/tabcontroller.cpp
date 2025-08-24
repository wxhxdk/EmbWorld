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
    , m_currentLevel("N2")
    , m_studyDays(15)
    , m_todayProgress(75)
    , m_studyTimeToday(15)    // 今日学习时间：15分钟
    , m_totalStudyTime(25)    // 总学习时间：25小时
{
    m_tabNames = {"JLPT", "ITJA", "听力", "会话", "学伴", "我的"};
    updateWeakestSubject();
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
            updateWeakestSubject(); // 正确率变化时重新计算最薄弱科目
        }
    } else if (type == "vocabulary") {
        if (m_vocabularyAccuracy != percent) {
            m_vocabularyAccuracy = percent;
            emit vocabularyAccuracyChanged();
            updateWeakestSubject(); // 正确率变化时重新计算最薄弱科目
        }
    } else if (type == "reading") {
        if (m_readingAccuracy != percent) {
            m_readingAccuracy = percent;
            emit readingAccuracyChanged();
            updateWeakestSubject(); // 正确率变化时重新计算最薄弱科目
        }
    } else if (type == "listening") {
        if (m_listeningAccuracy != percent) {
            m_listeningAccuracy = percent;
            emit listeningAccuracyChanged();
            updateWeakestSubject(); // 正确率变化时重新计算最薄弱科目
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

// 学习状况相关实现函数
QString TabController::currentLevel() const
{
    return m_currentLevel;
}

int TabController::studyDays() const
{
    return m_studyDays;
}

int TabController::todayProgress() const
{
    return m_todayProgress;
}

QString TabController::weakestSubject() const
{
    return m_weakestSubject;
}

int TabController::studyTimeToday() const
{
    return m_studyTimeToday;
}

int TabController::totalStudyTime() const
{
    return m_totalStudyTime;
}

void TabController::setCurrentLevel(const QString &level)
{
    if (m_currentLevel != level) {
        m_currentLevel = level;
        emit currentLevelChanged();
    }
}

void TabController::switchToNextLevel()
{
    QStringList levels = {"N5", "N4", "N3", "N2", "N1"};
    int currentIndex = levels.indexOf(m_currentLevel);
    
    if (currentIndex == -1) {
        // 如果当前等级不在列表中，默认设为N2
        setCurrentLevel("N2");
    } else {
        // 循环切换到下一个等级
        int nextIndex = (currentIndex + 1) % levels.size();
        setCurrentLevel(levels[nextIndex]);
    }
}

void TabController::updateWeakestSubject()
{
    int minRate = qMin(qMin(m_vocabularyAccuracy, m_grammarAccuracy),
                       qMin(m_readingAccuracy, m_listeningAccuracy));

    QString newWeakest;
    if (minRate == m_vocabularyAccuracy) {
        newWeakest = "文字・語彙";
    } else if (minRate == m_grammarAccuracy) {
        newWeakest = "文法";
    } else if (minRate == m_readingAccuracy) {
        newWeakest = "読解";
    } else {
        newWeakest = "聽解";
    }

    if (m_weakestSubject != newWeakest) {
        m_weakestSubject = newWeakest;
        emit weakestSubjectChanged();
    }
}

void TabController::updateStudyTime(int minutesToday, int totalHours)
{
    if (m_studyTimeToday != minutesToday) {
        m_studyTimeToday = minutesToday;
        emit studyTimeTodayChanged();
    }
    
    if (m_totalStudyTime != totalHours) {
        m_totalStudyTime = totalHours;
        emit totalStudyTimeChanged();
    }
}








