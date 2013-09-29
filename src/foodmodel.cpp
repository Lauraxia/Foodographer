/*
 * foodmodel.cpp
 *
 *  Created on: 2013-09-28
 *      Author: Laura
 */

#include "foodmodel.h"
#include "applicationui.hpp"
#include <bb/cascades/Application>
#include <QTime>
#include <bb/data/XmlDataAccess>

using namespace bb::cascades;
using namespace bb::data;

foodmodel::foodmodel(ApplicationUI *parent)
{
	appui = parent;
	//masterListFile = "master.xml";
	//readMaster();


}

void foodmodel::AddItem(QString imageUrl, QString description, int calorieValue, int faceSelection, double sliderValue, QString time)
{
	QVariantList displayList;

		//stupid hack: insert a blank item first to attempt to circumvent draw/recycling issues
		//with the first listitem:

		QVariantMap newList;
			newList.insert("imageUrl", imageUrl);
			newList.insert("description", description);
			newList.insert("calorieValue", calorieValue);
			newList.insert("faceSelection", faceSelection);
			newList.insert("sliderValue", sliderValue);
			newList.insert("time", QTime::currentTime().toString() );

			displayList.append(newList);

		//this->clear();
			//this->
			append(displayList);
			//qDebug() << "network error!";
}

void foodmodel::writeMaster()
{
/*	// Add the employee list to a top-level QVariantMap, then wrap it in a QVariant
	QVariantMap topLevelMasterFoodTable;
	topLevelMasterFoodTable[".root"] = QVariant("masterfoodtable");
	topLevelMasterFoodTable["day"] = QVariant(masterList);
	QVariant myData = QVariant(topLevelMasterFoodTable);

	// Retrieve the working directory, and create a temporary .xml file in that location
	QDir home = QDir::home();
	QTemporaryFile file(home.absoluteFilePath(masterListFile));

	// Open the file that was created
	if (file.open())
	{
	    // Create an XmlDataAccess object and save the data to the file
	   // XmlDataAccess xda;
	    xda.save(myData, &file);
	}*/

}

void foodmodel::readMaster()
{

/*	// Create a data model with sorting keys for <day>
	GroupDataModel *model =
	new GroupDataModel(QStringList() << "time" << "mood" << "calories" << "goodness" << "picture" << "description");

	// Load the XML data from local file
	XmlDataAccess xda;
	QVariant list = xda.load(masterListFile, "/masterfoodtable/day");

	// Add the data to the model
	model->insertList(list.value<QVariantList>());

	// keep master list...
	masterList = list.value<QVariantList>();*/

}



