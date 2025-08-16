#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include "tabcontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // 应用信息
    app.setApplicationName("EmbWorld");
    app.setApplicationVersion("1.0.0");
    app.setOrganizationName("EmbWorld");
    app.setOrganizationDomain("embworld.com");

    // 使用 Material 风格(安卓风)
    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;

    // 实例化 C++ 控制器
    TabController tabController;
    engine.rootContext()->setContextProperty("tabController", &tabController);

    engine.addImportPath("qrc:/");

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    // 载入主界面
    engine.load(url);

    return app.exec();
}
