using Toybox.WatchUi;

class BehaviorDelegate extends WatchUi.BehaviorDelegate {
    private var _parentView as contacts_widgetView;

    function initialize(view as contacts_widgetView) {
        BehaviorDelegate.initialize();
        _parentView = view;
        
    }
    public function onSelect() {
        _parentView.onSelectPress();
        return true;
    }
}