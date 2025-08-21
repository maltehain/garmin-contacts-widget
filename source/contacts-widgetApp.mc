import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class contacts_widgetApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        var view = new contacts_widgetView();
        var delegate = new BehaviorDelegate(view);
        return [ view, delegate ];
    }

    function onSettingsChanged() as Void {
        // Handle settings changes if necessary
        WatchUi.requestUpdate();
    }

}

function getApp() as contacts_widgetApp {
    return Application.getApp() as contacts_widgetApp;
}