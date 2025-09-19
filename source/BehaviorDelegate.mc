import Toybox.Lang;
import Toybox.WatchUi;

class BehaviorDelegate extends WatchUi.BehaviorDelegate {
    private var _parentView as contacts_widgetView;

    function initialize(view as contacts_widgetView) {
        BehaviorDelegate.initialize();
        _parentView = view;
        
    }

    //! Handle the select button
    //! @return true if handled, false otherwise
    public function onSelect() as Boolean {
        _parentView.onSelectPress();
        System.println("Select Pressed");
        return true;
    }

    //! Handle a screen tap event
    //! @param evt The click event that occurred
    //! @return true if handled, false otherwise
    public function onTap(evt as ClickEvent) as Boolean {     
        _parentView.onSelectPress();
        return true;
    }
}