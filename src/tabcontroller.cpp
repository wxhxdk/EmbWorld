#include "tabcontroller.h"

TabController::TabController(QObject *parent)
    : QObject(parent)
    , m_currentIndex(0)
    , m_realQuestionsAccuracy(76)
    , m_mockExamAccuracy(89)
    , m_keyQuestionsAccuracy(78)
    , m_randomQuestionsAccuracy(85)
    , m_grammarAccuracy(85)
    , m_vocabularyAccuracy(55)
    , m_readingAccuracy(92)
    , m_listeningAccuracy(45)
    , m_currentLevel("N2")
    , m_studyDays(15)
    , m_todayProgress(75)
    , m_studyTimeToday(15)    // 今日学习时间：15分钟
    , m_totalStudyTime(25)    // 总学习时间：25小时
    , m_examDaysLeft(0)       // 初始化为0，将由updateExamCountdown计算
    , m_examDate("")          // 初始化为空，将由updateExamCountdown计算
    , m_countdownColor("#4CAF50") // 默认绿色
{
    m_tabNames = {"JLPT", "ITJA", "听力", "会话", "学伴", "我的"};
    updateWeakestSubject();
    updateExamCountdown();
    updateCountdownColor();
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

int TabController::randomQuestionsAccuracy() const
{
    return m_randomQuestionsAccuracy;
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
    } else if (type == "randomQuestions") {
        if (m_randomQuestionsAccuracy != percent) {
            m_randomQuestionsAccuracy = percent;
            emit randomQuestionsAccuracyChanged();
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
    if (rateData.contains("randomQuestions")) {
        updateRate("randomQuestions", rateData["randomQuestions"].toInt());
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
    rates["randomQuestions"] = m_randomQuestionsAccuracy;
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

// 考试倒计时相关实现函数
int TabController::examDaysLeft() const
{
    return m_examDaysLeft;
}

QString TabController::examDate() const
{
    return m_examDate;
}

QString TabController::countdownColor() const
{
    return m_countdownColor;
}

void TabController::setCurrentLevel(const QString &level)
{
    if (m_currentLevel != level) {
        m_currentLevel = level;
        emit currentLevelChanged();
    }
}

void TabController::setExamDate(const QString &date)
{
    if (m_examDate != date) {
        m_examDate = date;
        emit examDateChanged();
        updateExamCountdown();
        updateCountdownColor();
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

void TabController::updateExamCountdown()
{
    // 计算下次考试日期
    QDate nextExamDate = calculateNextExamDate();
    
    // 更新考试日期字符串
    QString newExamDate = formatExamDate(nextExamDate);
    if (m_examDate != newExamDate) {
        m_examDate = newExamDate;
        emit examDateChanged();
    }
    
    // 计算剩余天数
    QDate currentDate = QDate::currentDate();
    int newDaysLeft = currentDate.daysTo(nextExamDate);
    
    if (m_examDaysLeft != newDaysLeft) {
        m_examDaysLeft = newDaysLeft;
        emit examDaysLeftChanged();
    }
}

void TabController::updateCountdownColor()
{
    QString newColor;
    
    // 根据剩余天数决定颜色
    if (m_examDaysLeft >= 45) {
        newColor = "#4CAF50"; // 绿色：45天以上
    } else if (m_examDaysLeft >= 30) {
        newColor = "#FF9500"; // 橙色：30-44天
    } else if (m_examDaysLeft >= 15) {
        newColor = "#FF6B35"; // 橙红色：15-29天
    } else {
        newColor = "#FF3B30"; // 红色：14天以下
    }
    
    if (m_countdownColor != newColor) {
        m_countdownColor = newColor;
        emit countdownColorChanged();
    }
}

QDate TabController::calculateNextExamDate() const
{
    QDate currentDate = QDate::currentDate();
    int currentYear = currentDate.year();
    
    // 计算7月和12月的第一个周日
    QDate julyFirstSunday = findFirstSundayOfMonth(currentYear, 7);
    QDate decemberFirstSunday = findFirstSundayOfMonth(currentYear, 12);
    
    // 找到下一次考试日期
    if (currentDate <= julyFirstSunday) {
        // 如果还没到今年7月的考试，返回7月考试
        return julyFirstSunday;
    } else if (currentDate <= decemberFirstSunday) {
        // 如果还没到今年12月的考试，返回12月考试
        return decemberFirstSunday;
    } else {
        // 如果今年的考试都过了，返回明年7月的考试
        return findFirstSundayOfMonth(currentYear + 1, 7);
    }
}

QDate TabController::findFirstSundayOfMonth(int year, int month) const
{
    // 找到指定年月的第一天
    QDate firstDay(year, month, 1);
    
    // 获取第一天是周几（Qt中周一是1，周日是7）
    int dayOfWeek = firstDay.dayOfWeek();
    
    // 计算到第一个周日需要的天数
    int daysToFirstSunday;
    if (dayOfWeek == 7) {
        // 如果第一天就是周日
        daysToFirstSunday = 0;
    } else {
        // 否则计算到下一个周日的天数
        daysToFirstSunday = 7 - dayOfWeek;
    }
    
    return firstDay.addDays(daysToFirstSunday);
}

QString TabController::formatExamDate(const QDate &date) const
{
    // 格式化为 YYYY-MM-DD 格式
    return date.toString("yyyy-MM-dd");
}








