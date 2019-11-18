package com.cheeseb.fragment;

import android.content.Context;
import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;


public class Page1 extends Fragment {
    private OnFragmentInteractionListener mListener;

    public Page1() {}

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_page1, container, false);

        final EditText editText = view.findViewById(R.id.edit);
        Button button = view.findViewById(R.id.input_btn);
        button.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                if (mListener != null) {
                    String input = editText.getText().toString();
                    mListener.onFragmentInteraction(input);
                }
            }
        });

        return view;
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnFragmentInteractionListener) {
            mListener = (OnFragmentInteractionListener) context;
        } else {
            throw new RuntimeException(context.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    public interface OnFragmentInteractionListener{
        void onFragmentInteraction(String text);
    }

}
