
#include "applicationui.hpp"
#include "foodmodel.h"

using namespace bb::cascades;

foodmodel 	*foodModel;

ApplicationUI::ApplicationUI(bb::cascades::Application *app) :
        QObject(app)
{
	mQmlDocument = QmlDocument::create("asset:///main.qml").parent(this);;

	mQmlDocument->setContextProperty("ApplicationUI", this);

	AbstractPane *root = mQmlDocument->createRootObject<AbstractPane>();
	foodModel= new foodmodel(this);

	qDebug() << "Loading Contexts...";
	mQmlDocument->setContextProperty("_foodDataModel", foodModel);
	qDebug() << "Loaded!";

	NavigationPane *tabs;
	if (!mQmlDocument->hasErrors())
	{
		tabs = mQmlDocument->createRootObject<NavigationPane>();
		qDebug() << "yay";
		if (tabs)
		{
			// Set the main application scene to NavigationPane.
			Application::instance()->setScene(tabs);
			qDebug() << "okay";
		}
		else
		{
			qDebug() << "yikes";
		}
	}
	else
	{
		qDebug() << "oops";
	}

	app->setScene(root);
	qDebug() << "adding item";
	foodModel->AddItem();
	qDebug() << "item added";
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
