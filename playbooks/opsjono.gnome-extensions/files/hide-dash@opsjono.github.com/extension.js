const { St, Shell } = imports.gi;
const Main = imports.ui.main;

const Me = imports.misc.extensionUtils.getCurrentExtension();

class Extension {
    constructor() {
        this._dash = Main.overview.dash;
    }

    enable() {
        this._dash.hide();
    }

    disable() {
        this._dash.show();
    }
}


// Called on gnome-shell loading, even if extension is deactivated
function init() {
    return new Extension();
}