package com.cheeseb.example2;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.util.Log;
import android.widget.FrameLayout;

import com.cheeseb.example2.lib.LukaSharingPreferences;

import butterknife.BindView;
import butterknife.ButterKnife;


public class MainActivity extends AppCompatActivity {

    @BindView(R.id.fl_container) FrameLayout flMainContainer;
    BroadcastReceiver mReceiver = null;
    LukaSharingPreferences pref;

    Fragment fm;
    FragmentManager manager;

    public static String BROADCAST_ACTION = "com.cheeseb.example2.action.SEND";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);
    }

    @Override
    protected void onResume(){
        super.onResume();
        myRegisterReceiver();
        init();
    }

    private void init() {

        fm = BlankFragment.newInstance();
        manager = getSupportFragmentManager();
        manager.beginTransaction().replace(R.id.fl_container, fm).commit();

    }

    @Override
    protected void onPause(){
        super.onPause();
        myUnregisterReceiver();
    }

    private void myRegisterReceiver(){

        if(mReceiver != null) return;

        IntentFilter filter = new IntentFilter();
        filter.addAction(BROADCAST_ACTION);
        filter.addCategory(Intent.CATEGORY_DEFAULT);

        mReceiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                Log.d("////////////////////","리시브 받음");

                if(intent.hasExtra("name") && intent.hasExtra("age") && intent.hasExtra("student")) {

                    pref.putKey("name", intent.getExtras().getString("name"));
                    pref.putKey("age", intent.getExtras().getInt("age"));
                    pref.putKey("student", intent.getExtras().getBoolean("student"));

                    Log.d("////////////////////","키 넣음");
                }
            }
        };
        registerReceiver(mReceiver, filter);
    }

    private void myUnregisterReceiver(){
        if(mReceiver != null){
            unregisterReceiver(mReceiver);
            mReceiver = null;
        }

    }
}
