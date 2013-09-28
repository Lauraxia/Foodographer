/*

 * mftmanager.cpp
 *
 *  Created on: 2013-09-28
 *      Author: Roblix


#include "mftmanager.h"

// inits default master food table
MFT_MANAGER::MFT_MANAGER()
{
	masterListFile = "master.xml";
	readMaster();
}

// dumps the qvariant list back into master file
void MFT_MANAGER::writeMaster()
{

	// Add the employee list to a top-level QVariantMap, then wrap it in a QVariant
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
	    XmlDataAccess xda;
	    xda.save(myData, &file);
	}


}

void MFT_MANAGER::readMaster()
{

	// Create a data model with sorting keys for <day>
	GroupDataModel *model =
	new GroupDataModel(QStringList() << "time" << "mood" << "calories" << "goodness" << "picture" << "description");

	// Load the XML data from local file
	XmlDataAccess xda;
	QVariant list = xda.load(masterListFile, "/masterfoodtable/day");

	// Add the data to the model
	model->insertList(list.value<QVariantList>());

	// keep master list...
	masterList = list.value<QVariantList>();

}
*/

