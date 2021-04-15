#pragma once
#include <QObject>
#include <QString>
#include <qqml.h>
#include <QtSql>
#include <vector>

const QString DATABASE_NAME = "carlist";
const QString MANUFACTURER_FIELD = "manufacturer";
const int THRESHOLDS = 10;
extern std::vector<QString> manufacturersList;


class CarClass : public QObject
{
	Q_OBJECT
	QML_ELEMENT
	
public:
	
	explicit CarClass(QObject *parent = nullptr);
		
	//retrieve manufacturers for the first ComboBox on NewCarPopup
	Q_INVOKABLE static int getManufacturersSize();
	Q_INVOKABLE static QString getManufacturer(const int number);
	
	//retrieve info about desired car
	Q_INVOKABLE void generateQuery(const QString& manufacturer, const QString& model);
	Q_INVOKABLE int getThreshold(const int number);
	
	
	static void fillManufacturersList();
		
private:
	
	QString _manufacturer;
	QString _model;
	int _thresholds[THRESHOLDS];	
};
