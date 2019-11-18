package com.cheeseb.myapplication;


import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.fragment.app.Fragment;

import com.cheeseb.myapplication.lib.LukaSharingPreferences;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.Unbinder;


/**
 * A simple {@link Fragment} subclass.
 */
public class BlankFragment extends Fragment {


    LukaSharingPreferences pref;

    @BindView(R.id.tv_result1) TextView tvResult1;
    @BindView(R.id.tv_result2) TextView tvResult2;
    @BindView(R.id.tv_result3) TextView tvResult3;
    private Unbinder mUnbinder;

    public BlankFragment() {
        // Required empty public constructor
    }

    public static BlankFragment newInstance() {

        Bundle args = new Bundle();

        BlankFragment fragment = new BlankFragment();
        fragment.setArguments(args);
        return fragment;
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_blank, container, false);
        mUnbinder = ButterKnife.bind(this, view);
        pref = new LukaSharingPreferences(getContext());
        init();
        return view;
    }

    private void init(){
        tvResult1.setText(pref.getValue("name", ""));
        tvResult2.setText(String.valueOf(pref.getValue("age", -1)));
        tvResult3.setText(String.valueOf(pref.getValue("student", false)));
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        mUnbinder.unbind();
    }
}
