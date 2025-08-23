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

public slots:
    void setCurrentIndex(int index);
    void switchToTab(int index);
    void switchToTabByName(const QString &tabName);
    
    // JLPT 数据更新函数
    void updateRate(const QString &type, int percent);
    void updateAllRates(const QVariantMap &rateData);
    QVariantMap getAllRates() const;

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
};

#endif // TABCONTROLLER_H







