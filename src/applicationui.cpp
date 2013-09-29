
#include "applicationui.hpp"
#include "foodmodel.h"
#include <bb/cascades/multimedia/CameraSettings>
#include <Qt/qdeclarativedebug.h>
#include <QtCore/QObject>
#include <QtCore/QMetaType>
#include <bb/cascades/multimedia/Camera>

#include <bb/cascades/Application>

using namespace bb::cascades;
using namespace bb::cascades::multimedia;


foodmodel 	*foodModel;
ApplicationUI::ApplicationUI(bb::cascades::Application *app) :
        QObject(app)
{
	qml = QmlDocument::create("asset:///main.qml");
	qml->setContextProperty("ApplicationUI", this);
	foodModel= new foodmodel(this);
	qml->setContextProperty("_foodDataModel", foodModel);

	if (!qml->hasErrors())
	{
		// The application Page is created from QML.
		NavigationPane *appPage = qml->createRootObject<NavigationPane>();

		if (appPage)
		{
			// Set the application scene.
			Application::instance()->setScene(appPage);
		}
	}
}

void ApplicationUI::onSystemLanguageChanged()
{
    QCoreApplication::instance()->removeTranslator(m_pTranslator);
    // Initiate, load and install the application translation files.
    QString locale_string = QLocale().name();
    QString file_name = QString("foodographer_%1").arg(locale_string);
    if (m_pTranslator->load(file_name, "app/native/qm")) {
        QCoreApplication::instance()->installTranslator(m_pTranslator);
    }
}

void ApplicationUI::AddFoodItem(QString imageUrl, QString description, int calorieValue, int faceSelection, double sliderValue, QString time)
{
	foodModel->AddItem(imageUrl, description, calorieValue, faceSelection, sliderValue, time);
}
