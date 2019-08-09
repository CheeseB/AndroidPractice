package com.cheeseb.example2;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.cheeseb.example2.lib.LukaSharingPreferences;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.Unbinder;


/**
 * A simple {@link Fragment} subclass.
 */
public class BlankFragment extends Fragment {

    LukaSharingPreferences pref;
    String name;
    Integer age;
    Boolean student;

    @BindView(R.id.tv_result1) TextView tvResult1;
    @BindView(R.id.tv_result2) TextView tvResult2;
    @BindView(R.id.tv_result3) TextView tvResult3;
    private Unbinder mUnbinder;

    public BlankFragment() {
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
        View view = inflater.inflate(R.layout.fragment_blank, container, false);
        mUnbinder = ButterKnife.bind(this, view);

        init();
        return view;
    }


    private void init(){

        pref = new LukaSharingPreferences(getContext());

        /* 액티비티의 flag 값이 true 일 때만 (intent 로 받은 값이 있을때만) 실행 */
        if(((MainActivity)getActivity()).flag){

            // bundle 로부터 데이터 받기
            name = getArguments().getString("name");
            age = getArguments().getInt("age");
            student = getArguments().getBoolean("student");

            // SharedPreference 에 데이터 저장
            pref.putKey("name", name);
            pref.putKey("age", age);
            pref.putKey("student", student);
        }

        // SharedPreference 에 저장된 값을 텍스트뷰에 출력
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
