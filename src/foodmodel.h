/*
 * foodmodel.h
 *
 *  Created on: 2013-09-28
 *      Author: Roblix
 */

#ifndef FOODMODEL_H_
#define FOODMODEL_H_

//#include <QString>

class FOOD_ITEM
{
	public:
	double calories;	    // how many calories this has
	int moodIndex; 		    // value -5 to 5, for your current mood
	int choiceIndex;        // value -5 to 5, for how good of a choice this item is
	QString pictureURL;     // location of the picture (if used)
	QString description;	// a string indicating what food item this is

};


#endif /* FOODMODEL_H_ */
