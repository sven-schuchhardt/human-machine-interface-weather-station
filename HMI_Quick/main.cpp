#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QUrl>

#include "lightsensor.h"
#include "EnvironmentalModel.h"
#include "environmentalsensor.h"
#include "simulatedata.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);


    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    LightSensor lightsensor;
    QQmlContext *ptrContext = engine.rootContext();
    ptrContext->setContextProperty("_lightsensor", &lightsensor);

/* Creating an instance of the Environmentalsensor class and then setting the context property of the
QML engine to the instance of the class. */
    Environmentalsensor environmentalSensor;
    ptrContext->setContextProperty("_environmentalsensor", &environmentalSensor);

    SimulateData simulateData;
    ptrContext->setContextProperty("_simulatedata", &simulateData);

    EnviromentalModel environmentalModel;
    ptrContext->setContextProperty("_enviromentalmodel", &environmentalModel);

    QCoreApplication::setApplicationName("HMI");
    QCoreApplication::setOrganizationName("HMIBoyz");
    QCoreApplication::setOrganizationDomain("1234");
    engine.load(url);



    return app.exec();
}
