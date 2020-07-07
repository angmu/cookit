/**
 * 
 */
function check(){
	
		if(input_form_ad.bTitle.value==""){
			alert('제목을 입력해주세요');
			input_form_ad.bTitle.focus();
			return false;
		}
	
		if(document.getElementById("bFile1").value==""){
			if(document.getElementById("bFile2").value==""){
				input_form_ad.f_ch.value=0;
			}else if(document.getElementById("bFile2").value!=""){
				input_form_ad.f_ch.value=2;
			}		
		}
		if(document.getElementById("bFile1").value!=""){
			if(document.getElementById("bFile2").value==""){
				input_form_ad.f_ch.value=1;
			}else if(document.getElementById("bFile2").value!=""){
				input_form_ad.f_ch.value=3;
			}	
		}
			
		return input_form_ad.submit();
}

