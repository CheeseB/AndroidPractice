package com.cheeseb.cluster;

import com.google.android.gms.maps.model.LatLng;
import com.google.maps.android.clustering.ClusterItem;


/* 클러스터에 포함될 마커들을 정의하는 클래스 */
public class MyItem implements ClusterItem {

    private final LatLng mPosition;
    private String mTitle;
    private String mSnippet;

    private String mInfo;

    public MyItem(double lat, double lng) {
        mPosition = new LatLng(lat, lng);
    } //위도, 경도 정보만 가지는 생성자

    //이 생성자로 객체를 생성하면 개별 마커를 클릭할 때 title, snippen 정보가 담긴 말풍선이 뜸
    public MyItem(double lat, double lng, String title, String snippet) { //위도, 경도, 타이틀, 보조설명 정보를 가지는 생성자
        mPosition = new LatLng(lat, lng);
        mTitle = title;
        mSnippet = snippet;
    }

    public MyItem(double lat, double lng, String info){ //위도, 경도, Info 정보를 가지는 생성자 (새로 만든 생성자)
        mPosition = new LatLng(lat, lng);
        mInfo = info;
    }

    @Override
    public LatLng getPosition() { //위치정보 반환
        return mPosition;
    }

    @Override
    public String getTitle() {
        return mTitle;
    } //타이틀 반환

    @Override
    public String getSnippet() {
        return mSnippet;
    } //보조설명 반환

    public  String getInfo() {
        return mInfo;
    } //세번째 생성자로 만든 객체의 info 반환

}
