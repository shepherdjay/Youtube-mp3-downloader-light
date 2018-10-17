import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtWebView 1.1
import QtQuick.Dialogs 1.2

Window{
    id: root
    visible: true
    width: 640
    height: 480
    title: "Youtube MP3 Downloader Light"

    Rectangle {
        id: main
        x: 0
        y: 0
        width: 640
        height: 480
        border.width: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#97d9ec"
            }

            GradientStop {
                position: 1
                color: "#d2fff8"
            }
        }

        TextField {
            id: url
            x: 77
            y: 24
            width: 437
            height: 24
            placeholderText: qsTr("Search a video or type the URL.")
        }

        SearchButton {
            id: search_button
            x: 526
            y: 24
        }

        WebView{
            id: browser
            x: 77
            y: 66
            width: 474
            height: 314
            url:""

            onUrlChanged: {
                if(browser.url.toString().indexOf("watch") > 0){
                    console.log('o magrao clicou em algum video')
                    url.text = browser.url
                }

            }
        }

        TextField {
            id: destination_path
            x: 77
            y: 397
            width: 437
            height: 24
            placeholderText: qsTr("Paste the path or select the destination folder.")
        }

        SelectFolderButton {
            id: select_folder_button
            x: 526
            y: 397
        }

        FileDialog {
            id: folder_selection
            title: qsTr("Select the destination folder.")
            folder: shortcuts.music
            selectFolder: true

            onAccepted: {
                destination_path.text = folder_selection.folder.toString().replace("file:///", "")
            }
        }

        DownloadButton {
            id: download_button
            y: 427
            x: 246
        }
    }
}
