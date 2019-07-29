package com.cheeseb.cluster;

import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.fragment.app.FragmentActivity;

import android.os.Bundle;
import android.view.Menu;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.material.navigation.NavigationView;
import com.google.maps.android.clustering.Cluster;
import com.google.maps.android.clustering.ClusterManager;

import java.util.ArrayList;


public class MapsActivity extends FragmentActivity implements OnMapReadyCallback {

    private GoogleMap mMap; //구글 맵 변수 선언

    /* onCreate와 onMapReady는 구글 맵 액티비티 생성 시 자동으로 추가됨 */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager()
                .findFragmentById(R.id.map);
        mapFragment.getMapAsync(this);
    }

    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap; // 구글맵 변수 할당
        setUpClusterer(); //여기서 setUpClusterer()를 호출해야 맵이 실행되면 바로 클러스터가 뜨도록 함
    }


    private ClusterManager<MyItem> mClusterManager; //클러스터 매니저 객체변수 선언

    /* 초기 클러스터 설정 */
    private void setUpClusterer() {

        //초기 맵 위치 설정
        mMap.moveCamera(CameraUpdateFactory.newLatLngZoom(new LatLng(51.503186, -0.126446), 10));

        //클러스터 매니저 객체 초기화
        mClusterManager = new ClusterManager<MyItem>(this, mMap);

        //카메라 이동 후의 콜백 설정
        mMap.setOnCameraIdleListener(mClusterManager);

        //마커 클릭 시 이벤트 설정
        mMap.setOnMarkerClickListener(mClusterManager);

        //여기서 addItems를 호출해야 클러스터에 마커들을 포함할 수 있음
        addItems();

    }

    /* 클러스터에 아이템(마커) 추가 */
    private void addItems() {

        //테스트를 위해 임의로 마커의 위도, 경도를 설정함
        double lat = 51.5145160;
        double lng = -0.1270060;

        String info; //마커의 정보를 담을 변수(NavigationView 에 출력될 부분)

        for (int i = 1; i < 10; i++) { // 반복문을 이용해 위치를 조금씩 변하게 해서 총 10개의 아이템을 만듦
            double offset = i / 60d;
            lat = lat + offset;
            lng = lng + offset;
            info = i + "";

            MyItem offsetItem = new MyItem(lat, lng, info); //새로 만든 생성자를 이용해 아이템 객체 생성
            mClusterManager.addItem(offsetItem); //클러스터 매니저에 아이템 등록

        }

        //클러스터 클릭 시 이벤트 구현
        mClusterManager.setOnClusterClickListener(new ClusterManager.OnClusterClickListener<MyItem>() {
            @Override
            public boolean onClusterClick(Cluster<MyItem> cluster) {

                //id를 찾아서 Drawer와 NavigationView 변수 설정
                DrawerLayout drawer = findViewById(R.id.drawer_layout);
                NavigationView navigation = findViewById(R.id.nav_view);
                Menu menu = navigation.getMenu(); //NavigationView에 출력될 메뉴 변수 정의

                menu.clear(); //메뉴 초기화

                //클릭한 클러스터 안에 포함된 아이템들의 정보를 item이라는 ArrayList에 저장함
                ArrayList<MyItem> item = new ArrayList<MyItem>(cluster.getItems());

                //클러스터 안에 포함된 모든 아이템들의 info를 메뉴에 추가함
                for(int i =0; i<cluster.getSize(); i++){
                    menu.add(item.get(i).getInfo());
                }

                navigation.invalidate(); //수정된 메뉴를 NavigationView에 출력

                //Drawer가 열려있지 않을 때에만 Drawer가 열리도록 함
                if (!drawer.isDrawerOpen(GravityCompat.START)) {
                    drawer.openDrawer(GravityCompat.START);
                }

                return false;
            }
        });
    }

}
