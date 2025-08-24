#ifndef TABCONTROLLER_H
#define TABCONTROLLER_H

#include <QObject>
#include <QString>
#include <QStringList>
#include <QVariantMap>

class TabController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentIndex READ currentIndex WRITE setCurrentIndex NOTIFY currentIndexChanged)
    Q_PROPERTY(QString currentTab READ currentTab NOTIFY currentTabChanged)

    // JLPT 相关数据属性
    Q_PROPERTY(int realQuestionsAccuracy READ realQuestionsAccuracy NOTIFY realQuestionsAccuracyChanged)
    Q_PROPERTY(int mockExamAccuracy READ mockExamAccuracy NOTIFY mockExamAccuracyChanged)
    Q_PROPERTY(int keyQuestionsAccuracy READ keyQuestionsAccuracy NOTIFY keyQuestionsAccuracyChanged)
    Q_PROPERTY(int grammarAccuracy READ grammarAccuracy NOTIFY grammarAccuracyChanged)
    Q_PROPERTY(int vocabularyAccuracy READ vocabularyAccuracy NOTIFY vocabularyAccuracyChanged)
    Q_PROPERTY(int readingAccuracy READ readingAccuracy NOTIFY readingAccuracyChanged)
    Q_PROPERTY(int listeningAccuracy READ listeningAccuracy NOTIFY listeningAccuracyChanged)
    
    // 学习状况相关数据属性
    Q_PROPERTY(QString currentLevel READ currentLevel WRITE setCurrentLevel NOTIFY currentLevelChanged)
    Q_PROPERTY(int studyDays READ studyDays NOTIFY studyDaysChanged)
    Q_PROPERTY(int todayProgress READ todayProgress NOTIFY todayProgressChanged)
    Q_PROPERTY(QString weakestSubject READ weakestSubject NOTIFY weakestSubjectChanged)
    Q_PROPERTY(int studyTimeToday READ studyTimeToday NOTIFY studyTimeTodayChanged)
    Q_PROPERTY(int totalStudyTime READ totalStudyTime NOTIFY totalStudyTimeChanged)

public:
    explicit TabController(QObject *parent = nullptr);

    int currentIndex() const;
    QString currentTab() const;

    // JLPT 数据读取函数
    int realQuestionsAccuracy() const;
    int mockExamAccuracy() const;
    int keyQuestionsAccuracy() const;
    int grammarAccuracy() const;
    int vocabularyAccuracy() const;
    int readingAccuracy() const;
    int listeningAccuracy() const;
    
    // 学习状况数据读取函数
    QString currentLevel() const;
    int studyDays() const;
    int todayProgress() const;
    QString weakestSubject() const;
    int studyTimeToday() const;
    int totalStudyTime() const;
    
    // 等级设置函数
    void setCurrentLevel(const QString &level);

public slots:
    void setCurrentIndex(int index);
    void switchToTab(int index);
    void switchToTabByName(const QString &tabName);

    // JLPT 数据更新函数
    void updateRate(const QString &type, int percent);
    void updateAllRates(const QVariantMap &rateData);
    QVariantMap getAllRates() const;
    
    // 学习状况数据更新函数
    void updateWeakestSubject();
    void updateStudyTime(int minutesToday, int totalHours);
    
    // 等级选择函数
    void switchToNextLevel();

signals:
    void currentIndexChanged();
    void currentTabChanged();

    // JLPT 数据变化信号
    void realQuestionsAccuracyChanged();
    void mockExamAccuracyChanged();
    void keyQuestionsAccuracyChanged();
    void grammarAccuracyChanged();
    void vocabularyAccuracyChanged();
    void readingAccuracyChanged();
    void listeningAccuracyChanged();
    
    // 学习状况数据变化信号
    void currentLevelChanged();
    void studyDaysChanged();
    void todayProgressChanged();
    void weakestSubjectChanged();
    void studyTimeTodayChanged();
    void totalStudyTimeChanged();

private:
    int m_currentIndex;
    QStringList m_tabNames;

    // JLPT 数据成员变量
    int m_realQuestionsAccuracy;
    int m_mockExamAccuracy;
    int m_keyQuestionsAccuracy;
    int m_grammarAccuracy;
    int m_vocabularyAccuracy;
    int m_readingAccuracy;
    int m_listeningAccuracy;
    
    // 学习状况数据成员变量
    QString m_currentLevel;
    int m_studyDays;
    int m_todayProgress;
    QString m_weakestSubject;
    int m_studyTimeToday;    // 今日学习时间（分钟）
    int m_totalStudyTime;    // 总学习时间（小时）
};

#endif // TABCONTROLLER_H







