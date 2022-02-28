package com.example.vntlab.ihomesystem2;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Switch;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void onSwitchClicked(View view) {
        Switch switchBtn = (Switch) findViewById(R.id.swt_statusLamp);
        TextView switchText = (TextView) findViewById(R.id.txt_statusLamp);
        ImageView imgBackgound = (ImageView) findViewById(R.id.img_background);
        ImageView imgLamp = (ImageView) findViewById(R.id.img_lamp);

        if (switchBtn.isChecked()) {

        } else {

        }
    }
}
