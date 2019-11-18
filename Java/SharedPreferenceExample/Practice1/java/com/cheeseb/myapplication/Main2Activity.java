package com.cheeseb.myapplication;

import android.os.Bundle;
import android.widget.FrameLayout;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import butterknife.BindView;
import butterknife.ButterKnife;

public class Main2Activity extends AppCompatActivity {


    @BindView(R.id.fl_main2_container) FrameLayout flMain2Container;

    Fragment fm;
    FragmentManager manager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
        ButterKnife.bind(this);
        init();
    }

    private void init() {

        fm = BlankFragment.newInstance();
        manager = getSupportFragmentManager();
        manager.beginTransaction().replace(R.id.fl_main2_container, fm).commit();



    }
}
