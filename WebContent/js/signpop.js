let available = false;

const id_check_db = () => {
    //정규식 확인

    const id_ch = /^[a-z][a-z0-9~!@#$%^&*()_+|<>?].{3,15}$/;
    const $ch_id = $('#ch_id');

    if ($ch_id.val() === "") {
        alert("ID를 입력해주세요>>");
        $ch_id.focus();
        return false;
    }
    if (!(id_ch.test($ch_id.val()))) {
        alert("ID 조건에 맞춰서 입력해 주세요>>");
        $ch_id.val('');
        $ch_id.focus();
        return false;
    }
    form.submit();
};


function join_datainput(check,id_ch) {
	if(id_ch==null){
		document.getElementById('ch_text').innerHTML= `<p style='color:red'>확인을 먼저하세요</p>`;
	}
	if(id_ch!=document.getElementById('ch_id').value){
		document.getElementById('ch_text').innerHTML= `<p style='color:red'>확인을 먼저하세요</p>`;
	}else{
		if(check=='0'){
			opener.document.getElementById('id').value = document.getElementById('ch_id').value;
			window.close();
		} else{
			document.getElementById('ch_text').innerHTML= `<p style='color:red'>확인을 먼저하세요</p>`
		}
	}
}