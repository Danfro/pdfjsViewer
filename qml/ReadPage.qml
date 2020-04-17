import QtQuick 2.0
import Ubuntu.Components 1.1
import Morph.Web 0.1
import QtWebEngine 1.7
Page {
    property string fileUrl
    property string webviewUrl: "../www/web/viewer.html?file=" + fileUrl
    WebEngineView {
        id: webview

        width: parent.width
        height: parent.height
        url: Qt.resolvedUrl(webviewUrl);
        // preferences.allowUniversalAccessFromFileUrls: true
        // preferences.localStorageEnabled: true
        profile: webViewProfile
        zoomFactor: 1.5
        // filePicker: ContentPickerDialog { }
        // alertDialog: AlertDialog { }
        // popupMenu: PopupMenu { }
    }
    WebEngineProfile {
        //for more profile options see https://doc.qt.io/qt-5/qml-qtwebengine-webengineprofile.html
        id: webViewProfile
        httpCacheType: WebEngineProfile.DiskHttpCache; //cache qml content to file
    }

    // flickable: webview
}
