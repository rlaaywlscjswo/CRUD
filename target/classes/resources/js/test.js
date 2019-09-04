/**
 * 
 */

window.onload = function() {
	document.getElementById('sigh').onclick = function () {

		let data = ['하나', '둘', '셋', '넷'];
		let result = "";
		
		data.forEach(function(item, index) {
			result += '<span>' + item + '</span>';
		});
		document.getElementById('result').innerHTML = result;
	}
}
