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

using namespace bb::cascades;

namespace bb
{
    namespace cascades
    {
        class Application;
        class LocaleHandler;
    }
}

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
    virtual ~ApplicationUI() { }
private slots:
    void onSystemLanguageChanged();
private:
    QTranslator* m_pTranslator;
    bb::cascades::LocaleHandler* m_pLocaleHandler;
    QmlDocument *mQmlDocument;
};

#endif /* ApplicationUI_HPP_ */
