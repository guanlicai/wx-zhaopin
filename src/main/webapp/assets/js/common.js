function jsUtil(){

	this.saveDate = function(formId,postUrl){
		var $form = $("#"+formId);
		$.ajax({
			type:'POST',
			url:postUrl,
			data:$form.serializeArray(),
			dataType:"json",
			cache: false,
			success: function(data){ 
				if(data.status == "success"){
					window.location.href = baseUrl + data.url;
				}
				else{
					if(data.msg != null && data.msg != ""){
						alert(data.msg);
					}
					else{
						alert("提交出错，请联系系统管理员");
					}
					
				}
			},
			error:function (msg) {
				alert("提交出错，请联系系统管理员");
	        }
		});
	};
	
	this.deleteDate = function(postUrl){
		
		
		var ids = this.getSelect();
		$.ajax({
			type:'POST',
			url:postUrl,
			data:{ids : ids},
			dataType:"json",
			cache: false,
			success: function(data){ 
				if(data.status == "success"){
					window.location.href = baseUrl + data.url;
				}
				else{
					alert(data.msg);
				}
			},
			error:function (msg) {
				alert("提交出错，请联系系统管理员");
	        }
		});
	};
	
	this.selectOne = function(){
		
		var len = $('input:checkbox[name="sbox"]:checked').length;
		
		if(len == 1){
			return true;
		}
		else{
			return false;
		}
	};
	
	this.getSelect = function(){
		
		var vals = "";
		$('input:checkbox[name="sbox"]:checked').each(function(){
			vals += $(this).val() + ",";
		})
		
		if(vals != ""){
			vals = vals.substr(0,vals.length - 1);
		}
		
		return vals;
	};
	
	this.selectAll = function(checkObj){
		
		$('input:checkbox[name="sbox"]').attr("checked", checkObj.checked);
	}
	
	

};
var JS = new jsUtil();

function Map() {
	this.map = new Array();
	var struct = function (key, value){ this.key = key; this.value = value; };
	this.get = function (key) {for (var i=0;i<this.map.length;i++){ if (this.map[i].key === key) { return this.map[i].value; } } return null;};
	this.put = function (key, value) { for (var i=0;i<this.map.length;i++){if (this.map[i].key === key){ this.map[i].value = value; return; }}	this.map[this.map.length] = new struct(key, value);};
	this.remove = function (key) { var v;	for (var i = 0; i < this.map.length; i++) {	v = this.map.pop();		if(v.key === key){ continue; }		this.map.unshift(v);}};
	this.getAKeyByIndex = function(i){ return this.map[i].key; }
	this.getAValueByIndex = function(i){ return this.map[i].value; }
	this.size = function(){ return this.map.length; };
	this.isEmpty = function(){ return this.map.length <= 0; };
	this.keySet = function(){ var keys = new Array(); for (var i=0;i<this.map.length;i++){ keys.push(this.map[i].key); } return keys;}
}