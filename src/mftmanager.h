/*
 * mftmanager.h
 *
 *  Created on: 2013-09-28
 *      Author: Roblix
 */

#ifndef MFTMANAGER_H_
#define MFTMANAGER_H_


#include <QString>
#include <QVariant>
#include <QVariantList>
#include <bb/data/XmlDataAccess>
#include <bb/cascades/GroupDataModel>

using namespace bb::cascades;

class MFT_MANAGER
{
	public:
	QString masterListFile;
	//QList<FOOD_ITEM*> foodArray;
	QVariantList masterList;

	// class functions
	MFT_MANAGER();
	//void addItem(FOOD_ITEM & Ref);
	//void removeItem(FOOD_ITEM & Ref);
	void writeMaster();
	void readMaster();


};


#endif /* MFTMANAGER_H_ */
