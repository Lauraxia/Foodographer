/*
 * foodmodel.h
 *
 *  Created on: 2013-09-28
 *      Author: Roblix
 */
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/QListDataModel>
#include <bb/cascades/GroupDataModel>
#include <bb/data/XmlDataAccess>
#include "applicationui.hpp"

#ifndef FOODMODEL_H_
#define FOODMODEL_H_

using namespace bb::cascades;
using namespace bb::data;
typedef bb::cascades::QListDataModel<QVariant> FoodListModel;



class FOOD_ITEM {
public:
	double calories;	    // how many calories this has
	int moodIndex; 		    // value -5 to 5, for your current mood
	int choiceIndex;     // value -5 to 5, for how good of a choice this item is
	QString pictureURL;     // location of the picture (if used)
	QString description;	// a string indicating what food item this is

};

class foodmodel: public FoodListModel
{
	Q_OBJECT
	//Q_PROPERTY(QString city READ city WRITE setLocations NOTIFY cityChanged)
	public:
		foodmodel(ApplicationUI *parent);
		Q_INVOKABLE void AddItem();
	private:
		ApplicationUI *appui;
		void writeMaster();
		void readMaster();

		QString masterListFile;
		QVariantList masterList;
		//XmlDataAccess xda;
};
#endif /* FOODMODEL_H_ */

