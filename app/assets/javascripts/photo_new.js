var map;
var marker;
var center = { lat: 37.67229496806523, lng: 137.88838989062504 };
var infoWindow;

//railsにデータを渡すためのIDを定義
function myFnc() {
    document.getElementById('lat_data').value = document.getElementById('lat').value;
    document.getElementById('lng_data').value = document.getElementById('lng').value;
}


function initMap() {
    map = new google.maps.Map(document.getElementById('map'), { // #sampleに地図を埋め込む
        center: center, // 地図の中心を指定
        zoom: 2 // 地図のズームを指定
    });


    ////////////////////////////////////////////////////以下、geocordingを挿入

    // 検索実行ボタンが押下されたとき
    document.getElementById('search').addEventListener('click', function() {

        var place = document.getElementById('keyword').value;
        var geocoder = new google.maps.Geocoder(); // geocoderのコンストラクタ


        //マップ表示



        geocoder.geocode({
            address: place
        }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {

                var bounds = new google.maps.LatLngBounds();

                for (var i in results) {
                    if (results[0].geometry) {
                        // 緯度経度を取得
                        latlng = results[0].geometry.location;
                        // 住所を取得
                        var address = results[0].formatted_address;
                        // 検索結果地が含まれるように範囲を拡大
                        bounds.extend(latlng);
                        // マーカーのセット
                        //setMarker(latlng);
                        // マーカーへの吹き出しの追加
                        //setInfoW(place, latlng, address);
                        // マーカーにクリックイベントを追加
                        //markerEvent();
                        //alert(latlng);
                        map.setZoom(16);
                        map.setCenter(latlng);

                        console.log(map);
                    }
                }
            } else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
                alert("見つかりません");
            } else {
                console.log(status);
                alert("エラー発生");
            }
        });

        // 結果クリアーボタン押下時
        document.getElementById('clear').addEventListener('click', function() {
            map.setZoom(2);
            map.setCenter(center);
        });
    });
    ///////////////////////////////////////////////


    //マップのイベント
    google.maps.event.addListener(map, 'rightclick', function(e) {
        //☆表示している地図上の緯度経度
        document.getElementById('lat').value = e.latLng.lat();
        document.getElementById('lng').value = e.latLng.lng();
        myFnc();
        deleteMarkers();


        marker = new google.maps.Marker({


            // マーカーの追加
            position: e.latLng, //イベントの発生した緯度・経度（位置）
            map: map, //this は map を意味します
            title: "撮影場所の登録",
            draggable: true,
            disableDoubleClickZoom: true,
            animation: google.maps.Animation.DROP
        });



            infoWindow = new google.maps.InfoWindow({
            content: "ドラッグで移動" + "<br>" + "バツで閉じる"
        });



        //マーカーのイベント
        google.maps.event.addListener(marker, 'click', function() {
            //マーカーをクリックしたとき
            infoWindow.open(map, marker); //marker の位置に情報ウィンドウを表示

        });

        // マーカーのドロップ（ドラッグ終了）時のイベント
        google.maps.event.addListener(marker, 'dragend', function(e) {
            // イベントの引数evの、プロパティ.latLngが緯度経度。
            document.getElementById('lat').value = e.latLng.lat();
            document.getElementById('lng').value = e.latLng.lng();
            myFnc();

        });

        //情報ウィンドウののイベント
        google.maps.event.addListener(infoWindow, 'closeclick', function() {
            marker.setMap(null); //マーカーを削除
            document.getElementById('lat').value = null;
            document.getElementById('lng').value = null;
            myFnc();
        });
    });

    //マーカーを削除する
    function deleteMarkers() {
        if (marker != null) {
            marker.setMap(null);
        }
        marker = null;
    }
}