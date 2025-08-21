import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

class contacts_widgetView extends WatchUi.View {

    hidden var contactsList as Lang.Array<Lang.Dictionary> = [];
    hidden var contactsIndex as Number = 0;

    function initialize() {
        View.initialize();
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        
        // Load contacts from properties
        contactsList = [];
        for (var i = 0; i <= 10; i += 1) {
            var name = Properties.getValue("contact-" + i + "-name");
            var mobileNumber = Properties.getValue("contact-" + i + "-mobile-number");
            if ((name != null && name.length() != 0) || (mobileNumber != null && mobileNumber.length() != 0)) {
                contactsList.add({"name" => name, "mobileNumber" => mobileNumber});
            }
        }

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        if (contactsList.size() == 0) {
            drawConfigurationHint(dc);
        }else{
            drawContact(dc, contactsIndex);
        }
    }

    function drawContact(dc as Dc, index) as Void {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth() / 2, 0, Graphics.FONT_SMALL, index, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(dc.getWidth() / 2, (dc.getHeight() / 2) - 30, Graphics.FONT_SMALL, contactsList[index].get("name"), Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(dc.getWidth() / 2, (dc.getHeight() / 2) + 10, Graphics.FONT_SMALL, contactsList[index].get("mobileNumber"), Graphics.TEXT_JUSTIFY_CENTER);
    }

    function drawConfigurationHint(dc as Dc) as Void {
        var configureContactsHintString = WatchUi.loadResource(Rez.Strings.configureContactsHint);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth() / 2, (dc.getHeight() / 2) - 50, Graphics.FONT_TINY, Graphics.fitTextToArea(configureContactsHintString, Graphics.FONT_TINY, dc.getWidth()-10, dc.getHeight(), true), Graphics.TEXT_JUSTIFY_CENTER);
    }

    function onSelectPress(){
        contactsIndex += 1;
        if (contactsIndex >= contactsList.size()) {
            contactsIndex = 0;
        }
        WatchUi.requestUpdate();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
