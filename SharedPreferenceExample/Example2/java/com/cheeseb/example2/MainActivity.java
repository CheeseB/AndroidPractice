package com.cheeseb.example2;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import android.content.Intent;
import android.os.Bundle;
import android.widget.FrameLayout;

import butterknife.BindView;
import butterknife.ButterKnife;


public class MainActivity extends AppCompatActivity {

    @BindView(R.id.fl_container) FrameLayout flMainContainer;

    Fragment fm;
    FragmentManager manager;
    Intent intent;
    Bundle bundle;

    Boolean flag; // 이전 앱으로부터 새로운 데이터를 받았는지 판별하는 변수

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);

        flag = false; // flag 초기화
        init();
    }

    private void init() {

        intent = getIntent();
        bundle = new Bundle();

        /* 이전 앱으로부터 Intent 로 전달받은 데이터가 있을때만 실행 */
        if(intent.hasExtra("name") && intent.hasExtra("age") && intent.hasExtra("student")) {

            // Intent 로 받은 값들을 Bundle 에 저장
            bundle.putString("name", intent.getExtras().getString("name"));
            bundle.putInt("age", intent.getExtras().getInt("age"));
            bundle.putBoolean("student", intent.getExtras().getBoolean("student"));

            flag = true; // flag 값 변경
        }

        fm = BlankFragment.newInstance();
        manager = getSupportFragmentManager();
        manager.beginTransaction().replace(R.id.fl_container, fm).commit();

        fm.setArguments(bundle); // 프래그먼트로 Bundle 데이터 전달

    }
}
