package com.cheeseb.gson;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;

import com.google.gson.Gson;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.InputStream;
import java.util.ArrayList;


public class MainActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    private ArrayList<MantaVO> getMantaList(){
        ArrayList<MantaVO> list = new ArrayList<>();
        Gson gson = new Gson();

        try{
            InputStream is = getAssets().open("Manta.json");
            byte[] buffer = new byte[is.available()];
            is.read(buffer);
            is.close();
            String json = new String(buffer,"UTF-8");

            JSONObject jsonObject = new JSONObject(json);
            JSONArray jsonArray = jsonObject.getJSONArray("list");

            int index = 0;
            while(index < jsonArray.length()){
                MantaVO mantaVO = gson.fromJson(jsonArray.get(index).toString(), MantaVO.class);
                list.add(mantaVO);

                index++;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

}
