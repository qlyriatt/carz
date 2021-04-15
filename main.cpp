#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <carclass.h>
#include <QtSql>
#include <iostream>
#include <vector>
#include <QStandardPaths>


std::vector<QString> manufacturersList;


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif	
	QGuiApplication app(argc, argv);
	
	qmlRegisterType<CarClass>("carGeneration", 1, 0, "CarClass");
	
	
	
	QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
	db.setConnectOptions("QSQLITE_OPEN_READONLY");
	
	QFile dbBinary(":/carlist.db");
	if(!dbBinary.open(QIODevice::ReadOnly))
	{
		qDebug() << "no db binary";
		return -1;
	}	

	qDebug() << QStandardPaths::writableLocation(QStandardPaths::TempLocation);
	qDebug() << QStandardPaths::standardLocations(QStandardPaths::TempLocation);
	
//	if (!dbBinary.copy(QStandardPaths::TempLocation))
//	{
//		qDebug() << "did not copy to tmp file";
//		return -1;
//	}
	
	
	return 123;
	db.setDatabaseName("/home/forsaken/QtProjects/test10-final/carlist.db");
	if(!db.open())
	{
		printf("no database");
		return -1;
	}
	
	QQmlApplicationEngine engine;
	const QUrl url(QStringLiteral("qrc:/main.qml"));
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
					 &app, [url](QObject *obj, const QUrl &objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	}, Qt::QueuedConnection);
	engine.load(url);
	
		
	return app.exec();
}
