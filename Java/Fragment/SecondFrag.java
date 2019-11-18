package com.cheeseb.fragment;

import android.content.Context;
import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentStatePagerAdapter;
import androidx.viewpager.widget.ViewPager;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;


public class SecondFrag extends Fragment implements Page1.OnFragmentInteractionListener{
    private Page2 page2;

    View view;
    ViewPager vp;

    public SecondFrag() {}

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        page2 = new Page2();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_second, container, false);

        vp = view.findViewById(R.id.vp);

        vp.setAdapter(new pagerAdapter(getFragmentManager()));
        vp.setCurrentItem(0);

        return view;
    }


    private class pagerAdapter extends FragmentStatePagerAdapter {

        public pagerAdapter(FragmentManager fm){
            super(fm);
        }

        @Override
        public Fragment getItem(int position){
            switch(position){
                case 0:
                    return new Page1();
                case 1:
                    return new Page2();
                default:
                    return null;
            }
        }

        @Override
        public int getCount(){
            return 2;
        }
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
    }

    @Override
    public void onDetach() {
        super.onDetach();
    }

    @Override
    public void onFragmentInteraction(String text) {
        page2.setTextView(text);
    }
}
