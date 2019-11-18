package com.cheeseb.fcm;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;

import com.google.firebase.messaging.FirebaseMessaging;


public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        /* 특정 토픽의 알림만 수신받을 수 있음 (All로 설정하면 전부 수신받음) */
        FirebaseMessaging.getInstance().subscribeToTopic("ALL");
    }
}
