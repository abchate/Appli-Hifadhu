public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        MobileNumberPlugin.registerWith(registrarFor("com.amorenew.mobile_number.MobileNumberPlugin()"));
    }
}