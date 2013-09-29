#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/Container>
#include <bb/system/SystemUiResult>
#include <bb/cascades/NavigationPane>
#include <bb/cascades/Application>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/LocaleHandler>
#include <bb/cascades/multimedia/CameraSettings>
#include <bb/cascades/multimedia/Camera>
#include <bb/multimedia/SystemSound>
#include <bb/cascades/TouchEvent>
#include <bb/system/SystemToast>

namespace bb
{
    namespace cascades
    {
        class Application;
        class LocaleHandler;
    }
}
using namespace bb::cascades;
using namespace bb::multimedia;
using namespace bb::cascades::multimedia;

class QTranslator;

/*!
 * @brief Application object
 *
 *
 */

class ApplicationUI : public QObject
{
    Q_OBJECT
public:
    ApplicationUI(bb::cascades::Application *app);
    Q_INVOKABLE void AddFoodItem(QString imageUrl, QString description, int calorieValue, int faceSelection, double sliderValue, QString time);
    virtual ~ApplicationUI() { }
private slots:
    void onSystemLanguageChanged();
private:
    QTranslator* m_pTranslator;
    bb::cascades::LocaleHandler* m_pLocaleHandler;
    QmlDocument *mQmlDocument;
};

#endif /* ApplicationUI_HPP_ */
