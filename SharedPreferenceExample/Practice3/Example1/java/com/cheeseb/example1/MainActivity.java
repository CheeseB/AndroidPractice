package com.cheeseb.example1;

import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.cheeseb.example1.lib.LukaSharingPreferences;

import butterknife.BindView;
import butterknife.ButterKnife;

public class MainActivity extends AppCompatActivity {

    LukaSharingPreferences pref;

    @BindView(R.id.btn_next) Button btnNext;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);

        init();
    }

    private void init() {
        pref = new LukaSharingPreferences(this);

        pref.putKey("name", "Sophia");
        pref.putKey("age", 23);
        pref.putKey("student", true);


        btnNext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent();
                intent.setAction("com.cheeseb.example2.ACTION_SEND");
                intent.setFlags(Intent.FLAG_INCLUDE_STOPPED_PACKAGES);
                intent.setComponent(new ComponentName("com.cheeseb.example2", "com.cheeseb.example2.MainActivity"));

                intent.putExtra("name", pref.getValue("name", ""));
                intent.putExtra("age", pref.getValue("age", -1));
                intent.putExtra("student", pref.getValue("student", false));

                sendBroadcast(intent);

                Toast.makeText(MainActivity.this, "데이터 전송 완료", Toast.LENGTH_SHORT).show();

            }
        });
    }

}
