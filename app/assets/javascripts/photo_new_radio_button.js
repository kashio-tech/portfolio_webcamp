function select_camera1() {
    radio = document.getElementsByName('selected_button_camera')
    if (radio[0].checked) {
        document.getElementById('Box1').style.display = "";
        document.getElementById('Box2').style.display = "none";
    } else if (radio[1].checked) {
        document.getElementById('Box1').style.display = " none";
        document.getElementById('Box2').style.display = "";
    }
}

function select_lense1() {
    radio = document.getElementsByName('selected_button_lense')
    if (radio[0].checked) {
        document.getElementById('Box3').style.display = "";
        document.getElementById('Box4').style.display = "none";
    } else if (radio[1].checked) {
        document.getElementById('Box3').style.display = " none";
        document.getElementById('Box4').style.display = "";
        window.onload = select_lense1;
    }
}
// //////////////////画面表示時のラジオボタン選択状態///////////////////////////////////////////////////////////////////
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('Box1').style.display = ""; //表示
    document.getElementById('Box2').style.display = "none"; //非表示
    document.getElementById('Box3').style.display = "";
    document.getElementById('Box4').style.display = "none";

}, )