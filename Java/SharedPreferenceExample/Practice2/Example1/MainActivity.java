package com.cheeseb.example1;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

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

        /* SharedPreference 에 키, 값 저장 */
        pref.putKey("name", "Sophia");
        pref.putKey("age", 23);
        pref.putKey("student", true);


        btnNext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                /* 두번째 앱으로 넘어가기 위해 인텐트 생성 */
                Intent intent = getPackageManager().getLaunchIntentForPackage("com.cheeseb.example2");
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

                /* 두번째 앱에 인텐트로 값 넘겨주기 */
                intent.putExtra("name", pref.getValue("name", ""));
                intent.putExtra("age", pref.getValue("age", -1));
                intent.putExtra("student", pref.getValue("student", false));

                startActivity(intent);

            }
        });
    }

}
