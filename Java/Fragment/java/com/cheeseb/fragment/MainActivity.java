package com.cheeseb.fragment;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import android.os.Bundle;
import android.view.View;

public class MainActivity extends AppCompatActivity implements View.OnClickListener, Page1.OnFragmentInteractionListener {

    private Page2 page2;

    FragmentManager fm;
    FragmentTransaction tran;
    FirstFrag frag1;
    SecondFrag frag2;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        frag1 = new FirstFrag();
        frag2 = new SecondFrag();
        setFrag(0);

        page2 = new Page2();
    }

    @Override
    public void onClick(View v){
        switch(v.getId()){
            case R.id.bt1:
                setFrag(0);
                break;

            case R.id.bt2:
                setFrag(1);
                break;
        }
    }

    @Override
    public void onFragmentInteraction(String text) {
        page2.setTextView(text);
    }

    private void setFrag(int n) {
        fm = getSupportFragmentManager();
        tran = fm.beginTransaction();

        switch(n){
            case 0:
                tran.replace(R.id.main_frame, frag1);
                tran.commit();
                break;

            case 1:
                tran.replace(R.id.main_frame, frag2);
                tran.commit();
                break;
        }
    }
}
