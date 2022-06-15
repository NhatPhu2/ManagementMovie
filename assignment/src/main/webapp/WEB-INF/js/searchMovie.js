


function searchByKeyWord(param) {
	$.ajax({
		type: 'POST',
		headers: {
			Accept: "application/json; charset=utf-8",
			"Content-Type": "application/json; charset=utf-8"
		},
		url: '${pageContext.request.contextPath}/SearchMovie?keyword='+param.value,
		success: function(result) {
			console.log(param.value)
		}
	})
}