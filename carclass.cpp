#include "carclass.h"

CarClass::CarClass(QObject *parent) : QObject(parent) 
{
	if (!manufacturersList.size())
		fillManufacturersList();
}


void CarClass::fillManufacturersList()
{
	QSqlQuery query;
	query.exec("SELECT COUNT (DISTINCT " + MANUFACTURER_FIELD + ") FROM " + DATABASE_NAME);
	query.next();
			
	int listSize = query.value(0).toInt();
	manufacturersList.reserve(listSize); // <-----------
	
	query.exec("SELECT DISTINCT " + MANUFACTURER_FIELD + " FROM " + DATABASE_NAME);
	query.next();
	for(int i = 0; i < listSize; i++)
	{
		manufacturersList.push_back(query.value(0).toString());
		query.next();
	}	
}


int CarClass::getManufacturersSize()
{
	return manufacturersList.size();
}


QString CarClass::getManufacturer(const int number)
{
	return manufacturersList.at(number);
}


void CarClass::generateQuery(const QString& manufacturer, const QString& model)
{
	QSqlQuery query;

	query.exec("SELECT Field3, Field4, Field5 FROM " + DATABASE_NAME + " WHERE " + MANUFACTURER_FIELD + " = '" + manufacturer + "'");
	query.next();
	
	if (!query.isValid())
	{
		printf("query is empty");
		return;
	}
	
	this->_manufacturer = manufacturer;
	this->_model = model;
	
	
	for (short int i = 0; i < 3; i++)
		this->_thresholds[i] = query.value(i).toInt();
}


int CarClass::getThreshold(const int number)
{
	return _thresholds[number];
}
