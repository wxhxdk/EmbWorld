#ifndef TABCONTROLLER_H
#define TABCONTROLLER_H

#include <QObject>
#include <QString>

class TabController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentIndex READ currentIndex WRITE setCurrentIndex NOTIFY currentIndexChanged)
    Q_PROPERTY(QString currentTab READ currentTab NOTIFY currentTabChanged)

public:
    explicit TabController(QObject *parent = nullptr);

    int currentIndex() const;
    QString currentTab() const;

public slots:
    void setCurrentIndex(int index);
    void switchToTab(int index);
    void switchToTabByName(const QString &tabName);


signals:
    void currentIndexChanged();
    void currentTabChanged();

private:
    int m_currentIndex;
    QStringList m_tabNames;
};

#endif // TABCONTROLLER_H







