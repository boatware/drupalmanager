/**
 * Class MyApp.
 *
 * @author boatware <boatware@appletie.com>
 * @license MIT
 */
public class MyApp : Gtk.Application {

    /**
     * Default window height setting.
     *
     * @var int
     */
    private int default_window_height = 600;

    /**
     * Default window width setting.
     *
     * @var int
     */
    private int default_window_width = 800;

    /**
     * The displayed title of the app.
     *
     * @var string
     */
    private string app_name = "Foo Bar";

    /**
     * Constructor.
     */
    public MyApp () {
        Object (
            application_id: "com.github.boatware.drupalmanager",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    /**
     * Activates window rendering.
     */
    protected override void activate () {
        var main_window = this.prepareWindowWithDefaults ();
        Gtk.Button btn = this.createButton ("Lorem", 200);
        btn.clicked.connect (() => {
            btn.label = "Ipsum!";
            btn.sensitive = false;
        });

        main_window.add (btn);

        main_window.show_all ();
    }

    /**
     * Entrypoint of the whole program.
     */
    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }

    /**
     * Fetches a window instance from createWindow() and sets some defaults.
     *
     * @return Gtk.ApplicationWindow
     *   The ready-to-use window.
     */
    private Gtk.ApplicationWindow prepareWindowWithDefaults () {
        Gtk.ApplicationWindow win = this.createWindow ();
        win.default_height = this.default_window_height;
        win.default_width = this.default_window_width;
        win.title = this.app_name;

        return win;
    }

    /**
     * Creates a simple window.
     *
     * @return Gtk.ApplicationWindow
     *   The created window.
     */
    private Gtk.ApplicationWindow createWindow () {
        return new Gtk.ApplicationWindow (this);
    }

    /**
     * Create button
     */
    private Gtk.Button createButton (string label = "Sample Button", int margin = 100) {
        Gtk.Button button = new Gtk.Button.with_label (label);
        button.margin = margin;

        return button;
    }
}
